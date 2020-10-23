/* Analizador sintáctico para mini-Turtle */

%{
  open Ast

  let neg e = Ebinop (Sub, Econst 0, e)
%}

/* Declaração dos tokens */
%token <int> CST
%token <string> IDENT
%token EOF
%token IF ELSE DEF REP
%token COMMA LP RP LB RB
%token PLUS MINUS TIMES DIV
%token PEN_UP PEN_DOWN FRWD TRN_LEFT TRN_RIGHT
%token COLOR BLACK WHITE RED GREEN BLUE

/* Prioridades e associatividades dos tokens */

%left PLUS MINUS
%left TIMES DIV
%nonassoc uminus
%nonassoc IF
%nonassoc ELSE
%%