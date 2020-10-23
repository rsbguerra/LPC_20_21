
(* Sintaxe abstracta proveniente da analise sint�ctica *)

type binop = Add | Sub | Mul | Div

type pexpr =
  | PCst of int
  | PVar of string
  | PBinop of binop * pexpr * pexpr
  | PLetin of string * pexpr * pexpr
  | PCall of string * pexpr list

type pstmt =
  | PSet of string * pexpr
  | PFun of string * string list * pexpr
  | PPrint of pexpr

type pprogram = pstmt list

(* Sintaxe abstracta ap�s aloca��o das vari�veis (ver compile.ml) *)

type ident = int

type expr =
  | Cst of int
  | LVar of ident
  | GVar of string
  | Binop of binop * expr * expr
  | Letin of ident * expr * expr
  | Call of string * expr list

type stmt =
  | Set of string * expr * int 
  | Fun of string * expr * int
  | Print of expr * int

type program = stmt list
