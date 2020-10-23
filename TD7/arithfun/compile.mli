
exception VarUndef of string
  (** excepção levantada para assinalar uma variável não declarada *)

module Smap : Map.S with type key = string
type local_env = Ast.ident Smap.t

val alloc_expr : local_env -> int -> Ast.pexpr -> Ast.expr * int
val alloc_stmt : Ast.pstmt -> Ast.stmt
val alloc : Ast.pprogram -> Ast.program

val compile_program : Ast.pprogram -> string -> unit
  (** [compile_program p f] compila o programa [p] e escreve o código Assembly
      correspondente no ficheiro  [f] *)

