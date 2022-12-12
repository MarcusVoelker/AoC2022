From Coq Require Import Lists.List.
From Coq Require Import BinNums.
From Coq Require Import ZArith.BinInt.
From Coq Require Import ZArith.BinIntDef.
From Coq Require Import ZArith.Zdigits.
From Coq Require Import ZArith.Znat.
From Coq Require Import NArith.Nnat.
From Coq Require Import ZArith Psatz.
From Coq Require Import PeanoNat.
From Coq Require Import Strings.String.
From Coq Require Import Strings.Ascii.
Import ListNotations.

Open Scope string_scope.
Definition test_in := [
"Sabqponm";
"abcryxxl";
"accszExk";
"acctuvwj";
"abdefghi"
].
Close Scope string_scope.

Fixpoint deop {A} (l : list (option A)) : list A :=
  match l with
  | nil => nil
  | None :: r => deop r
  | (Some a) :: r => a :: deop r
  end.

Fixpoint transpose' {A} (n : nat) (l : list (list A)) : list (list A) :=
  match n with
  | O => nil
  | S n =>
    let fsts := deop (map (fun ll => hd_error ll) l) in
    let tls := map (fun ll => tl ll) l in
    fsts :: transpose' n tls
  end.

Definition transpose {A} (l : list (list A)) : list (list A) :=
  transpose' (List.length (hd nil l)) l.

Fixpoint zip {A B} (l1 : list A) (l2 : list B) : list (A*B) :=
  match l1,l2 with
  | nil,_ => nil
  | _,nil => nil
  | (a :: ra),(b :: rb) => (a,b) :: zip ra rb
  end.

Fixpoint range (n1 n2 : nat) :=
  match n2 with
  | O => nil
  | S n => n1 :: range (S n1) n
  end.

Definition dist (n1 n2 : nat) := if n1 <=? n2 then n2 - n1 else n1 - n2.

Fixpoint line_adj' (row : nat) (s : list (nat * (ascii * ascii))) : list ((nat * nat)*(nat * nat)) :=
  match s with
  | nil => nil
  | (idx,(c1,c2)) :: r => (if dist (nat_of_ascii c1) (nat_of_ascii c2) <=? 1 then [((row,idx+1),(row,idx));((row,idx),(row,idx+1))] else []) ++ line_adj' row r
  end.

Definition line_adj (row : nat) (la : list ascii) : list ((nat * nat)*(nat * nat)) :=
  let ps := zip la (tl la) in
  let idxl := zip (range 0 (List.length ps)) ps in
  line_adj' row idxl
  .

Fixpoint bind {A B} (l : list A) (f : A -> list B) : list B :=
  match l with
  | nil => nil
  | a :: r => f a ++ bind r f
  end.

Definition once_adj (l : list (list ascii)) : list ((nat*nat)*(nat*nat)) :=
  let idxl := zip (range 0 (List.length l)) l in
  bind idxl (fun p => let (idx,r) := p in line_adj idx r).

Definition full_adj (la : list (list ascii)) : list ((nat*nat)*(nat*nat)) :=
  let adj1 := once_adj la in
  let adj2 := map (fun p => ((snd (fst p),fst (fst p)),(snd (snd p),fst (snd p))))
  (once_adj (transpose la)) in
  adj1 ++ adj2.

Fixpoint update_fst {A} (c : A -> bool) (def : A) (f : A -> A) (l : list A) :=
  match l with
  | nil => [def]
  | (a :: r) => if c a then f a :: r else a :: update_fst c def f r
  end.

Fixpoint update_all {A} (c : A -> bool) (f : A -> A) (l : list A) :=
  match l with
  | nil => nil
  | (a :: r) => if c a then f a :: update_all c f r else a :: update_all c f r
  end.

Definition adj_list := list (nat*nat*list (nat*nat)).

Fixpoint adj' (l : list ((nat*nat)*(nat*nat))) : adj_list :=
  match l with
  | nil => nil
  | (((a,b),(c,d))) :: r => update_fst (fun p => andb (a =? fst (fst p)) (b =? snd (fst p))) ((a,b),[(c,d)]) (fun p => (fst p, (c,d) ::snd p)) (adj' r)
  end.

Definition adj (l : list (list ascii)) := adj' (full_adj l).

Compute adj (map (update_all (fun x => Ascii.eqb x "S"%char) (fun _ => "a"%char)) (map list_ascii_of_string test_in)).

Fixpoint find_char' (ca : ascii) (l : list (nat*nat*ascii)) : (nat*nat) :=
  match l with
  | nil => (0,0)
  | (y,x,c) :: r => if Ascii.eqb c ca then (x,y) else find_char' ca r
  end.

Definition find_char (ca : ascii) (l : list (list ascii)) : (nat*nat) :=
  let z1 := zip (range 0 (List.length l)) l in
  let z2 := bind z1 (fun p => zip (zip (repeat (fst p) (List.length (snd p)))(range 0 (List.length (snd p)))) (snd p)) in find_char' ca z2.

Definition source (l : list (list ascii)) : (nat*nat) := find_char "S"%char l .

Definition target (l : list (list ascii)) : (nat*nat) := find_char "E"%char l .

Definition dijkstra (src : (nat * nat)) (tgt : (nat * nat)) (l : adj_list) : list (nat * nat). Admitted.