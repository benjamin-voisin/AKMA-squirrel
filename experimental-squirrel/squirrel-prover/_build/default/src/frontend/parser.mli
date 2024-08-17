
(* The type of tokens. *)

type token = 
  | XOR
  | WITH
  | WHERE
  | VAR
  | USE
  | UNDO
  | UNDERSCORE
  | UFORALL
  | UEXISTS
  | TYPE
  | TRY
  | TRUE
  | TRANS
  | TIMESTAMP
  | TIME
  | TILDE
  | TICK
  | THEOREM
  | THEN
  | TACTIC
  | SYSTEM
  | SUCHTHAT
  | STAR
  | SPLITSEQ
  | SMT
  | SLASHSLASHEQUAL
  | SLASHSLASH
  | SLASHEQUAL
  | SLASH
  | SIMPL
  | SIGNATURE
  | SHARP
  | SET
  | SEQ
  | SENC
  | SEMICOLON
  | SEARCH
  | RPAREN
  | RND
  | RIGHTINFIXSYMB of (string)
  | REWRITE
  | REVERT
  | RETURN
  | RESET
  | REPEAT
  | RENAME
  | REMEMBER
  | REDUCE
  | RBRACKET
  | RBRACE
  | RARROW
  | RANGLE
  | QUOTE
  | QUANTIF
  | QMARK
  | QED
  | PROOF
  | PROF
  | PROCESS
  | PRINT
  | PREDICATE
  | PLUS
  | PERCENT
  | PATH of (string)
  | PARALLEL
  | OUT
  | ORACLE
  | OR
  | OP
  | NULL
  | NOT
  | NOSIMPL
  | NEW
  | NEQ
  | NAME
  | MUTABLE
  | MINUS
  | MESSAGE
  | MEMSEQ
  | LPAREN
  | LOCALIZE
  | LOCAL
  | LLET
  | LET
  | LEQ
  | LEMMA
  | LEFTINFIXSYMB of (string)
  | LBRACKET
  | LBRACE
  | LANGLE
  | INTRO
  | INT of (int)
  | INDUCTION
  | INDEX
  | INCLUDE
  | IN
  | IF
  | ID of (string)
  | HINT
  | HELP
  | HAVE
  | HASH
  | GPRF
  | GOR
  | GLOBAL
  | GEQ
  | GENERALIZE
  | GDH
  | GCCA
  | GAND
  | GAME
  | FUN
  | FRESH
  | FORALL
  | FIND
  | FALSE
  | FA
  | EXN
  | EXISTS
  | EQUIV
  | EQ
  | EOF
  | ELSE
  | DOT
  | DOLLAR
  | DIFF
  | DESTRUCT
  | DEQUIVARROW
  | DEPENDS
  | DEPENDENT
  | DDH
  | DARROW
  | CYCLE
  | CS
  | CRYPTO
  | CONSTSEQ
  | COMMA
  | COLONEQ
  | COLON
  | CLEAR
  | CHECKFAIL
  | CHANNEL
  | CDH
  | CASE
  | BY
  | BOOLEAN
  | BOOL
  | BANGU
  | BANG of (string)
  | AXIOM
  | AUTO
  | ATSLASH
  | AT
  | ASSERT
  | AS
  | ARROW
  | APPLY
  | AND
  | AENC
  | ACTION
  | ABSTRACT
  | ABORT

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val top_proofmode_or_undo: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Squirrelcore.ProverLib.input_or_undo)

val top_proofmode: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Squirrelcore.ProverLib.input)

val top_process: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Squirrelcore.Process.Parse.t)

val top_global_formula: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Squirrelcore.Theory.global_formula)

val top_formula: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Squirrelcore.Theory.term)

val system_expr: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Squirrelcore.SystemExpr.Parse.t)

val interactive_or_undo: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Squirrelcore.ProverLib.input_or_undo)

val interactive: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Squirrelcore.ProverLib.input)

val declarations: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Squirrelcore.Decl.declarations)

module MenhirInterpreter : sig
  
  (* The incremental API. *)
  
  include MenhirLib.IncrementalEngine.INCREMENTAL_ENGINE
    with type token = token
  
end

(* The entry point(s) to the incremental API. *)

module Incremental : sig
  
  val top_proofmode_or_undo: Lexing.position -> (Squirrelcore.ProverLib.input_or_undo) MenhirInterpreter.checkpoint
  
  val top_proofmode: Lexing.position -> (Squirrelcore.ProverLib.input) MenhirInterpreter.checkpoint
  
  val top_process: Lexing.position -> (Squirrelcore.Process.Parse.t) MenhirInterpreter.checkpoint
  
  val top_global_formula: Lexing.position -> (Squirrelcore.Theory.global_formula) MenhirInterpreter.checkpoint
  
  val top_formula: Lexing.position -> (Squirrelcore.Theory.term) MenhirInterpreter.checkpoint
  
  val system_expr: Lexing.position -> (Squirrelcore.SystemExpr.Parse.t) MenhirInterpreter.checkpoint
  
  val interactive_or_undo: Lexing.position -> (Squirrelcore.ProverLib.input_or_undo) MenhirInterpreter.checkpoint
  
  val interactive: Lexing.position -> (Squirrelcore.ProverLib.input) MenhirInterpreter.checkpoint
  
  val declarations: Lexing.position -> (Squirrelcore.Decl.declarations) MenhirInterpreter.checkpoint
  
end
