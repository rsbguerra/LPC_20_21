/* Ponto de entrada da gramática */
%start prog

/* Tipo dos valores devolvidos pela analisador sintáctico */
%type <Ast.program> prog
%%

/* Regras da gramática */
prog: 
  | defs = def* main = stmt* EOF
  {{defs = defs; 
    main = Sblock main}}
;

def:
| DEF f = IDENT
  LP formals = separated_list(COMMA, IDENT) RP body = stmt
    { { name = f;
        formals = formals;
        body = body } }

stmt:
  | PEN_UP             { Spenup }
  | PEN_DOWN           { Spendown }
  | FRWD e = expr      { Sforward e }
  | TRN_LEFT e = expr  { Sturn e }
  | TRN_RIGHT e = expr { Sturn (neg e) }
  | COLOR c = color    { Scolor c }
  | id = IDENT LP exprs = separated_list(COMMA, expr) RP 
    { Scall (id, exprs) }
  | IF e = expr s = stmt 
    { Sif (e, s, Sblock []) }
  | IF e = expr s1 = stmt ELSE s2 = stmt 
    {Sif (e, s1, s2)}
  | REP e = expr s = stmt {Srepeat (e, s)}
  | LB stmts = stmt* RB {Sblock stmts}
;
expr:
| c = CST {Econst c}
| id = IDENT {Evar id}
| e1 = expr o = op e2 = expr  { Ebinop (o, e1, e2) }
| MINUS e = expr %prec uminus { neg e }
| LP e = expr RP {e}
;

%inline op:
| PLUS  { Add }
| MINUS { Sub }
| DIV   { Div }
| TIMES   { Mul }
;

color:
  | BLACK {Turtle.black}
  | WHITE {Turtle.white}
  | RED   {Turtle.red}
  | GREEN {Turtle.green}
  | BLUE  {Turtle.blue}
;


