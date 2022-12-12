From Coq Require Import Lists.List.
From Coq Require Import BinNums.
From Coq Require Import ZArith.BinInt.
From Coq Require Import ZArith.BinIntDef.
From Coq Require Import ZArith.Zdigits.
From Coq Require Import ZArith.Znat.
From Coq Require Import NArith.Nnat.
From Coq Require Import ZArith Psatz.
From Coq Require Import PeanoNat.
Import ListNotations.

Inductive monkey :=
  | Monkey (idx : nat) (items : list N) (op : N -> N) (test : N -> bool) (throwt : nat) (throwf : nat)
.

Inductive red_monkey :=
  | RMonkey (idx : nat) (items : list N)
.

Definition reduce (m : monkey) :=
  match m with
  | Monkey idx items _ _ _ _ => RMonkey idx items
  end.

Open Scope N_scope.
Definition test_in :=  [
  Monkey 0%nat [79;98] (fun n => n * 19) (fun n => N.modulo n 23 =? 0) 2 3;
  Monkey 1%nat [54;65;75;74] (fun n => n + 6) (fun n => N.modulo n 19 =? 0) 2 0;
  Monkey 2%nat [79;60;97] (fun n => n * n) (fun n => N.modulo n 13 =? 0) 1 3;
  Monkey 3%nat [74] (fun n => n + 3) (fun n => N.modulo n 17 =? 0) 0 1
].


Definition input :=  [
  Monkey 0%nat [85;77;77] (fun n => n * 7) (fun n => N.modulo n 19 =? 0) 6 7;
  Monkey 1%nat [80;99] (fun n => n * 11) (fun n => N.modulo n 3 =? 0) 3 5;
  Monkey 2%nat [74;60;74;63;86;92;80] (fun n => n + 8) (fun n => N.modulo n 13 =? 0) 0 6;
  Monkey 3%nat [71;58;93;65;80;68;54;71] (fun n => n + 7) (fun n => N.modulo n 7 =? 0) 2 4;
  Monkey 4%nat [97;56;79;65;58] (fun n => n + 5) (fun n => N.modulo n 5 =? 0) 2 0;
  Monkey 5%nat [77] (fun n => n + 4) (fun n => N.modulo n 11 =? 0) 4 3;
  Monkey 6%nat [99;90;84;50] (fun n => n * n) (fun n => N.modulo n 17 =? 0) 7 1;
  Monkey 7%nat [50;66;61;92;64;78] (fun n => n + 3) (fun n => N.modulo n 2 =? 0) 5 1
].

Definition fail_monkey := Monkey 99%nat [] id (fun _ => false) 99%nat 99%nat.


Fixpoint update_nth {A} (n : nat) (f : A -> A) (l : list A) :=
  match n, l with
  | _, nil => nil
  | O, (a :: r) => f a :: r
  | S n, (a :: r) => a :: update_nth n f r
  end.

Section Part1.
Let monkey_item_step (monkeys : list monkey) (idx : nat) :=
  match nth idx monkeys fail_monkey with
  | (Monkey _ [] _ _ _ _) => monkeys 
  | (Monkey _ (i::r) op test throwt throwf) => 
    let i' := N.div (op i) 3 in
    let target := if test i' then throwt else throwf in
    (update_nth target (fun m => match m with | (Monkey idxt lt opt testt throwtt throwft) => Monkey idxt (lt++[i']) opt testt throwtt throwft end) 
    (update_nth idx (fun _ => Monkey idx r op test throwt throwf) monkeys))
  end.

Let Fixpoint monkey_step' (cnt : nat) (monkeys : list monkey) (idx : nat) :=
  match cnt with
  | O => monkeys
  | S n => monkey_step' n (monkey_item_step monkeys idx) idx
  end.

Let monkey_step (monkeys : list monkey) (idx : nat) (mb : list N) :=
  match nth idx monkeys fail_monkey with
  | (Monkey _ [] _ _ _ _) => (monkeys,mb)
  | (Monkey _ l _ _ _ _) => (monkey_step' (length l) monkeys idx,update_nth idx (fun n => n + N.of_nat (length l)) mb)
  end.

Let Fixpoint round' (monkeys : list monkey) (cur : nat) (mb : list N):=
  match cur with
  | O => (monkeys,mb)
  | S n => let (m',mb') := monkey_step monkeys (length monkeys - S n) mb in round' m' n mb'
  end.

Let round (monkeystate : list monkey * list N) := round' (fst monkeystate) (length (fst monkeystate)) (snd monkeystate). 

Let Fixpoint ntimes {A} (n : nat) (f : A -> A) (a : A) :=
  match n with
  | O => a
  | S n => ntimes n f (f a)
  end.

Let Fixpoint insert (l : list N) (new : N) :=
  match l with
  | nil => [new]
  | (h :: t) => if h <=? new then new :: h :: t else h :: insert t new
  end.

Let Fixpoint sort (l : list N) :=
  match l with
  | nil => nil
  | (h :: t) => insert (sort t) h
  end.

Definition impl_1 (l : list monkey) :=
  let mb := snd (ntimes 20 round (l,repeat 0 (length l))) in
  match sort mb with
  | nil => 0
  | [_] => 0
  | a :: b :: _ => a * b
  end.

End Part1.

Section Part2.
Definition monkey_item_step (monkeys : list monkey) (idx : nat) :=
  match nth idx monkeys fail_monkey with
  | (Monkey _ [] _ _ _ _) => monkeys 
  | (Monkey _ (i::r) op test throwt throwf) => 
    let i' := op i in
    let target := if test i' then throwt else throwf in
    (update_nth target (fun m => match m with | (Monkey idxt lt opt testt throwtt throwft) => Monkey idxt (lt++[i']) opt testt throwtt throwft end) 
    (update_nth idx (fun _ => Monkey idx r op test throwt throwf) monkeys))
  end.

Fixpoint monkey_step' (cnt : nat) (monkeys : list monkey) (idx : nat) :=
  match cnt with
  | O => monkeys
  | S n => monkey_step' n (monkey_item_step monkeys idx) idx
  end.

Definition monkey_step (monkeys : list monkey) (idx : nat) (mb : list N) :=
  match nth idx monkeys fail_monkey with
  | (Monkey _ [] _ _ _ _) => (monkeys,mb)
  | (Monkey _ l _ _ _ _) => (monkey_step' (length l) monkeys idx,update_nth idx (fun n => n + N.of_nat (length l)) mb)
  end.

Fixpoint round' (monkeys : list monkey) (cur : nat) (mb : list N):=
  match cur with
  | O => (monkeys,mb)
  | S n => let (m',mb') := monkey_step monkeys (length monkeys - S n) mb in round' m' n mb'
  end.

Definition round (monkeystate : list monkey * list N) := round' (fst monkeystate) (length (fst monkeystate)) (snd monkeystate). 

Fixpoint ntimes' {A} (n : positive) (f : A -> A) (a : A) :=
  match n with
  | xH => f a
  | xO n => ntimes' n (fun x => f (f x)) a
  | xI n => ntimes' n (fun x => f (f x)) (f a)
  end.

Definition ntimes {A} (n : N) (f : A -> A) (a : A) :=
  match n with
  | N0 => a
  | Npos p => ntimes' p f a
  end.

Fixpoint insert (l : list N) (new : N) :=
  match l with
  | nil => [new]
  | (h :: t) => if h <=? new then new :: h :: t else h :: insert t new
  end.

Fixpoint sort (l : list N) :=
  match l with
  | nil => nil
  | (h :: t) => insert (sort t) h
  end.

Definition impl_2 (l : list monkey) :=
  let mb := snd (ntimes 10000 round (l,repeat 0 (length l))) in
  match sort mb with
  | nil => 0
  | [_] => 0
  | a :: b :: _ => a * b
  end.

End Part2.
Example test1 : impl_1 test_in = 10605. Proof. vm_compute. reflexivity. Qed.

Compute impl_1 input.

Compute impl_2 input.

Example test2 : impl_2 test_in = 2713310158. Proof. vm_compute. reflexivity. Qed.