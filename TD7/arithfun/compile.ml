
open Format
open X86_64
open Ast

(* fase 1 : alocação das variáveis *)

exception VarUndef of string

let (genv : (string, unit) Hashtbl.t) = Hashtbl.create 17

module Smap = Map.Make(String)

type local_env = ident Smap.t

let rec alloc_expr env next = function
  | PCst i ->
    Cst i, next
  | PVar x ->
    failwith "POR COMPLETAR"
  | PBinop (o, e1, e2)->
    failwith "à compléter"
  | PLetin (x, e1, e2) ->
    failwith "POR COMPLETAR"
  | PCall (f, l) ->
    failwith "POR COMPLETAR"

let alloc_stmt = function
  | PSet (x, e) ->
    failwith "POR COMPLETAR"

  | PFun (f, l, e) ->
    failwith "POR COMPLETAR"

  | PPrint e ->
    let e, fpmax = alloc_expr Smap.empty 0 e in
    Print (e, fpmax)

let alloc = List.map alloc_stmt

(******************************************************************************)
(* fase 2 : produção de código *)

let popn n = addq (imm n) (reg rsp)
let pushn n = subq (imm n) (reg rsp)

let rec compile_expr = function
  | Cst i ->
      pushq (imm i)
  | LVar fp_x ->
      pushq (ind ~ofs:fp_x rbp)
  | GVar x ->
      pushq (lab x)

  | Binop (o, e1, e2)->
      compile_expr e1 ++
      compile_expr e2 ++
      popq rbx ++ popq rax ++
      (match o with
        | Add -> addq (reg rbx) (reg rax)
        | Sub -> subq (reg rbx) (reg rax)
        | Mul -> imulq (reg rbx) (reg rax)
        | Div -> cqto ++ idivq (reg rbx)) ++
       pushq (reg rax)

  | Letin (ofs, e1, e2) ->
      compile_expr e1 ++
      popq rax ++ movq (reg rax) (ind ~ofs rbp) ++
      compile_expr e2

  | Call (f, l) ->
      failwith "POR COMPLETAR"

let compile_stmt (codefun, codemain) = function
  | Set (x, e, fpmax) ->
    let code = compile_expr e in
    let code =
      let pre, post = if fpmax > 0 then pushn fpmax, popn fpmax else nop, nop in
      pre ++ code ++ popq rax ++ movq (reg rax) (lab x) ++ post in
    codefun, codemain ++ code

  | Fun (f, e, fpmax) ->
    failwith "POR COMPLETAR"

  | Print (e, fpmax) ->
    let code = compile_expr e in
    let code =
      let pre, post = if fpmax > 0 then pushn fpmax, popn fpmax else nop, nop in
      pre ++ code ++ popq rdi ++ post ++ call "print_int"
    in
    codefun, codemain ++ code

let compile_program p ofile =
  let p = alloc p in
  let codefun, code = List.fold_left compile_stmt (nop, nop) p in
  let p =
    { text =
        glabel "main" ++
        movq (reg rsp) (reg rbp) ++
        code ++
        movq (imm 0) (reg rax) ++ (* exit *)
        ret ++
        label "print_int" ++
        movq (reg rdi) (reg rsi) ++
        movq (ilab ".Sprint_int") (reg rdi) ++
        movq (imm 0) (reg rax) ++
        call "printf" ++
        ret ++
        codefun;
      data =
        Hashtbl.fold (fun x _ l -> label x ++ dquad [1] ++ l) genv
          (label ".Sprint_int" ++ string "%d\n")
    }
  in
  let f = open_out ofile in
  let fmt = formatter_of_out_channel f in
  X86_64.print_program fmt p;
  fprintf fmt "@?";
  close_out f
