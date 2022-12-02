From Coq Require Import Lists.List.
From Coq Require Import BinNums.
From Coq Require Import ZArith.BinInt.
From Coq Require Import ZArith.BinIntDef.
From Coq Require Import ZArith.Zdigits.
From Coq Require Import ZArith Psatz.
Import ListNotations.

Open Scope Z_scope.

Inductive MMove :=
  | MX 
  | MY
  | MZ
.

Inductive EMove :=
  | EA
  | EB
  | EC
.

Inductive Rule :=
  | R : EMove -> MMove -> Rule
.

Definition input : list Rule := [
  R EC MY;
  R EC MZ;
  R EC MZ;
  R EC MZ;
  R EA MY;
  R EC MZ;
  R EC MZ;
  R EB MY;
  R EC MY;
  R EA MX;
  R EC MZ;
  R EA MZ;
  R EC MY;
  R EC MZ;
  R EC MZ;
  R EB MX;
  R EA MZ;
  R EC MZ;
  R EC MZ;
  R EC MZ;
  R EA MZ;
  R EB MX;
  R EC MY;
  R EC MZ;
  R EC MZ;
  R EC MZ;
  R EC MY;
  R EC MZ;
  R EC MZ;
  R EC MZ;
  R EC MZ;
  R EC MZ;
  R EA MZ;
  R EB MX;
  R EA MZ;
  R EC MZ;
  R EC MZ;
  R EC MZ;
  R EC MZ;
  R EA MZ;
  R EA MX;
  R EB MX;
  R EC MY;
  R EA MZ;
  R EA MZ;
  R EC MY;
  R EA MZ;
  R EA MZ;
  R EC MY;
  R EA MZ;
  R EB MX;
  R EA MZ;
  R EC MZ;
  R EB MX;
  R EC MY;
  R EC MZ;
  R EC MZ;
  R EB MZ;
  R EC MY;
  R EC MZ;
  R EA MZ;
  R EC MX;
  R EC MZ;
  R EB MX;
  R EB MY;
  R EC MZ;
  R EC MZ;
  R EC MY;
  R EA MZ;
  R EC MY;
  R EC MY;
  R EB MX;
  R EA MZ;
  R EB MZ;
  R EC MZ;
  R EC MZ;
  R EC MZ;
  R EB MX;
  R EA MX;
  R EB MY;
  R EC MZ;
  R EC MY;
  R EC MY;
  R EA MZ;
  R EA MZ;
  R EC MZ;
  R EC MZ;
  R EC MZ;
  R EA MX;
  R EA MX;
  R EC MY;
  R EC MZ;
  R EA MZ;
  R EC MY;
  R EA MZ;
  R EA MZ;
  R EC MZ;
  R EA MZ;
  R EC MY;
  R EC MZ;
  R EA MZ;
  R EA MX;
  R EC MZ;
  R EC MZ;
  R EA MZ;
  R EB MY;
  R EA MZ;
  R EB MX;
  R EC MZ;
  R EC MY;
  R EA MX;
  R EC MZ;
  R EC MY;
  R EC MZ;
  R EC MZ;
  R EB MY;
  R EC MZ;
  R EA MZ;
  R EC MZ;
  R EB MX;
  R EC MZ;
  R EC MY;
  R EA MZ;
  R EB MY;
  R EB MX;
  R EB MX;
  R EA MX;
  R EB MX;
  R EA MZ;
  R EB MX;
  R EA MY;
  R EA MX;
  R EA MZ;
  R EA MZ;
  R EC MY;
  R EB MX;
  R EC MZ;
  R EC MZ;
  R EA MX;
  R EA MZ;
  R EA MY;
  R EB MX;
  R EA MY;
  R EA MZ;
  R EC MZ;
  R EA MX;
  R EC MZ;
  R EC MZ;
  R EC MZ;
  R EB MX;
  R EC MZ;
  R EC MY;
  R EC MY;
  R EC MZ;
  R EA MZ;
  R EC MZ;
  R EB MX;
  R EA MZ;
  R EC MY;
  R EA MX;
  R EA MZ;
  R EA MY;
  R EC MZ;
  R EA MZ;
  R EC MZ;
  R EC MZ;
  R EA MZ;
  R EC MY;
  R EA MZ;
  R EC MZ;
  R EA MZ;
  R EC MZ;
  R EB MX;
  R EC MZ;
  R EA MZ;
  R EC MZ;
  R EC MX;
  R EB MY;
  R EA MZ;
  R EC MZ;
  R EC MY;
  R EC MZ;
  R EA MZ;
  R EC MY;
  R EB MZ;
  R EA MX;
  R EA MZ;
  R EB MX;
  R EC MY;
  R EC MZ;
  R EB MX;
  R EC MY;
  R EC MY;
  R EA MZ;
  R EB MX;
  R EC MY;
  R EC MY;
  R EA MZ;
  R EC MX;
  R EB MX;
  R EB MY;
  R EC MY;
  R EC MZ;
  R EB MX;
  R EC MZ;
  R EA MZ;
  R EA MZ;
  R EB MX;
  R EB MX;
  R EC MY;
  R EC MZ;
  R EB MX;
  R EC MZ;
  R EA MZ;
  R EB MX;
  R EC MY;
  R EC MZ;
  R EC MZ;
  R EA MX;
  R EB MX;
  R EA MZ;
  R EC MZ;
  R EA MX;
  R EC MY;
  R EB MY;
  R EB MX;
  R EC MZ;
  R EC MY;
  R EC MY;
  R EA MY;
  R EC MZ;
  R EC MY;
  R EC MZ;
  R EC MZ;
  R EA MZ;
  R EC MZ;
  R EC MY;
  R EA MZ;
  R EC MY;
  R EC MZ;
  R EC MY;
  R EC MX;
  R EB MX;
  R EA MX;
  R EB MX;
  R EC MZ;
  R EA MZ;
  R EC MY;
  R EC MZ;
  R EB MX;
  R EC MX;
  R EB MX;
  R EC MZ;
  R EC MZ;
  R EC MY;
  R EB MX;
  R EC MZ;
  R EA MY;
  R EC MZ;
  R EA MX;
  R EC MZ;
  R EC MZ;
  R EC MY;
  R EC MZ;
  R EC MX;
  R EB MX;
  R EC MZ;
  R EC MZ;
  R EC MY;
  R EB MY;
  R EC MZ;
  R EA MX;
  R EC MX;
  R EC MY;
  R EA MZ;
  R EC MX;
  R EA MZ;
  R EC MY;
  R EC MZ;
  R EC MZ;
  R EB MX;
  R EA MX;
  R EC MZ;
  R EB MX;
  R EC MY;
  R EB MX;
  R EA MX;
  R EA MZ;
  R EA MZ;
  R EC MZ;
  R EC MZ;
  R EB MX;
  R EC MZ;
  R EA MZ;
  R EC MX;
  R EC MZ;
  R EC MZ;
  R EC MZ;
  R EC MY;
  R EC MY;
  R EA MZ;
  R EC MZ;
  R EC MZ;
  R EC MZ;
  R EC MZ;
  R EC MZ;
  R EC MZ;
  R EC MZ;
  R EC MZ;
  R EC MZ;
  R EA MZ;
  R EC MZ;
  R EC MY;
  R EC MY;
  R EA MZ;
  R EC MZ;
  R EA MZ;
  R EA MX;
  R EC MZ;
  R EC MY;
  R EC MZ;
  R EC MZ;
  R EC MZ;
  R EC MZ;
  R EC MY;
  R EC MZ;
  R EA MZ;
  R EB MX;
  R EA MX;
  R EB MX;
  R EA MY;
  R EC MZ;
  R EC MY;
  R EA MZ;
  R EC MX;
  R EC MZ;
  R EC MZ;
  R EC MZ;
  R EC MZ;
  R EC MY;
  R EA MX;
  R EB MZ;
  R EA MZ;
  R EC MZ;
  R EA MX;
  R EC MZ;
  R EC MZ;
  R EA MZ;
  R EC MZ;
  R EC MZ;
  R EA MZ;
  R EC MZ;
  R EB MX;
  R EC MZ;
  R EA MX;
  R EC MY;
  R EA MZ;
  R EB MX;
  R EB MX;
  R EC MZ;
  R EB MZ;
  R EC MZ;
  R EB MX;
  R EC MY;
  R EB MX;
  R EC MY;
  R EA MZ;
  R EA MY;
  R EA MZ;
  R EC MZ;
  R EC MZ;
  R EA MZ;
  R EC MZ;
  R EA MX;
  R EA MZ;
  R EC MY;
  R EA MX;
  R EC MY;
  R EC MZ;
  R EC MZ;
  R EC MZ;
  R EA MX;
  R EC MY;
  R EA MZ;
  R EA MZ;
  R EA MX;
  R EC MZ;
  R EC MZ;
  R EB MY;
  R EA MX;
  R EC MY;
  R EC MY;
  R EC MZ;
  R EC MZ;
  R EA MZ;
  R EA MZ;
  R EC MY;
  R EC MZ;
  R EA MZ;
  R EC MY;
  R EC MZ;
  R EA MZ;
  R EC MZ;
  R EA MZ;
  R EC MZ;
  R EA MZ;
  R EC MZ;
  R EC MZ;
  R EA MZ;
  R EA MZ;
  R EC MZ;
  R EA MZ;
  R EC MZ;
  R EA MZ;
  R EC MZ;
  R EC MZ;
  R EA MZ;
  R EC MZ;
  R EB MY;
  R EA MZ;
  R EB MX;
  R EC MY;
  R EC MY;
  R EC MZ;
  R EA MZ;
  R EA MX;
  R EC MZ;
  R EC MZ;
  R EC MZ;
  R EB MZ;
  R EC MZ;
  R EC MZ;
  R EC MZ;
  R EA MZ;
  R EC MZ;
  R EC MZ;
  R EA MX;
  R EC MZ;
  R EC MY;
  R EA MX;
  R EA MZ;
  R EC MZ;
  R EC MZ;
  R EA MZ;
  R EC MX;
  R EA MZ;
  R EC MZ;
  R EC MY;
  R EA MZ;
  R EA MY;
  R EA MZ;
  R EC MZ;
  R EC MZ;
  R EC MZ;
  R EC MZ;
  R EC MX;
  R EC MZ;
  R EC MZ;
  R EB MX;
  R EB MX;
  R EA MZ;
  R EC MZ;
  R EC MZ;
  R EA MZ;
  R EA MZ;
  R EA MZ;
  R EC MY;
  R EC MZ;
  R EC MZ;
  R EC MY;
  R EC MY;
  R EC MZ;
  R EC MZ;
  R EB MX;
  R EA MZ;
  R EC MZ;
  R EC MY;
  R EA MZ;
  R EC MZ;
  R EA MZ;
  R EC MZ;
  R EC MY;
  R EC MY;
  R EC MZ;
  R EB MX;
  R EA MZ;
  R EB MX;
  R EC MZ;
  R EC MZ;
  R EC MZ;
  R EA MZ;
  R EC MZ;
  R EC MY;
  R EC MZ;
  R EB MY;
  R EC MZ;
  R EC MZ;
  R EC MY;
  R EA MZ;
  R EC MZ;
  R EB MX;
  R EC MZ;
  R EB MY;
  R EC MY;
  R EC MZ;
  R EC MZ;
  R EC MZ;
  R EB MY;
  R EA MZ;
  R EC MZ;
  R EA MY;
  R EA MZ;
  R EC MY;
  R EA MZ;
  R EC MZ;
  R EC MZ;
  R EC MY;
  R EB MZ;
  R EB MX;
  R EC MZ;
  R EB MZ;
  R EC MZ;
  R EC MY;
  R EB MX;
  R EC MY;
  R EC MZ;
  R EA MX;
  R EA MZ;
  R EC MY;
  R EC MY;
  R EA MZ;
  R EC MY;
  R EB MZ;
  R EB MY;
  R EC MX;
  R EB MX;
  R EC MX;
  R EC MZ;
  R EC MY;
  R EC MZ;
  R EC MZ;
  R EC MY;
  R EC MZ;
  R EA MZ;
  R EC MY;
  R EA MX;
  R EC MZ;
  R EC MZ;
  R EC MZ;
  R EC MZ;
  R EC MZ;
  R EC MZ;
  R EA MZ;
  R EB MY;
  R EC MZ;
  R EC MZ;
  R EA MZ;
  R EB MX;
  R EC MZ;
  R EC MZ;
  R EA MZ;
  R EC MZ;
  R EC MZ;
  R EA MZ;
  R EC MZ;
  R EA MX;
  R EB MY;
  R EC MY;
  R EC MY;
  R EC MX;
  R EA MZ;
  R EC MX;
  R EC MZ;
  R EB MZ;
  R EB MX;
  R EC MY;
  R EA MZ;
  R EC MZ;
  R EC MZ;
  R EA MX;
  R EA MZ;
  R EC MY;
  R EA MX;
  R EC MZ;
  R EC MZ;
  R EC MZ;
  R EA MZ;
  R EA MZ;
  R EC MZ;
  R EB MY;
  R EB MX;
  R EB MX;
  R EA MZ;
  R EC MZ;
  R EC MY;
  R EC MZ;
  R EC MZ;
  R EA MZ;
  R EA MX;
  R EC MY;
  R EA MZ;
  R EC MY;
  R EC MY;
  R EA MX;
  R EA MZ;
  R EB MX;
  R EA MZ;
  R EB MY;
  R EA MZ;
  R EC MZ;
  R EB MX;
  R EA MZ;
  R EB MX;
  R EC MY;
  R EB MZ;
  R EC MY;
  R EC MX;
  R EC MZ;
  R EC MY;
  R EB MX;
  R EB MY;
  R EB MY;
  R EC MZ;
  R EC MY;
  R EA MZ;
  R EA MZ;
  R EC MY;
  R EC MZ;
  R EC MY;
  R EB MZ;
  R EC MZ;
  R EC MX;
  R EC MZ;
  R EC MZ;
  R EB MX;
  R EC MZ;
  R EB MX;
  R EA MZ;
  R EC MZ;
  R EC MY;
  R EA MZ;
  R EC MZ;
  R EC MY;
  R EC MX;
  R EA MX;
  R EA MY;
  R EC MY;
  R EC MY;
  R EC MY;
  R EA MZ;
  R EB MZ;
  R EA MZ;
  R EC MZ;
  R EC MZ;
  R EC MZ;
  R EA MZ;
  R EA MX;
  R EA MZ;
  R EC MX;
  R EB MX;
  R EC MZ;
  R EA MX;
  R EA MZ;
  R EC MY;
  R EA MZ;
  R EA MZ;
  R EA MZ;
  R EC MZ;
  R EC MZ;
  R EA MZ;
  R EC MZ;
  R EA MZ;
  R EA MZ;
  R EC MZ;
  R EC MY;
  R EA MZ;
  R EC MY;
  R EA MZ;
  R EA MZ;
  R EA MZ;
  R EB MX;
  R EB MX;
  R EA MZ;
  R EC MZ;
  R EC MY;
  R EA MZ;
  R EC MZ;
  R EB MX;
  R EC MZ;
  R EC MZ;
  R EC MZ;
  R EA MZ;
  R EA MX;
  R EC MZ;
  R EC MZ;
  R EA MX;
  R EA MZ;
  R EC MY;
  R EC MZ;
  R EC MZ;
  R EC MZ;
  R EC MZ;
  R EC MZ;
  R EC MY;
  R EC MZ;
  R EA MZ;
  R EC MZ;
  R EB MX;
  R EB MX;
  R EA MZ;
  R EC MZ;
  R EC MY;
  R EC MY;
  R EB MX;
  R EB MX;
  R EC MY;
  R EC MX;
  R EB MX;
  R EA MZ;
  R EA MZ;
  R EC MZ;
  R EC MY;
  R EA MZ;
  R EC MZ;
  R EC MZ;
  R EC MZ;
  R EA MZ;
  R EC MZ;
  R EC MZ;
  R EB MX;
  R EC MY;
  R EC MZ;
  R EC MZ;
  R EC MZ;
  R EC MZ;
  R EC MZ;
  R EC MY;
  R EA MX;
  R EC MZ;
  R EC MZ;
  R EA MZ;
  R EA MZ;
  R EC MY;
  R EC MZ;
  R EC MZ;
  R EC MZ;
  R EA MZ;
  R EB MX;
  R EC MZ;
  R EA MX;
  R EA MZ;
  R EA MZ;
  R EC MZ;
  R EA MZ;
  R EC MZ;
  R EC MZ;
  R EC MZ;
  R EC MX;
  R EC MZ;
  R EB MX;
  R EC MX;
  R EC MY;
  R EC MZ;
  R EA MX;
  R EA MX;
  R EA MY;
  R EC MX;
  R EC MY;
  R EB MX;
  R EC MX;
  R EA MZ;
  R EC MZ;
  R EC MX;
  R EC MZ;
  R EC MY;
  R EA MX;
  R EA MZ;
  R EC MZ;
  R EC MZ;
  R EA MX;
  R EA MY;
  R EB MX;
  R EC MZ;
  R EC MZ;
  R EC MZ;
  R EB MX;
  R EC MZ;
  R EA MZ;
  R EA MY;
  R EA MZ;
  R EC MZ;
  R EB MX;
  R EA MZ;
  R EC MZ;
  R EC MZ;
  R EC MZ;
  R EB MX;
  R EC MZ;
  R EC MX;
  R EC MZ;
  R EC MZ;
  R EB MX;
  R EC MY;
  R EA MX;
  R EC MZ;
  R EC MY;
  R EC MZ;
  R EC MY;
  R EA MZ;
  R EC MZ;
  R EA MZ;
  R EA MZ;
  R EC MZ;
  R EC MZ;
  R EA MZ;
  R EC MY;
  R EC MY;
  R EB MY;
  R EA MZ;
  R EA MZ;
  R EB MX;
  R EC MZ;
  R EC MZ;
  R EA MX;
  R EB MZ;
  R EC MZ;
  R EC MZ;
  R EA MZ;
  R EA MX;
  R EC MZ;
  R EC MZ;
  R EC MX;
  R EC MZ;
  R EB MX;
  R EA MZ;
  R EC MY;
  R EA MZ;
  R EC MZ;
  R EC MZ;
  R EA MX;
  R EC MZ;
  R EC MZ;
  R EA MZ;
  R EC MZ;
  R EA MZ;
  R EB MX;
  R EC MY;
  R EA MZ;
  R EC MY;
  R EA MZ;
  R EA MY;
  R EB MX;
  R EC MZ;
  R EA MY;
  R EC MZ;
  R EC MZ;
  R EB MX;
  R EC MZ;
  R EA MX;
  R EC MZ;
  R EA MZ;
  R EA MX;
  R EC MY;
  R EB MX;
  R EC MZ;
  R EC MZ;
  R EC MY;
  R EA MX;
  R EB MX;
  R EA MX;
  R EA MZ;
  R EC MZ;
  R EB MY;
  R EC MZ;
  R EA MZ;
  R EC MZ;
  R EA MX;
  R EB MZ;
  R EC MZ;
  R EC MY;
  R EC MY;
  R EA MY;
  R EB MX;
  R EC MY;
  R EC MZ;
  R EA MY;
  R EC MY;
  R EC MY;
  R EA MZ;
  R EA MZ;
  R EC MZ;
  R EC MZ;
  R EC MZ;
  R EC MY;
  R EA MZ;
  R EC MZ;
  R EC MZ;
  R EA MZ;
  R EB MY;
  R EC MZ;
  R EC MY;
  R EC MZ;
  R EC MZ;
  R EB MY;
  R EA MX;
  R EC MZ;
  R EA MX;
  R EC MZ;
  R EC MX;
  R EA MZ;
  R EC MZ;
  R EA MZ;
  R EC MZ;
  R EB MX;
  R EC MZ;
  R EC MZ;
  R EC MX;
  R EC MZ;
  R EC MZ;
  R EA MZ;
  R EA MZ;
  R EB MZ;
  R EC MX;
  R EC MY;
  R EC MY;
  R EC MY;
  R EA MZ;
  R EC MX;
  R EC MZ;
  R EA MX;
  R EC MZ;
  R EC MZ;
  R EC MX;
  R EA MX;
  R EA MX;
  R EC MZ;
  R EA MX;
  R EB MZ;
  R EC MY;
  R EC MZ;
  R EC MY;
  R EC MZ;
  R EC MY;
  R EC MZ;
  R EA MZ;
  R EA MX;
  R EC MZ;
  R EB MY;
  R EC MZ;
  R EC MZ;
  R EB MX;
  R EC MZ;
  R EB MX;
  R EC MZ;
  R EC MY;
  R EA MX;
  R EA MZ;
  R EC MX;
  R EC MY;
  R EC MZ;
  R EC MX;
  R EC MZ;
  R EB MX;
  R EA MZ;
  R EC MX;
  R EA MY;
  R EB MZ;
  R EC MZ;
  R EB MX;
  R EC MZ;
  R EC MZ;
  R EC MY;
  R EC MZ;
  R EA MX;
  R EB MX;
  R EC MZ;
  R EA MZ;
  R EC MZ;
  R EC MZ;
  R EC MZ;
  R EA MX;
  R EC MZ;
  R EA MY;
  R EC MZ;
  R EC MZ;
  R EC MZ;
  R EC MY;
  R EA MZ;
  R EC MX;
  R EA MX;
  R EC MY;
  R EC MZ;
  R EA MZ;
  R EA MY;
  R EC MZ;
  R EB MY;
  R EC MX;
  R EA MZ;
  R EC MY;
  R EC MZ;
  R EA MX;
  R EC MZ;
  R EA MZ;
  R EB MX;
  R EA MZ;
  R EC MZ;
  R EB MZ;
  R EA MZ;
  R EA MZ;
  R EC MY;
  R EC MZ;
  R EA MY;
  R EA MZ;
  R EC MY;
  R EC MZ;
  R EC MZ;
  R EC MZ;
  R EC MY;
  R EC MX;
  R EB MX;
  R EC MZ;
  R EB MY;
  R EC MX;
  R EA MZ;
  R EC MZ;
  R EC MZ;
  R EA MZ;
  R EC MZ;
  R EB MY;
  R EA MZ;
  R EB MY;
  R EA MZ;
  R EC MY;
  R EC MZ;
  R EC MZ;
  R EA MZ;
  R EC MZ;
  R EB MY;
  R EC MX;
  R EA MZ;
  R EA MX;
  R EC MZ;
  R EC MZ;
  R EC MX;
  R EA MX;
  R EC MZ;
  R EC MY;
  R EC MZ;
  R EC MZ;
  R EC MZ;
  R EB MY;
  R EC MZ;
  R EA MZ;
  R EA MZ;
  R EB MX;
  R EA MZ;
  R EC MZ;
  R EC MZ;
  R EC MZ;
  R EA MX;
  R EC MY;
  R EC MZ;
  R EC MZ;
  R EC MZ;
  R EB MX;
  R EA MZ;
  R EA MX;
  R EB MY;
  R EB MX;
  R EB MX;
  R EC MZ;
  R EB MX;
  R EC MY;
  R EA MX;
  R EC MX;
  R EC MZ;
  R EC MZ;
  R EC MY;
  R EC MZ;
  R EC MZ;
  R EA MX;
  R EA MZ;
  R EA MX;
  R EB MY;
  R EA MX;
  R EA MZ;
  R EB MY;
  R EC MX;
  R EC MY;
  R EC MZ;
  R EC MZ;
  R EA MZ;
  R EA MX;
  R EB MY;
  R EA MZ;
  R EC MZ;
  R EC MZ;
  R EC MY;
  R EA MZ;
  R EA MX;
  R EC MZ;
  R EA MY;
  R EA MZ;
  R EA MX;
  R EB MX;
  R EB MY;
  R EC MZ;
  R EC MZ;
  R EA MZ;
  R EC MZ;
  R EA MX;
  R EA MZ;
  R EC MZ;
  R EC MY;
  R EB MX;
  R EA MZ;
  R EB MX;
  R EC MY;
  R EB MX;
  R EA MZ;
  R EA MZ;
  R EA MZ;
  R EB MY;
  R EC MZ;
  R EA MZ;
  R EC MZ;
  R EC MX;
  R EB MY;
  R EC MZ;
  R EA MZ;
  R EC MZ;
  R EA MZ;
  R EA MX;
  R EC MZ;
  R EC MZ;
  R EC MX;
  R EC MY;
  R EB MX;
  R EB MY;
  R EA MZ;
  R EA MY;
  R EA MZ;
  R EC MZ;
  R EA MX;
  R EA MX;
  R EA MZ;
  R EB MX;
  R EC MZ;
  R EB MX;
  R EB MX;
  R EC MY;
  R EA MZ;
  R EA MX;
  R EC MZ;
  R EB MX;
  R EB MY;
  R EA MX;
  R EB MX;
  R EA MY;
  R EC MZ;
  R EA MZ;
  R EC MZ;
  R EC MY;
  R EC MY;
  R EC MZ;
  R EC MY;
  R EB MX;
  R EC MZ;
  R EB MY;
  R EA MZ;
  R EA MX;
  R EB MX;
  R EC MX;
  R EC MZ;
  R EA MZ;
  R EC MZ;
  R EC MZ;
  R EB MX;
  R EB MY;
  R EC MY;
  R EA MZ;
  R EC MX;
  R EC MZ;
  R EA MZ;
  R EC MZ;
  R EC MZ;
  R EC MY;
  R EA MZ;
  R EA MZ;
  R EC MX;
  R EC MX;
  R EC MY;
  R EC MZ;
  R EA MX;
  R EA MZ;
  R EC MY;
  R EC MY;
  R EC MZ;
  R EA MZ;
  R EB MY;
  R EC MY;
  R EA MZ;
  R EC MY;
  R EA MZ;
  R EB MZ;
  R EB MY;
  R EA MY;
  R EB MX;
  R EC MY;
  R EC MZ;
  R EA MZ;
  R EC MZ;
  R EB MZ;
  R EC MZ;
  R EC MZ;
  R EA MZ;
  R EB MY;
  R EC MZ;
  R EB MX;
  R EC MZ;
  R EC MZ;
  R EC MY;
  R EC MY;
  R EA MZ;
  R EA MY;
  R EC MZ;
  R EC MX;
  R EC MZ;
  R EA MZ;
  R EA MZ;
  R EC MZ;
  R EC MX;
  R EC MY;
  R EA MY;
  R EC MY;
  R EA MX;
  R EC MZ;
  R EA MZ;
  R EC MZ;
  R EB MX;
  R EC MZ;
  R EC MZ;
  R EC MZ;
  R EA MZ;
  R EA MY;
  R EB MY;
  R EA MZ;
  R EA MZ;
  R EB MX;
  R EA MX;
  R EC MZ;
  R EC MZ;
  R EB MX;
  R EC MY;
  R EA MX;
  R EC MY;
  R EA MX;
  R EB MX;
  R EC MZ;
  R EC MZ;
  R EC MX;
  R EA MZ;
  R EC MZ;
  R EC MZ;
  R EC MZ;
  R EC MZ;
  R EA MZ;
  R EA MY;
  R EA MZ;
  R EB MZ;
  R EC MZ;
  R EB MX;
  R EC MZ;
  R EB MX;
  R EA MZ;
  R EC MZ;
  R EC MZ;
  R EB MZ;
  R EC MY;
  R EB MY;
  R EC MZ;
  R EA MZ;
  R EA MZ;
  R EC MY;
  R EC MY;
  R EC MZ;
  R EC MY;
  R EC MZ;
  R EA MX;
  R EC MY;
  R EB MX;
  R EC MY;
  R EC MY;
  R EB MY;
  R EC MZ;
  R EC MZ;
  R EB MX;
  R EC MZ;
  R EB MX;
  R EB MY;
  R EB MX;
  R EB MX;
  R EC MY;
  R EA MZ;
  R EC MY;
  R EC MY;
  R EC MZ;
  R EC MZ;
  R EB MX;
  R EC MZ;
  R EA MZ;
  R EC MY;
  R EB MX;
  R EB MX;
  R EC MY;
  R EC MX;
  R EC MZ;
  R EC MZ;
  R EA MX;
  R EC MZ;
  R EB MX;
  R EC MZ;
  R EC MZ;
  R EA MX;
  R EA MZ;
  R EC MX;
  R EA MZ;
  R EA MZ;
  R EC MY;
  R EC MZ;
  R EC MX;
  R EC MY;
  R EC MZ;
  R EA MZ;
  R EC MZ;
  R EB MX;
  R EC MZ;
  R EC MZ;
  R EA MX;
  R EC MZ;
  R EA MX;
  R EC MZ;
  R EC MX;
  R EC MY;
  R EA MX;
  R EA MZ;
  R EC MX;
  R EC MZ;
  R EA MX;
  R EA MZ;
  R EC MZ;
  R EC MY;
  R EB MX;
  R EA MX;
  R EB MX;
  R EC MZ;
  R EA MZ;
  R EC MX;
  R EC MZ;
  R EB MX;
  R EA MZ;
  R EC MZ;
  R EC MZ;
  R EB MZ;
  R EB MX;
  R EB MY;
  R EC MY;
  R EC MZ;
  R EB MX;
  R EC MZ;
  R EB MY;
  R EC MY;
  R EA MZ;
  R EC MZ;
  R EC MY;
  R EA MZ;
  R EC MZ;
  R EA MZ;
  R EC MY;
  R EC MY;
  R EA MX;
  R EB MZ;
  R EC MY;
  R EB MX;
  R EC MZ;
  R EC MY;
  R EC MZ;
  R EC MX;
  R EB MX;
  R EB MY;
  R EA MZ;
  R EC MZ;
  R EC MZ;
  R EA MZ;
  R EB MZ;
  R EC MZ;
  R EC MY;
  R EC MX;
  R EA MZ;
  R EC MZ;
  R EB MX;
  R EC MZ;
  R EA MX;
  R EC MZ;
  R EC MZ;
  R EA MZ;
  R EA MX;
  R EC MY;
  R EB MZ;
  R EC MY;
  R EC MZ;
  R EC MZ;
  R EC MZ;
  R EA MZ;
  R EA MZ;
  R EC MZ;
  R EA MX;
  R EC MZ;
  R EA MZ;
  R EC MZ;
  R EC MZ;
  R EC MZ;
  R EB MY;
  R EC MZ;
  R EC MZ;
  R EB MY;
  R EA MX;
  R EB MX;
  R EC MZ;
  R EC MZ;
  R EC MY;
  R EA MX;
  R EC MZ;
  R EA MZ;
  R EC MY;
  R EA MZ;
  R EA MZ;
  R EC MY;
  R EB MX;
  R EA MZ;
  R EC MY;
  R EC MZ;
  R EC MX;
  R EB MX;
  R EA MZ;
  R EC MZ;
  R EC MY;
  R EC MZ;
  R EB MZ;
  R EB MX;
  R EA MZ;
  R EA MZ;
  R EC MY;
  R EA MZ;
  R EC MZ;
  R EB MX;
  R EA MZ;
  R EC MZ;
  R EC MZ;
  R EC MX;
  R EC MZ;
  R EC MY;
  R EB MX;
  R EA MZ;
  R EC MZ;
  R EC MZ;
  R EC MZ;
  R EB MX;
  R EA MZ;
  R EB MY;
  R EC MZ;
  R EC MZ;
  R EA MZ;
  R EB MX;
  R EB MX;
  R EB MX;
  R EC MZ;
  R EC MZ;
  R EA MZ;
  R EC MZ;
  R EC MZ;
  R EB MY;
  R EB MX;
  R EA MZ;
  R EC MZ;
  R EC MZ;
  R EC MZ;
  R EA MZ;
  R EB MX;
  R EC MZ;
  R EC MZ;
  R EC MY;
  R EC MZ;
  R EC MY;
  R EA MZ;
  R EC MZ;
  R EA MX;
  R EC MZ;
  R EC MZ;
  R EB MY;
  R EC MZ;
  R EC MY;
  R EB MX;
  R EA MZ;
  R EC MZ;
  R EC MZ;
  R EC MZ;
  R EA MZ;
  R EC MY;
  R EA MX;
  R EC MZ;
  R EC MZ;
  R EA MZ;
  R EC MZ;
  R EA MX;
  R EB MX;
  R EA MZ;
  R EC MZ;
  R EB MZ;
  R EC MZ;
  R EA MY;
  R EB MX;
  R EA MX;
  R EC MZ;
  R EC MZ;
  R EC MZ;
  R EC MY;
  R EB MX;
  R EC MX;
  R EA MZ;
  R EC MZ;
  R EC MZ;
  R EC MY;
  R EA MZ;
  R EC MZ;
  R EC MZ;
  R EB MY;
  R EC MY;
  R EB MX;
  R EC MZ;
  R EA MX;
  R EA MZ;
  R EC MZ;
  R EC MZ;
  R EC MX;
  R EC MZ;
  R EB MX;
  R EC MZ;
  R EC MZ;
  R EC MZ;
  R EC MY;
  R EC MZ;
  R EC MZ;
  R EC MZ;
  R EC MZ;
  R EA MZ;
  R EC MZ;
  R EA MZ;
  R EA MZ;
  R EB MX;
  R EA MZ;
  R EC MX;
  R EB MX;
  R EB MX;
  R EA MZ;
  R EC MZ;
  R EC MY;
  R EC MZ;
  R EC MZ;
  R EC MX;
  R EC MZ;
  R EA MX;
  R EA MZ;
  R EC MZ;
  R EC MZ;
  R EC MZ;
  R EC MZ;
  R EC MZ;
  R EC MZ;
  R EB MZ;
  R EC MZ;
  R EA MZ;
  R EC MZ;
  R EA MZ;
  R EA MX;
  R EB MX;
  R EA MZ;
  R EC MZ;
  R EC MY;
  R EC MZ;
  R EC MY;
  R EA MZ;
  R EA MZ;
  R EA MZ;
  R EA MZ;
  R EA MZ;
  R EB MZ;
  R EA MZ;
  R EC MX;
  R EC MZ;
  R EC MZ;
  R EC MZ;
  R EB MY;
  R EC MZ;
  R EB MX;
  R EA MZ;
  R EB MY;
  R EC MY;
  R EC MY;
  R EC MZ;
  R EB MX;
  R EB MX;
  R EA MZ;
  R EA MZ;
  R EA MZ;
  R EA MZ;
  R EC MZ;
  R EC MX;
  R EA MZ;
  R EC MY;
  R EB MX;
  R EC MZ;
  R EC MZ;
  R EC MZ;
  R EC MZ;
  R EA MX;
  R EC MZ;
  R EA MZ;
  R EC MY;
  R EA MZ;
  R EC MZ;
  R EC MZ;
  R EB MX;
  R EC MZ;
  R EB MZ;
  R EC MY;
  R EC MZ;
  R EC MZ;
  R EC MZ;
  R EC MZ;
  R EC MZ;
  R EA MZ;
  R EC MZ;
  R EA MZ;
  R EA MZ;
  R EA MZ;
  R EC MZ;
  R EC MZ;
  R EA MZ;
  R EC MY;
  R EC MZ;
  R EB MZ;
  R EC MZ;
  R EC MZ;
  R EC MY;
  R EC MZ;
  R EA MY;
  R EC MZ;
  R EA MX;
  R EA MZ;
  R EC MX;
  R EC MZ;
  R EA MZ;
  R EA MZ;
  R EA MZ;
  R EA MZ;
  R EC MZ;
  R EA MZ;
  R EA MZ;
  R EC MZ;
  R EC MZ;
  R EC MZ;
  R EC MZ;
  R EA MZ;
  R EC MY;
  R EC MZ;
  R EC MZ;
  R EA MZ;
  R EC MZ;
  R EB MX;
  R EB MY;
  R EC MZ;
  R EC MZ;
  R EA MZ;
  R EC MZ;
  R EA MZ;
  R EC MY;
  R EC MZ;
  R EA MZ;
  R EC MZ;
  R EC MX;
  R EA MZ;
  R EC MZ;
  R EC MX;
  R EC MZ;
  R EC MY;
  R EA MZ;
  R EC MZ;
  R EC MZ;
  R EC MZ;
  R EB MZ;
  R EC MX;
  R EC MZ;
  R EC MZ;
  R EA MX;
  R EA MZ;
  R EA MZ;
  R EA MZ;
  R EC MZ;
  R EC MZ;
  R EC MX;
  R EA MZ;
  R EA MZ;
  R EC MY;
  R EC MZ;
  R EA MZ;
  R EA MZ;
  R EA MZ;
  R EC MY;
  R EA MZ;
  R EC MZ;
  R EA MZ;
  R EC MZ;
  R EC MZ;
  R EA MZ;
  R EC MY;
  R EB MX;
  R EB MX;
  R EA MZ;
  R EB MZ;
  R EA MZ;
  R EC MZ;
  R EC MZ;
  R EC MX;
  R EA MZ;
  R EC MY;
  R EC MZ;
  R EC MY;
  R EC MZ;
  R EC MZ;
  R EA MZ;
  R EC MY;
  R EC MZ;
  R EC MY;
  R EC MZ;
  R EC MZ;
  R EC MZ;
  R EC MZ;
  R EC MY;
  R EA MX;
  R EA MX;
  R EC MZ;
  R EC MZ;
  R EB MX;
  R EC MX;
  R EC MX;
  R EC MZ;
  R EA MX;
  R EC MY;
  R EA MX;
  R EB MX;
  R EC MX;
  R EC MZ;
  R EC MZ;
  R EA MX;
  R EC MY;
  R EA MY;
  R EA MZ;
  R EC MZ;
  R EC MY;
  R EC MY;
  R EB MX;
  R EA MX;
  R EC MZ;
  R EC MZ;
  R EB MX;
  R EA MZ;
  R EC MZ;
  R EB MZ;
  R EC MZ;
  R EC MY;
  R EC MX;
  R EC MZ;
  R EA MZ;
  R EC MZ;
  R EB MX;
  R EB MX;
  R EC MY;
  R EC MY;
  R EC MZ;
  R EC MY;
  R EA MZ;
  R EB MX;
  R EC MZ;
  R EC MY;
  R EA MZ;
  R EC MZ;
  R EB MZ;
  R EB MX;
  R EA MZ;
  R EA MZ;
  R EB MY;
  R EB MY;
  R EA MZ;
  R EC MZ;
  R EB MX;
  R EA MZ;
  R EC MZ;
  R EA MZ;
  R EC MZ;
  R EB MX;
  R EA MZ;
  R EB MX;
  R EB MX;
  R EA MX;
  R EC MZ;
  R EA MX;
  R EA MX;
  R EA MZ;
  R EC MY;
  R EC MX;
  R EA MX;
  R EC MZ;
  R EC MY;
  R EC MZ;
  R EA MZ;
  R EA MZ;
  R EA MX;
  R EC MZ;
  R EA MZ;
  R EC MZ;
  R EC MY;
  R EA MZ;
  R EC MZ;
  R EB MX;
  R EA MZ;
  R EB MY;
  R EC MZ;
  R EC MY;
  R EC MZ;
  R EC MZ;
  R EA MZ;
  R EA MZ;
  R EC MX;
  R EA MX;
  R EC MY;
  R EC MZ;
  R EC MY;
  R EC MZ;
  R EC MZ;
  R EC MZ;
  R EA MZ;
  R EA MY;
  R EA MX;
  R EA MZ;
  R EC MX;
  R EB MZ;
  R EC MZ;
  R EA MZ;
  R EA MZ;
  R EA MZ;
  R EB MX;
  R EA MZ;
  R EC MZ;
  R EC MZ;
  R EB MX;
  R EC MZ;
  R EA MX;
  R EA MY;
  R EC MZ;
  R EA MZ;
  R EC MZ;
  R EC MZ;
  R EB MX;
  R EC MZ;
  R EC MZ;
  R EC MZ;
  R EC MZ;
  R EC MY;
  R EC MZ;
  R EA MZ;
  R EC MZ;
  R EC MY;
  R EC MZ;
  R EC MZ;
  R EC MZ;
  R EB MX;
  R EA MZ;
  R EC MZ;
  R EC MZ;
  R EC MZ;
  R EA MX;
  R EC MY;
  R EC MZ;
  R EA MZ;
  R EC MY;
  R EA MZ;
  R EC MY;
  R EC MZ;
  R EC MZ;
  R EA MZ;
  R EA MZ;
  R EC MY;
  R EA MZ;
  R EB MZ;
  R EC MZ;
  R EC MZ;
  R EB MZ;
  R EA MX;
  R EB MX;
  R EC MZ;
  R EC MY;
  R EA MZ;
  R EC MY;
  R EB MY;
  R EA MX;
  R EC MZ;
  R EC MZ;
  R EC MZ;
  R EC MZ;
  R EA MZ;
  R EC MZ;
  R EA MX;
  R EC MY;
  R EA MZ;
  R EC MZ;
  R EB MX;
  R EB MY;
  R EC MZ;
  R EC MY;
  R EC MZ;
  R EB MX;
  R EC MY;
  R EC MY;
  R EC MZ;
  R EB MX;
  R EC MX;
  R EA MY;
  R EC MZ;
  R EC MY;
  R EA MZ;
  R EC MY;
  R EA MX;
  R EB MY;
  R EA MY;
  R EC MZ;
  R EC MZ;
  R EA MZ;
  R EC MZ;
  R EC MX;
  R EA MZ;
  R EC MZ;
  R EC MZ;
  R EC MZ;
  R EC MY;
  R EC MZ;
  R EA MZ;
  R EB MX;
  R EA MZ;
  R EC MZ;
  R EB MX;
  R EC MZ;
  R EA MZ;
  R EC MZ;
  R EB MY;
  R EA MZ;
  R EC MZ;
  R EA MZ;
  R EC MZ;
  R EA MX;
  R EC MY;
  R EA MZ;
  R EC MZ;
  R EC MZ;
  R EC MY;
  R EA MZ;
  R EB MX;
  R EC MZ;
  R EA MZ;
  R EC MZ;
  R EC MZ;
  R EA MZ;
  R EC MZ;
  R EC MX;
  R EA MZ;
  R EC MZ;
  R EC MZ;
  R EC MZ;
  R EC MZ;
  R EB MZ;
  R EC MZ;
  R EC MZ;
  R EC MZ;
  R EC MY;
  R EB MX;
  R EA MX;
  R EC MZ;
  R EC MZ;
  R EC MZ;
  R EC MZ;
  R EC MZ;
  R EC MZ;
  R EC MZ;
  R EB MZ;
  R EC MZ;
  R EA MX;
  R EC MZ;
  R EB MY;
  R EA MZ;
  R EA MX;
  R EC MZ;
  R EC MZ;
  R EA MZ;
  R EC MZ;
  R EC MY;
  R EA MX;
  R EC MY;
  R EC MZ;
  R EC MZ;
  R EC MZ;
  R EC MX;
  R EC MY;
  R EC MZ;
  R EC MY;
  R EC MZ;
  R EA MY;
  R EC MZ;
  R EA MX;
  R EC MX;
  R EC MZ;
  R EC MZ;
  R EC MZ;
  R EA MZ;
  R EC MZ;
  R EB MX;
  R EC MY;
  R EA MZ;
  R EC MZ;
  R EC MX;
  R EC MZ;
  R EC MZ;
  R EC MZ;
  R EA MY;
  R EA MX;
  R EA MZ;
  R EC MY;
  R EB MX;
  R EB MX;
  R EA MZ;
  R EA MZ;
  R EA MZ;
  R EC MZ;
  R EC MZ;
  R EA MZ;
  R EC MZ;
  R EA MY;
  R EC MY;
  R EC MZ;
  R EC MY;
  R EB MZ;
  R EB MY;
  R EB MX;
  R EA MX;
  R EC MZ;
  R EC MZ;
  R EC MZ;
  R EC MY;
  R EB MX;
  R EA MX;
  R EC MX;
  R EA MZ;
  R EA MZ;
  R EC MZ;
  R EC MY;
  R EA MZ;
  R EA MZ;
  R EA MZ;
  R EC MZ;
  R EC MZ;
  R EC MY;
  R EB MX;
  R EA MZ;
  R EC MZ;
  R EA MX;
  R EC MY;
  R EA MY;
  R EB MY;
  R EA MZ;
  R EA MZ;
  R EA MZ;
  R EC MZ;
  R EC MZ;
  R EB MX;
  R EA MY;
  R EC MZ;
  R EA MY;
  R EC MY;
  R EC MZ;
  R EA MZ;
  R EC MY;
  R EB MX;
  R EC MZ;
  R EC MZ;
  R EC MZ;
  R EB MX;
  R EB MX;
  R EC MX;
  R EB MX;
  R EA MZ;
  R EA MZ;
  R EC MZ;
  R EC MZ;
  R EA MX;
  R EC MZ;
  R EC MZ;
  R EC MZ;
  R EA MZ;
  R EA MZ;
  R EA MZ;
  R EB MX;
  R EC MX;
  R EC MZ;
  R EA MZ;
  R EA MZ;
  R EB MX;
  R EB MX;
  R EC MX;
  R EB MX;
  R EA MZ;
  R EC MZ;
  R EC MZ;
  R EA MX;
  R EC MX;
  R EA MZ;
  R EC MY;
  R EA MZ;
  R EA MZ;
  R EB MX;
  R EC MZ;
  R EC MZ;
  R EA MZ;
  R EA MZ;
  R EC MZ;
  R EC MZ;
  R EC MY;
  R EC MY;
  R EC MZ;
  R EC MY;
  R EC MZ;
  R EC MZ;
  R EC MY;
  R EA MX;
  R EC MZ;
  R EC MZ;
  R EA MZ;
  R EC MZ;
  R EA MZ;
  R EC MZ;
  R EC MZ;
  R EC MY;
  R EC MZ;
  R EC MY;
  R EA MZ;
  R EC MZ;
  R EC MY;
  R EB MZ;
  R EB MX;
  R EB MX;
  R EA MX;
  R EC MZ;
  R EC MZ;
  R EA MY;
  R EC MZ;
  R EC MX;
  R EC MZ;
  R EA MZ;
  R EA MZ;
  R EA MZ;
  R EC MY;
  R EB MY;
  R EB MX;
  R EA MZ;
  R EC MZ;
  R EC MZ;
  R EC MY;
  R EA MZ;
  R EC MZ;
  R EC MZ;
  R EA MX;
  R EA MX;
  R EB MX;
  R EA MZ;
  R EC MZ;
  R EA MX;
  R EC MZ;
  R EA MZ;
  R EC MZ;
  R EC MZ;
  R EA MZ;
  R EC MZ;
  R EB MY;
  R EB MX;
  R EA MZ;
  R EC MY;
  R EC MZ;
  R EC MZ;
  R EA MX;
  R EC MZ;
  R EC MX;
  R EA MZ;
  R EB MX;
  R EC MZ;
  R EC MZ;
  R EC MZ;
  R EC MZ;
  R EC MX;
  R EC MZ;
  R EA MZ;
  R EC MZ;
  R EA MY;
  R EB MX;
  R EA MZ;
  R EA MX;
  R EA MZ;
  R EC MY;
  R EC MZ;
  R EC MY;
  R EC MY;
  R EC MY;
  R EC MX;
  R EC MY;
  R EC MZ;
  R EC MZ;
  R EC MZ;
  R EC MY;
  R EB MX;
  R EC MZ;
  R EB MX;
  R EC MZ;
  R EC MZ;
  R EA MZ;
  R EB MX;
  R EC MZ;
  R EA MX;
  R EC MY;
  R EB MY;
  R EA MX;
  R EB MZ;
  R EB MX;
  R EA MX;
  R EA MX;
  R EA MX;
  R EB MY;
  R EC MY;
  R EC MZ;
  R EB MX;
  R EC MY;
  R EC MX;
  R EA MZ;
  R EC MY;
  R EA MZ;
  R EC MZ;
  R EC MX;
  R EB MX;
  R EC MY;
  R EA MZ;
  R EC MY;
  R EC MZ;
  R EA MZ;
  R EC MY;
  R EB MY;
  R EC MY;
  R EB MX;
  R EA MZ;
  R EC MY;
  R EC MY;
  R EC MZ;
  R EC MZ;
  R EC MX;
  R EB MX;
  R EC MZ;
  R EB MX;
  R EC MZ;
  R EC MZ;
  R EA MZ;
  R EC MZ;
  R EA MZ;
  R EC MZ;
  R EC MZ;
  R EC MY;
  R EC MY;
  R EC MZ;
  R EC MY;
  R EA MZ;
  R EC MZ;
  R EC MY;
  R EA MZ;
  R EC MZ;
  R EC MZ;
  R EC MY;
  R EC MZ;
  R EB MX;
  R EB MX;
  R EA MX;
  R EC MZ;
  R EA MZ;
  R EC MZ;
  R EA MZ;
  R EC MZ;
  R EB MY;
  R EA MX;
  R EC MY;
  R EC MY;
  R EB MX;
  R EA MZ;
  R EC MZ;
  R EC MZ;
  R EC MY;
  R EC MZ;
  R EA MZ;
  R EC MY;
  R EB MZ;
  R EC MY;
  R EC MZ;
  R EC MZ;
  R EC MX;
  R EC MY;
  R EB MX;
  R EC MY;
  R EC MZ;
  R EC MX;
  R EA MZ;
  R EC MZ;
  R EC MZ;
  R EC MY;
  R EA MZ;
  R EC MZ;
  R EA MZ;
  R EC MY;
  R EA MZ;
  R EA MZ;
  R EA MY;
  R EC MZ;
  R EA MZ;
  R EC MZ;
  R EA MZ;
  R EC MZ;
  R EC MZ;
  R EB MZ;
  R EA MX;
  R EC MY;
  R EA MX;
  R EC MZ;
  R EC MZ;
  R EA MZ;
  R EC MZ;
  R EA MX;
  R EA MX;
  R EC MZ;
  R EB MX;
  R EB MZ;
  R EC MY;
  R EC MZ;
  R EA MX;
  R EB MX;
  R EC MZ;
  R EC MZ;
  R EB MX;
  R EA MZ;
  R EC MZ;
  R EA MZ;
  R EA MY;
  R EC MZ;
  R EA MZ;
  R EC MY;
  R EC MY;
  R EA MY;
  R EB MX;
  R EC MZ;
  R EC MY;
  R EA MX;
  R EC MZ;
  R EC MY;
  R EA MX;
  R EA MZ;
  R EC MY;
  R EB MX;
  R EC MZ;
  R EA MZ;
  R EC MZ;
  R EC MZ;
  R EA MZ;
  R EC MZ;
  R EC MY;
  R EC MY;
  R EC MZ;
  R EA MZ;
  R EB MZ;
  R EC MY;
  R EA MZ;
  R EC MZ;
  R EC MY;
  R EC MX;
  R EC MZ;
  R EC MZ;
  R EA MZ;
  R EC MZ;
  R EC MX;
  R EC MZ;
  R EC MX;
  R EC MY;
  R EC MZ;
  R EA MZ;
  R EC MZ;
  R EA MZ;
  R EB MX;
  R EC MZ;
  R EB MX;
  R EC MZ;
  R EA MX;
  R EC MZ;
  R EC MZ;
  R EB MY;
  R EC MZ;
  R EC MZ;
  R EB MX;
  R EC MZ;
  R EC MY;
  R EC MY;
  R EB MX;
  R EA MZ;
  R EA MX;
  R EA MZ;
  R EA MX;
  R EC MY;
  R EB MX;
  R EA MZ;
  R EC MY;
  R EA MZ;
  R EC MZ;
  R EB MX;
  R EB MZ;
  R EC MZ;
  R EC MY;
  R EC MY;
  R EC MY;
  R EA MZ;
  R EB MX;
  R EC MZ;
  R EC MX;
  R EA MX;
  R EB MZ;
  R EC MY;
  R EB MX;
  R EA MZ;
  R EC MZ;
  R EC MZ;
  R EC MZ;
  R EC MZ;
  R EC MY;
  R EB MX;
  R EC MZ;
  R EC MZ;
  R EC MZ;
  R EC MZ;
  R EA MX;
  R EA MZ;
  R EC MZ;
  R EC MY;
  R EC MY;
  R EC MZ;
  R EA MY;
  R EC MZ;
  R EC MZ;
  R EC MZ;
  R EB MX;
  R EC MY;
  R EC MZ;
  R EC MZ;
  R EA MZ;
  R EC MZ;
  R EC MZ;
  R EC MZ;
  R EB MX;
  R EA MZ;
  R EB MX;
  R EC MZ;
  R EC MX;
  R EA MX;
  R EC MZ;
  R EC MZ;
  R EC MZ;
  R EC MX;
  R EA MZ;
  R EA MZ;
  R EB MX;
  R EA MZ;
  R EC MZ;
  R EC MZ;
  R EA MZ
  ]
.

Definition score_e (r : EMove) :=
  match r with
  | EA => 3
  | EB => 0
  | EC => 6
  end.

Definition score_m (m : MMove) :=
  match m with
  | MX => 0
  | MY => 4
  | MZ => 8
  end.

Definition score (r : Rule) :=
  match r with
  | R e m => ((score_e e) + (score_m m)) mod 9 + 1
  end.

Fixpoint zsum (l : list Z) :=
  match l with
  | nil => 0
  | (x :: t) => x + zsum t
  end.

Compute (zsum (map score [R EA MY;R EB MX;R EC MZ])).
Compute (zsum (map score input)).

Definition score_res (r : Rule) :=
  match r with
  | R EA m => match m with
    | MX => MZ
    | MY => MX
    | MZ => MY
    end
  | R EB m => match m with
    | MX => MX
    | MY => MY
    | MZ => MZ
    end
  | R EC m => match m with
    | MX => MY
    | MY => MZ
    | MZ => MX
    end
  end.

Definition score_2 (r : Rule) :=
  match r with
  | R EA m => score (R EA (score_res r))
  | R EB m => score (R EB (score_res r))
  | R EC m => score (R EC (score_res r))
  end.

Compute (zsum (map score_2 [R EA MY;R EB MX;R EC MZ])).
Compute (zsum (map score_2 input)).