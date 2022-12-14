From Coq Require Import Lists.List.
From Coq Require Import Strings.Ascii.
From Coq Require Import Nat Psatz.
Import ListNotations.

Open Scope char_scope.

Definition input_stacks : list (list ascii) :=
  [
    ["J";"F";"C";"N";"D";"B";"W"];
    ["T";"S";"L";"Q";"V";"Z";"P"];
    ["T";"J";"G";"B";"Z";"P"];
    ["C";"H";"B";"Z";"J";"L";"T";"D"];
    ["S";"J";"B";"V";"G"];
    ["Q";"S";"P"];
    ["N";"P";"M";"L";"F";"D";"V";"B"];
    ["R";"L";"D";"B";"F";"M";"S";"P"];
    ["R";"T";"D";"V"]
  ]
.

Definition test_stacks : list (list ascii) :=
  [
    ["N";"Z"];
    ["D";"C";"M"];
    ["P"]
  ]
.

Definition input_moves : list (nat * nat * nat) := [
  (4,9,6);
  (7,2,5);
  (3,5,2);
  (2,2,1);
  (2,8,4);
  (1,6,9);
  (1,9,4);
  (7,1,2);
  (5,2,3);
  (5,7,4);
  (5,6,3);
  (1,7,6);
  (2,6,9);
  (3,2,4);
  (4,5,6);
  (2,7,3);
  (2,9,3);
  (1,5,2);
  (11,4,3);
  (1,2,9);
  (1,9,3);
  (2,1,6);
  (5,8,5);
  (7,5,4);
  (2,5,6);
  (6,6,4);
  (17,3,4);
  (1,8,3);
  (11,4,7);
  (1,6,4);
  (3,4,2);
  (2,2,6);
  (8,3,1);
  (8,3,9);
  (3,9,6);
  (3,1,3);
  (11,7,5);
  (1,6,4);
  (4,9,6);
  (3,1,4);
  (1,2,3);
  (1,6,9);
  (24,4,9);
  (2,6,5);
  (1,1,2);
  (1,1,3);
  (12,9,6);
  (5,4,2);
  (4,2,3);
  (5,6,3);
  (13,6,7);
  (1,5,6);
  (9,5,3);
  (4,7,5);
  (1,6,1);
  (3,5,1);
  (14,9,4);
  (2,7,9);
  (13,4,9);
  (1,4,7);
  (4,7,9);
  (3,5,1);
  (8,3,9);
  (4,1,4);
  (8,3,7);
  (3,7,6);
  (4,4,2);
  (3,1,9);
  (6,2,6);
  (3,3,1);
  (7,9,7);
  (2,6,5);
  (1,5,3);
  (3,7,5);
  (5,7,4);
  (2,1,4);
  (5,5,9);
  (6,4,1);
  (6,7,8);
  (22,9,3);
  (7,1,8);
  (4,9,6);
  (1,4,5);
  (8,6,4);
  (7,8,1);
  (1,6,4);
  (1,9,4);
  (1,1,2);
  (1,2,5);
  (1,9,8);
  (11,3,7);
  (1,6,2);
  (2,1,5);
  (1,8,2);
  (1,7,8);
  (4,5,7);
  (1,6,9);
  (6,3,1);
  (6,3,1);
  (15,7,5);
  (1,3,1);
  (1,3,6);
  (1,6,8);
  (14,5,1);
  (16,1,3);
  (2,8,9);
  (1,7,4);
  (3,9,8);
  (3,8,7);
  (2,3,5);
  (1,7,1);
  (6,8,5);
  (2,2,9);
  (1,7,2);
  (2,9,2);
  (5,4,7);
  (3,2,7);
  (14,1,5);
  (2,4,7);
  (8,7,6);
  (1,1,5);
  (1,7,4);
  (1,7,5);
  (1,1,8);
  (12,3,4);
  (1,8,7);
  (3,4,1);
  (1,6,2);
  (8,5,2);
  (1,7,6);
  (1,1,7);
  (6,6,2);
  (1,1,2);
  (14,5,7);
  (1,6,4);
  (4,4,7);
  (1,1,6);
  (1,5,6);
  (2,3,1);
  (14,7,5);
  (10,4,7);
  (1,1,9);
  (1,5,9);
  (11,5,1);
  (6,7,6);
  (1,4,6);
  (1,3,7);
  (2,1,5);
  (13,2,1);
  (10,6,7);
  (4,5,2);
  (1,9,1);
  (1,3,6);
  (2,5,2);
  (1,9,3);
  (1,3,1);
  (21,7,5);
  (1,6,4);
  (4,5,1);
  (1,4,1);
  (6,2,3);
  (1,3,6);
  (1,3,8);
  (1,8,7);
  (1,7,3);
  (9,5,3);
  (24,1,4);
  (1,3,7);
  (11,3,8);
  (1,7,3);
  (1,2,4);
  (2,2,1);
  (2,3,5);
  (1,6,5);
  (10,4,6);
  (2,6,4);
  (5,1,2);
  (1,6,7);
  (8,8,6);
  (4,2,7);
  (8,6,7);
  (1,2,8);
  (1,8,3);
  (1,7,4);
  (3,4,1);
  (2,6,7);
  (4,1,9);
  (3,6,7);
  (10,7,4);
  (2,3,9);
  (2,6,9);
  (2,1,8);
  (2,9,5);
  (4,5,6);
  (3,8,1);
  (4,4,8);
  (5,8,4);
  (1,8,2);
  (5,5,9);
  (1,6,1);
  (2,1,7);
  (22,4,8);
  (4,8,7);
  (2,6,7);
  (1,2,6);
  (16,8,9);
  (3,7,4);
  (1,5,9);
  (2,6,7);
  (1,8,2);
  (1,2,3);
  (24,9,3);
  (1,1,7);
  (3,5,1);
  (4,4,6);
  (15,3,6);
  (18,6,2);
  (3,3,2);
  (4,1,6);
  (4,7,3);
  (1,3,9);
  (4,2,1);
  (1,8,7);
  (3,9,6);
  (1,9,3);
  (4,7,3);
  (2,4,2);
  (1,1,2);
  (7,3,5);
  (8,6,1);
  (1,9,2);
  (3,7,5);
  (1,4,8);
  (3,1,7);
  (5,7,6);
  (3,5,2);
  (3,7,3);
  (5,5,9);
  (5,3,6);
  (1,8,3);
  (5,9,7);
  (7,2,4);
  (11,2,7);
  (7,1,6);
  (1,1,9);
  (5,3,6);
  (5,2,1);
  (1,3,9);
  (1,3,7);
  (6,6,2);
  (10,6,7);
  (5,6,7);
  (28,7,8);
  (2,9,1);
  (1,6,3);
  (4,7,5);
  (1,3,6);
  (7,2,7);
  (6,7,3);
  (1,5,9);
  (1,6,2);
  (1,7,3);
  (1,9,1);
  (4,5,2);
  (5,3,5);
  (2,2,8);
  (4,4,7);
  (1,4,7);
  (2,3,6);
  (5,7,1);
  (2,5,8);
  (2,5,8);
  (2,5,3);
  (2,3,1);
  (2,6,7);
  (31,8,3);
  (2,8,5);
  (2,7,4);
  (7,1,4);
  (2,5,1);
  (3,2,8);
  (2,4,6);
  (3,1,2);
  (6,4,8);
  (1,1,8);
  (1,6,5);
  (11,8,9);
  (1,6,8);
  (1,4,1);
  (1,8,7);
  (1,5,8);
  (3,2,1);
  (2,4,3);
  (1,8,1);
  (7,3,6);
  (12,3,2);
  (1,7,9);
  (4,6,1);
  (1,6,3);
  (12,9,3);
  (1,6,4);
  (1,1,7);
  (1,4,1);
  (1,7,2);
  (1,6,5);
  (1,5,6);
  (5,3,1);
  (1,6,4);
  (7,2,1);
  (3,2,6);
  (1,4,5);
  (3,3,2);
  (4,2,8);
  (1,6,4);
  (1,4,9);
  (1,5,1);
  (11,1,5);
  (10,1,8);
  (2,6,4);
  (1,2,9);
  (1,2,4);
  (18,3,5);
  (4,1,4);
  (3,1,2);
  (14,8,5);
  (2,2,6);
  (1,3,2);
  (2,2,7);
  (3,4,1);
  (2,4,3);
  (2,3,4);
  (2,6,9);
  (1,7,1);
  (3,1,4);
  (4,9,7);
  (31,5,2);
  (25,2,4);
  (13,4,2);
  (10,2,3);
  (2,5,7);
  (5,2,9);
  (7,5,7);
  (5,7,4);
  (1,5,8);
  (2,7,3);
  (11,4,8);
  (1,7,3);
  (1,1,4);
  (2,5,3);
  (3,2,9);
  (8,9,6);
  (10,8,2);
  (5,3,2);
  (1,7,3);
  (3,7,3);
  (15,2,1);
  (11,1,3);
  (1,8,2);
  (8,6,5);
  (1,2,6);
  (1,6,1);
  (12,3,7);
  (1,2,9);
  (2,4,1);
  (3,1,8);
  (1,8,7);
  (3,3,4);
  (1,4,7);
  (15,7,9);
  (1,7,5);
  (4,1,8);
  (6,8,6);
  (1,6,2);
  (5,5,1);
  (2,6,8);
  (1,2,7);
  (1,8,2);
  (1,7,1);
  (1,5,8);
  (6,3,1);
  (4,3,8);
  (7,8,5);
  (1,2,4);
  (2,4,2);
  (3,6,4);
  (5,9,3);
  (4,1,4);
  (10,5,9);
  (8,1,7);
  (1,2,1);
  (1,1,9);
  (20,9,2);
  (12,2,3);
  (17,4,3);
  (6,7,2);
  (5,3,8);
  (20,3,5);
  (2,9,4);
  (3,3,1);
  (1,7,1);
  (6,3,6);
  (4,2,3);
  (4,5,3);
  (1,1,9);
  (6,6,1);
  (3,8,4);
  (1,9,8);
  (2,2,1);
  (3,3,2);
  (1,3,6);
  (1,7,4);
  (3,3,6);
  (6,1,5);
  (9,2,4);
  (3,2,5);
  (2,6,5);
  (16,4,8);
  (18,8,6);
  (1,4,5);
  (2,6,7);
  (4,1,7);
  (22,5,6);
  (1,4,9);
  (4,7,6);
  (11,6,5);
  (9,5,2);
  (2,2,3);
  (2,7,2);
  (1,1,7);
  (9,6,2);
  (1,5,1);
  (1,8,9);
  (18,6,8);
  (1,7,4);
  (4,5,1);
  (2,5,2);
  (2,2,5);
  (1,9,5);
  (1,5,9);
  (1,9,1);
  (1,9,2);
  (1,4,8);
  (4,1,4);
  (2,6,5);
  (1,1,9);
  (3,6,7);
  (1,6,9);
  (1,9,8);
  (2,5,9);
  (3,3,5);
  (7,2,3);
  (1,1,3);
  (2,5,9);
  (1,5,7);
  (10,8,3);
  (10,8,9);
  (3,4,3);
  (9,2,1);
  (4,9,6);
  (5,1,9);
  (2,5,9);
  (1,6,4);
  (4,7,2);
  (7,2,9);
  (3,6,8);
  (1,1,3);
  (2,8,5);
  (1,8,1);
  (18,3,6);
  (15,9,2);
  (8,9,1);
  (2,9,2);
  (2,4,9);
  (2,9,7);
  (12,6,3);
  (7,1,7);
  (12,2,5);
  (7,3,2);
  (4,3,4);
  (2,7,6);
  (7,7,8);
  (1,4,2);
  (4,1,8);
  (5,3,1);
  (9,8,3);
  (1,8,7);
  (2,1,2);
  (4,6,7);
  (11,2,5);
  (2,4,6);
  (1,8,2);
  (7,3,2);
  (1,2,4);
  (4,6,1);
  (7,5,8);
  (2,3,1);
  (7,2,3);
  (6,5,1);
  (1,4,2);
  (8,1,6);
  (3,2,9)
].

Definition test_moves : list (nat * nat * nat) := [
  (1,2,1);
  (3,1,3);
  (2,2,1);
  (1,1,2)
].

Fixpoint edit {A} (idx : nat) (f : A -> A) (l : list A) :=
  match idx, l with
  | _,nil => nil
  | 0, (x :: r) => f x :: r
  | S i, (x :: r) => x :: edit i f r
  end.

Fixpoint drop {A} (cnt : nat) (l : list A) :=
  match cnt,l with
  | 0,_ => l
  | _,nil => []
  | S i, (x :: r) => drop i r
  end.

Definition step1 (mov : nat * nat * nat) (state : list (list ascii)) :=
  let (movfst,to) := mov in
  let (cnt,from) := movfst in
  let movd := firstn cnt (nth (from-1) state []) in
  let rest := edit (from-1) (drop cnt) state in
  edit (to-1) (fun x => rev movd ++ x) rest.

Definition step2 (mov : nat * nat * nat) (state : list (list ascii)) :=
  let (movfst,to) := mov in
  let (cnt,from) := movfst in
  let movd := firstn cnt (nth (from-1) state []) in
  let rest := edit (from-1) (drop cnt) state in
  edit (to-1) (fun x => movd ++ x) rest.

Definition flip {A} {B} {C} (f : A -> B -> C) (b : B) (a : A) : C :=
  f a b.

Definition impl_1 (stacks : list (list ascii)) (moves : list (nat * nat * nat)) := map (hd "0") (fold_left (flip step1) moves stacks).

Definition impl_2 (stacks : list (list ascii)) (moves : list (nat * nat * nat)) := map (hd "0") (fold_left (flip step2) moves stacks).

Example test_works1 : impl_1 test_stacks test_moves = ["C";"M";"Z"].
Proof.
  vm_compute. reflexivity.
Qed.

Example test_works2 : impl_2 test_stacks test_moves = ["M";"C";"D"].
Proof.
  vm_compute. reflexivity.
Qed.

Compute (impl_1 input_stacks input_moves).
Compute (impl_2 input_stacks input_moves).

Close Scope char_scope.

Fixpoint lsum (l : list nat) : nat :=
  match l with
  | nil => 0
  | x :: r => x + lsum r
  end.

Lemma sum_0_all_0 (l : list nat) : lsum l = 0 <-> forall n, In n l -> n = 0.
Proof.
  split.
  - intros. induction n.
  -- auto.
  -- exfalso. induction l.
  --- inversion H0.
  --- simpl in *. apply Plus.plus_is_O in H. destruct H. destruct H0.
  ---- subst. inversion H0.
  ---- apply IHl;auto.
  - intros. induction l.
  -- reflexivity.
  -- simpl. apply PeanoNat.Nat.eq_add_0. split.
  --- apply H. left. auto.
  --- apply IHl. intros. apply H. right. auto.
Qed.

Lemma edit_nil {A} (idx : nat) (f : A -> A) : edit idx f [] = [].
Proof.
  destruct idx;auto.
Qed.

Lemma lsum_map {A} (f : A -> nat) (a : A) (l : list A) : lsum (map f (a :: l)) = f a + lsum (map f l).
Proof.
  reflexivity.
Qed.

Lemma double_edit {A} (f1 f2 : A -> A) (i : nat) (l : list A) : edit i f2 (edit i f1 l) = edit i (fun x => f2 (f1 x)) l.
Proof.
  generalize dependent i.
  induction l.
  - destruct i; reflexivity.
  - destruct i; auto. simpl. rewrite (IHl i). reflexivity.
Qed.

Lemma lsum_mod_inv (l : list nat) (i1 i2 d : nat) : length l > i1 /\ length l > i2 /\ nth i1 l 0 >= d -> lsum l = lsum (edit i2 (fun n => n + d) (edit i1 (fun n => n - d) l)).
Proof.
  intro H. destruct H as [Hin1 [Hin2 Hge]].
  destruct (i1 <=? i2) eqn:Hfstle.
  - apply PeanoNat.Nat.leb_le in Hfstle. destruct (i1 =? i2) eqn:Hfsteq.
  -- apply PeanoNat.Nat.eqb_eq in Hfsteq. clear Hfstle. subst. rewrite double_edit. generalize dependent i2. induction l.
  --- simpl. destruct i2; auto.
  --- simpl. destruct i2; auto.
  ---- simpl. intros. rewrite PeanoNat.Nat.sub_add; auto.
  ---- simpl. intros. rewrite (IHl i2);auto; lia.
  -- rewrite PeanoNat.Nat.eqb_neq in Hfsteq. assert (i1 < i2). { lia. } clear Hfstle. clear Hfsteq. generalize dependent i2. induction i1.
  --- intros. destruct l.
  ---- simpl. rewrite edit_nil. reflexivity.
  ---- simpl. destruct i2. { lia. } clear H. simpl. generalize dependent i2. induction l.
  ----- intros. simpl in Hin2. lia.
  ----- intros. simpl in *. clear Hin1. destruct i2.
  ------ simpl. lia.
  ------ simpl. assert (S (length l) > 0). { lia. }
         assert (S (length l) > S i2). { lia. }
         pose (IHl H Hge i2 H0). lia.
  --- 
Qed.

Theorem box_length_const (mov : nat * nat * nat) (state : list (list ascii)) : lsum (map (fun l => length l) state) = lsum (map (fun l => length l) (step1 mov state)).
Proof.
  destruct mov as [[cnt from] to].
Admitted.
