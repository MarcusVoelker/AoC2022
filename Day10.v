From Coq Require Import Lists.List.
From Coq Require Import BinNums.
From Coq Require Import ZArith.BinInt.
From Coq Require Import ZArith.BinIntDef.
From Coq Require Import ZArith.Zdigits.
From Coq Require Import ZArith.Znat.
From Coq Require Import ZArith Psatz.
From Coq Require Import PeanoNat.
From Coq Require Import Strings.String.
From Coq Require Import Strings.Ascii.
Import ListNotations.

Inductive command :=
  | addx : Z -> command
  | noop : command
.

Open Scope Z_scope.

Definition test_in := [
addx 15;
addx (-11);
addx 6;
addx (-3);
addx 5;
addx (-1);
addx (-8);
addx 13;
addx 4;
noop;
addx (-1);
addx 5;
addx (-1);
addx 5;
addx (-1);
addx 5;
addx (-1);
addx 5;
addx (-1);
addx (-35);
addx 1;
addx 24;
addx (-19);
addx 1;
addx 16;
addx (-11);
noop;
noop;
addx 21;
addx (-15);
noop;
noop;
addx (-3);
addx 9;
addx 1;
addx (-3);
addx 8;
addx 1;
addx 5;
noop;
noop;
noop;
noop;
noop;
addx (-36);
noop;
addx 1;
addx 7;
noop;
noop;
noop;
addx 2;
addx 6;
noop;
noop;
noop;
noop;
noop;
addx 1;
noop;
noop;
addx 7;
addx 1;
noop;
addx (-13);
addx 13;
addx 7;
noop;
addx 1;
addx (-33);
noop;
noop;
noop;
addx 2;
noop;
noop;
noop;
addx 8;
noop;
addx (-1);
addx 2;
addx 1;
noop;
addx 17;
addx (-9);
addx 1;
addx 1;
addx (-3);
addx 11;
noop;
noop;
addx 1;
noop;
addx 1;
noop;
noop;
addx (-13);
addx (-19);
addx 1;
addx 3;
addx 26;
addx (-30);
addx 12;
addx (-1);
addx 3;
addx 1;
noop;
noop;
noop;
addx (-9);
addx 18;
addx 1;
addx 2;
noop;
noop;
addx 9;
noop;
noop;
noop;
addx (-1);
addx 2;
addx (-37);
addx 1;
addx 3;
noop;
addx 15;
addx (-21);
addx 22;
addx (-6);
addx 1;
noop;
addx 2;
addx 1;
noop;
addx (-10);
noop;
noop;
addx 20;
addx 1;
addx 2;
addx 2;
addx (-6);
addx (-11);
noop;
noop;
noop
].

Definition input := [
addx 1;
addx 5;
noop;
addx (-1);
noop;
noop;
addx 6;
addx 15;
addx (-9);
noop;
addx (-1);
addx 4;
addx 2;
addx (-22);
addx 27;
addx (-1);
addx 4;
noop;
addx 1;
addx 2;
noop;
noop;
noop;
noop;
addx 1;
addx (-33);
addx 2;
addx 5;
addx 2;
addx 3;
addx (-2);
addx 7;
noop;
addx (-2);
addx (-8);
addx 15;
addx 5;
noop;
noop;
addx (-2);
addx 2;
noop;
noop;
addx 7;
addx (-14);
noop;
addx (-2);
addx (-17);
addx 5;
addx (-4);
noop;
addx 23;
addx (-18);
noop;
noop;
noop;
addx 28;
addx (-18);
addx 4;
noop;
noop;
addx (-5);
addx 1;
addx 10;
addx 2;
noop;
noop;
addx (-30);
addx 33;
addx (-32);
noop;
noop;
addx (-2);
addx 6;
addx (-2);
addx 4;
addx 3;
addx 19;
addx 10;
addx (-5);
addx (-16);
addx 3;
addx (-2);
addx 17;
addx (-19);
addx 11;
addx 2;
addx 9;
noop;
addx (-4);
addx (-6);
addx (-7);
addx (-24);
noop;
addx 7;
addx (-2);
addx 5;
addx 2;
addx 3;
addx (-2);
addx 2;
addx 5;
addx 2;
addx 7;
addx (-2);
noop;
addx 3;
addx (-2);
addx 2;
addx 7;
noop;
addx (-2);
addx (-34);
addx 1;
addx 1;
noop;
noop;
noop;
addx 5;
noop;
noop;
addx 5;
addx (-1);
noop;
addx 6;
addx (-1);
noop;
addx 4;
addx 3;
addx 4;
addx (-1);
addx 5;
noop;
addx 5;
noop;
noop;
noop;
noop;
noop;
addx 1;
noop;
noop
].

Definition state : Type := (Z * Z * Z * list bool).

Definition c_count (c : command) :=
  match c with
  | addx _ => 2
  | noop => 1
  end.

Definition step (s : state) (c : command) :=
  let (p,pixels) := s in
  let (a,sum) := p in
  let (cycles,X) := a in
  let X' := match c with
  | addx z => X+z
  | noop => X
  end in
  let cycles' := cycles + c_count c in 
  let sum' := if andb (Z.modulo (cycles'+20) 40 <? c_count c) (cycles' <=? 240) then
    sum+X*20*Z.div cycles' 20
  else
    sum in
  let pixels' := match c_count c with
  | 1 => (Z.abs (X - Z.modulo cycles 40) <=? 1) :: pixels
  | 2 => (Z.abs (X - Z.modulo (cycles+1) 40) <=? 1) :: (Z.abs (X - Z.modulo (cycles) 40) <=? 1) :: pixels
  | _ => pixels
  end in 
  (cycles',X',sum',pixels')
.

Definition impl_1 (i : list command) :=
  let (p,pixels) := fold_left step i (0,1,0,[]) in
  let (a,sum) := p in sum.

Example test1 : impl_1 test_in = 13140. Proof. vm_compute. reflexivity. Qed.

Compute (impl_1 input).

Open Scope char_scope.

Fixpoint print_pixels (i : list bool) :=
  match i with
  | nil => EmptyString
  | true :: r => String "#" (print_pixels r)
  | false :: r => String "." (print_pixels r)
  end.

Definition impl_2 (i : list command) :=
  let (p,pixels) := fold_left step i (0,1,0,[]) in print_pixels(rev pixels).

Compute (let (p,ps) := fold_left step (firstn 28 test_in) (0,1,0,[]) in (p,print_pixels(rev ps))).

Close Scope char_scope.
Open Scope string_scope.

Example test2 : impl_2 test_in = "##..##..##..##..##..##..##..##..##..##..###...###...###...###...###...###...###.####....####....####....####....####....#####.....#####.....#####.....#####.....######......######......######......###########.......#######.......#######.....". Proof. vm_compute. reflexivity. Qed.

Compute (impl_2 input).