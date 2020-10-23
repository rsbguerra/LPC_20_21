
/* Analisador Sint�ctico para Arith */

%{
  open Ast
%}

%token <int> CST
%token <string> IDENT
%token SET, LET, IN, PRINT, COMMA
%token EOF
%token LP RP
%token PLUS MINUS TIMES DIV
%token EQ

/* Defini��es das prioridades e associatividade dos tokens*/

%nonassoc IN
%left PLUS MINUS
%left TIMES DIV
%nonassoc uminus

/* Ponto de entrada da gram�tica */
%start prog

/* Tipo dos valores retornados pela analise sint�ctica  */
%type <Ast.pprogram> prog

%%

prog:
| l=list(stmt) EOF { l }
;

stmt:
| SET id=IDENT EQ e=expr { PSet (id, e) }
| SET id=IDENT LP f=separated_list(COMMA, IDENT) RP EQ e=expr
                         { PFun(id,f,e) }
| PRINT e=expr           { PPrint e }
;

expr:
| c=CST                        { PCst c }
| id=IDENT                     { PVar id }
| e1=expr op=binop e2=expr     { PBinop (op, e1, e2) }
| MINUS e=expr %prec uminus    { PBinop (Sub, PCst 0, e) }
| LET x=IDENT EQ e1=expr IN e2=expr
                               { PLetin (x, e1, e2) }
| LP e=expr RP                 { e }
| id=IDENT LP el=separated_list(COMMA, expr) RP
                              { PCall (id, el) }
;

%inline binop:
| PLUS  { Add }
| MINUS { Sub }
| TIMES { Mul }
| DIV   { Div }
;
