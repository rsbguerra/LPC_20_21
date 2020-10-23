
(* Analisador léxico para  mini-Turtle *)

{
  open Lexing
  open Parser

  (* excepção por levantar em caso de erro l�xico *)
  exception Lexing_error of string

  let kwd_tbl = [
    "if",        IF;
    "else",      ELSE;
    "def",       DEF;
    "repeat",    REP;
    "penup",     PEN_UP;
    "pendown",   PEN_DOWN;
    "forward",   FRWD;
    "turnleft",  TRN_LEFT;
    "turnright", TRN_RIGHT;
    "color",     COLOR;
    "black",     BLACK;
    "white",     WHITE;
    "red",       RED;
    "green",     GREEN;
    "blue",      BLUE;
  ]

  let kwd_or_id s = 
  try List.assoc s kwd_tbl with _ -> IDENT s

  (* fun��o por invocar em cada ocorr�ncia de '\n' *)
  let newline lexbuf =
    let pos = lexbuf.lex_curr_p in
    lexbuf.lex_curr_p <-
      { pos with pos_lnum = pos.pos_lnum + 1; pos_bol = pos.pos_cnum }
}

let letter = ['a'-'z' 'A' - 'Z']
let digit = ['0'-'9']
let ident = letter (letter | digit | '_')*
let integer = digit+
let space = [' ' '\t']


rule token = parse
  | "//" [^'\n']+ { newline lexbuf; token lexbuf }  
  | '\n'    { newline lexbuf; token lexbuf }
  | space+ {token lexbuf}
  | ident as id {kwd_or_id id}
  | '+' { PLUS }
  | '-' { MINUS }
  | '*' { TIMES }
  | '/' { DIV }
  | ',' { COMMA }
  | '(' { LP }
  | ')' { RP }
  | '{' { LB }
  | '}' { RB }
  | "(*" { comment lexbuf }
  | integer as i  { CST (int_of_string i) }
  | eof           { EOF }
  | _ as c { raise (Lexing_error ("Illigal token " ^ String.make 1 c)) }

and comment = parse
  | "*)"    { token lexbuf }
  | _       { comment lexbuf }
  | eof     { raise (Lexing_error ("unterminated comment")) }
