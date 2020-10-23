
(* Sintaxe abstracta  para mini-Turtle

   Note : A sintaxe abstracta aqui descrita cont�m voluntariamente menos 
   constru��es do que a sintaxe concreta. Ser� ent�o necess�rio traduzir 
   algumas constru��es no momento da an�lise sint�ctica (a��car sint�ctico).
*)

(* express�es inteiras *)

type binop = Add | Sub | Mul | Div

type expr =
  | Econst of int
  | Evar   of string
  | Ebinop of binop * expr * expr

(* instru��es *)

type stmt =
  | Spenup
  | Spendown
  | Sforward of expr
  | Sturn    of expr (* vira para a esquerda *)
  | Scolor   of Turtle.color
  | Sif      of expr * stmt * stmt
  | Srepeat  of expr * stmt
  | Sblock   of stmt list
  | Scall    of string * expr list

(* defini��o de procedimentos *)

type def = {
  name    : string;
  formals : string list; (* argumentos *)
  body    : stmt; }

(* programa *)

type program = {
  defs : def list;
  main : stmt; }



