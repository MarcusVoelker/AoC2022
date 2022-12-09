From Coq Require Import Lists.List.
From Coq Require Import Strings.String.
From Coq Require Import Strings.Ascii.
From Coq Require Import Nat Psatz.
Import ListNotations.

Section Zipper.

Variable Label : Type.
Variable Content : Type.

Variable l_comp : Label -> Label -> bool.

Inductive tree :=
  | t_node : Label -> list tree -> tree
  | t_leaf : Label -> Content -> tree
.

Inductive context :=
  | ctx_top : context
  | ctx_idx : nat -> Label -> list tree -> context -> context
.

Definition zipper : Type := (tree * context).

Definition op_bind {A B} (o : option A) (f : A -> option B) :=
  match o with
  | None => None
  | Some a => f a
  end.

Fixpoint find_idx' {A} (f : A -> bool) (l : list A) (n : nat) : option (A * nat) :=
  match l with
  | nil => None
  | a :: r => if f a then Some (a,n) else find_idx' f r (S n)
  end.

Definition find_idx {A} (f : A -> bool) (l : list A) := find_idx' f l 0.

Fixpoint remove_nth {A} (n : nat) (l : list A) :=
  match n, l with
  | _,nil => nil
  | O, (a::r) => r
  | S n, (a :: r) => a :: remove_nth n r
  end.

Fixpoint insert_at {A} (n : nat) (a : A) (l : list A) :=
  match n, l with
  | _,nil => [a]
  | O, r => a :: r 
  | (S n),(h :: r) => h :: insert_at n a r
  end.

Definition step_down (z : zipper) (l : Label) : option zipper :=
  match z with
  | (t_node n cs, ctx) => 
    let ft := find_idx (fun x => match x with | t_node l' cs' => l_comp l l' | _ => false end) cs in
    op_bind ft (fun pair => let (t0,i) := pair in
      Some (t0,ctx_idx i n (remove_nth i cs) ctx)
    )
  | _ => None
  end.

Definition step_up (z : zipper) : option zipper :=
  match z with
  | (_,ctx_top) => None 
  | (t,ctx_idx i s cs ctx') => Some (t_node s (insert_at i t cs), ctx')
  end.

Fixpoint to_top' (t : tree) (ctx : context) : zipper :=
  match ctx with
  | ctx_top => (t,ctx_top)
  | ctx_idx i s cs ctx' => to_top' (t_node s (insert_at i t cs)) ctx'
  end.

Definition to_top (z : zipper) : tree :=
  match z with
  | (t,ctx) => match to_top' t ctx with (t',_) => t' end
  end.

