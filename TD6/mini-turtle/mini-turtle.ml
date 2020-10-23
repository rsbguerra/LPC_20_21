
(* Ficheiro principal do interpretador de mini-Turtle *)

open Format
open Lexing

(* Op��o de compila��o, para poder parar no final do parsing *)
let parse_only = ref false

(* Nome dos ficheiros fonte e alvo *)
let ifile = ref ""
let ofile = ref ""

let set_file f s = f := s

(* As op��es do compilador que mostramos com --help *)
let options =
  ["--parse-only", Arg.Set parse_only,
   "  Parsing stage only"]

let usage = "usage: mini-turtle [option] file.logo"

(* localisa um erro indicando a linha e a coluna *)
let localisation pos =
  let l = pos.pos_lnum in
  let c = pos.pos_cnum - pos.pos_bol + 1 in
  eprintf "File \"%s\", line %d, characters %d-%d:\n" !ifile l (c-1) c

let () =
  (* Parsing da linha de comando *)
  Arg.parse options (set_file ifile) usage;

  (* Verificar que o nome do ficheiro fonte foi devidamente fornecido *)
  if !ifile="" then begin eprintf "No file to compile\n@?"; exit 1 end;

  (* Este ficheiro deve ter a extens�o .logo *)
  if not (Filename.check_suffix !ifile ".logo") then begin
    eprintf "The file must have the extension .logo\n@?";
    Arg.usage options usage;
    exit 1
  end;

  (* Abertura do ficheiro fonte em modo leitura *)
  let f = open_in !ifile in

  (* Cria��o do buffer de an�lise l�xica *)
  let buf = Lexing.from_channel f in

  try
    (* Parsing: a fun��o Parser.prog transforma o buffer l�xico numa
       �rvore de sintaxe abstracta se nenhum erro (l�xico ou sint�ctico)
       for detectado.
       A fun��o Lexer.token � utilizada por Parser.prog para obter o 
       pr�ximo token. *)
    let p = Parser.prog Lexer.token buf in
    close_in f;

    (* Parar aqui se s� pretendemos parsing *)
    if !parse_only then exit 0;

    Interp.prog p
  with
    | Lexer.Lexing_error c ->
	(* Erro l�xico. Recuperamos a sua posi��o absoluta e 
           convertemos em numero de linha *)
	localisation (Lexing.lexeme_start_p buf);
	eprintf "Erreur lexicale: %s@." c;
	exit 1
    | Parser.Error ->
	(* Erro sint�tico. Recuperamos a sua posi��o absoluta e 
           convertemos em numero de linha *)
	localisation (Lexing.lexeme_start_p buf);
	eprintf "Erreur syntaxique@.";
	exit 1
    | Interp.Error s->
	(* Erro durante a interpreta��o *)
	eprintf "Erreur : %s@." s;
	exit 1
