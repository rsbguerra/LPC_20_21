
(* Analizador léxico para  Arith *)

{
  open Lexing
  open Parser

  exception Lexing_error of char

  let kwd_tbl = ["let",LET; "in",IN; "set",SET; "print",PRINT]
  let id_or_kwd s = try List.assoc s kwd_tbl with _ -> IDENT s

  let newline lexbuf =
    let pos = lexbuf.lex_curr_p in
    lexbuf.lex_curr_p <-
      { pos with pos_lnum = pos.pos_lnum + 1; pos_bol = pos.pos_cnum }

}

let letter = ['a'-'z' 'A'-'Z']
let digit = ['0'-'9']
let ident = letter (letter | digit)*
let integer = ['0'-'9']+
let space = [' ' '\t']

rule token = parse
  | '\n'    { newline lexbuf; token lexbuf }
  | '#' [^'\n']* '\n' { newline lexbuf; token lexbuf }
  | space+  { token lexbuf }
  | "(*"    { comment lexbuf; token lexbuf }
  | ident as id { id_or_kwd id }
  | '+'     { PLUS }
  | '-'     { MINUS }
  | '*'     { TIMES }
  | '/'     { DIV }
  | ','     { COMMA }
  | '='     { EQ }
  | '('     { LP }
  | ')'     { RP }
  | integer as s { CST (int_of_string s) }
  | eof     { EOF }
  | _ as c  { raise (Lexing_error c) }

and comment = parse
  | "(*"    { comment lexbuf; comment lexbuf }
  | "*)"    { () }
  | eof     { failwith "commentaire non termine" }
  | _       { comment lexbuf }


