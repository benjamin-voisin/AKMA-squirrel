# 1 "src/visualisation/htmlLexer.mll"
 
  (* open Lexing *)
  open HtmlParser
  
  let counter = ref 0
  let buf = Buffer.create 32

# 10 "src/visualisation/htmlLexer.ml"
let __ocaml_lex_tables = {
  Lexing.lex_base =
   "\000\000\252\255\000\000\255\255\001\000\254\255\005\000\253\255\
    \000\000\002\000\255\255\254\255\008\000\252\255\253\255\008\000\
    \009\000\255\255\254\255\020\000\251\255\252\255\253\255\012\000\
    \012\000\255\255\254\255";
  Lexing.lex_backtrk =
   "\255\255\255\255\003\000\255\255\002\000\255\255\255\255\255\255\
    \002\000\002\000\255\255\255\255\255\255\255\255\255\255\003\000\
    \003\000\255\255\255\255\255\255\255\255\255\255\255\255\004\000\
    \004\000\255\255\255\255";
  Lexing.lex_default =
   "\001\000\000\000\255\255\000\000\255\255\000\000\007\000\000\000\
    \255\255\255\255\000\000\000\000\013\000\000\000\000\000\255\255\
    \255\255\000\000\000\000\020\000\000\000\000\000\000\000\255\255\
    \255\255\000\000\000\000";
  Lexing.lex_trans =
   "\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\014\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\022\000\021\000\000\000\
    \000\000\022\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \002\000\011\000\004\000\005\000\010\000\009\000\003\000\008\000\
    \016\000\018\000\015\000\017\000\022\000\026\000\025\000\000\000\
    \000\000\000\000\000\000\000\000\024\000\000\000\023\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \255\255\000\000\000\000\000\000\000\000\255\255\000\000\000\000\
    \255\255\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\255\255";
  Lexing.lex_check =
   "\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\012\000\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\019\000\019\000\255\255\
    \255\255\019\000\255\255\255\255\255\255\255\255\255\255\255\255\
    \000\000\008\000\002\000\004\000\009\000\006\000\000\000\006\000\
    \012\000\015\000\012\000\016\000\019\000\023\000\024\000\255\255\
    \255\255\255\255\255\255\255\255\019\000\255\255\019\000\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \000\000\255\255\255\255\255\255\255\255\006\000\255\255\255\255\
    \012\000\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\019\000";
  Lexing.lex_base_code =
   "";
  Lexing.lex_backtrk_code =
   "";
  Lexing.lex_default_code =
   "";
  Lexing.lex_trans_code =
   "";
  Lexing.lex_check_code =
   "";
  Lexing.lex_code =
   "";
}

let rec token lexbuf =
   __ocaml_lex_token_rec lexbuf 0
and __ocaml_lex_token_rec lexbuf __ocaml_lex_state =
  match Lexing.engine __ocaml_lex_tables __ocaml_lex_state lexbuf with
      | 0 ->
# 11 "src/visualisation/htmlLexer.mll"
                  ( DOT )
# 120 "src/visualisation/htmlLexer.ml"

  | 1 ->
# 12 "src/visualisation/htmlLexer.mll"
                  ( incr counter;
                    comment_begin_line lexbuf )
# 126 "src/visualisation/htmlLexer.ml"

  | 2 ->
# 14 "src/visualisation/htmlLexer.mll"
                  ( incr counter;
                    Buffer.add_string buf "(*";
                    simple_comment lexbuf )
# 133 "src/visualisation/htmlLexer.ml"

  | 3 ->
let
# 17 "src/visualisation/htmlLexer.mll"
       l
# 139 "src/visualisation/htmlLexer.ml"
= Lexing.sub_lexeme_char lexbuf lexbuf.Lexing.lex_start_pos in
# 17 "src/visualisation/htmlLexer.mll"
                  ( CHAR(l) )
# 143 "src/visualisation/htmlLexer.ml"

  | __ocaml_lex_state -> lexbuf.Lexing.refill_buff lexbuf;
      __ocaml_lex_token_rec lexbuf __ocaml_lex_state

and simple_comment lexbuf =
   __ocaml_lex_simple_comment_rec lexbuf 6
and __ocaml_lex_simple_comment_rec lexbuf __ocaml_lex_state =
  match Lexing.engine __ocaml_lex_tables __ocaml_lex_state lexbuf with
      | 0 ->
# 20 "src/visualisation/htmlLexer.mll"
                  ( incr counter; 
                    Buffer.add_string buf "(*";
                    simple_comment lexbuf)
# 157 "src/visualisation/htmlLexer.ml"

  | 1 ->
# 23 "src/visualisation/htmlLexer.mll"
                  ( decr counter;
                    Buffer.add_string buf "*)";
                    if !counter = 0 then begin
                      let contents = Buffer.contents buf in
                      Buffer.reset buf;
                      STR(contents)
                    end
                    else
                      simple_comment lexbuf )
# 170 "src/visualisation/htmlLexer.ml"

  | 2 ->
let
# 32 "src/visualisation/htmlLexer.mll"
       l
# 176 "src/visualisation/htmlLexer.ml"
= Lexing.sub_lexeme_char lexbuf lexbuf.Lexing.lex_start_pos in
# 32 "src/visualisation/htmlLexer.mll"
                  ( Buffer.add_char buf l;
                    simple_comment lexbuf )
# 181 "src/visualisation/htmlLexer.ml"

  | __ocaml_lex_state -> lexbuf.Lexing.refill_buff lexbuf;
      __ocaml_lex_simple_comment_rec lexbuf __ocaml_lex_state

and comment lexbuf =
   __ocaml_lex_comment_rec lexbuf 12
and __ocaml_lex_comment_rec lexbuf __ocaml_lex_state =
  match Lexing.engine __ocaml_lex_tables __ocaml_lex_state lexbuf with
      | 0 ->
# 36 "src/visualisation/htmlLexer.mll"
                  ( incr counter; 
                    Buffer.add_string buf "(*";
                    comment lexbuf)
# 195 "src/visualisation/htmlLexer.ml"

  | 1 ->
# 39 "src/visualisation/htmlLexer.mll"
                  ( decr counter;
                    if !counter = 0 then begin
                      let contents = Buffer.contents buf in
                      Buffer.reset buf;
                      COM(contents)
                    end
                    else begin
                      Buffer.add_string buf "*)";
                      comment lexbuf
                    end )
# 209 "src/visualisation/htmlLexer.ml"

  | 2 ->
# 49 "src/visualisation/htmlLexer.mll"
                  ( Buffer.add_char buf '\n';
                    comment_begin_line lexbuf )
# 215 "src/visualisation/htmlLexer.ml"

  | 3 ->
let
# 51 "src/visualisation/htmlLexer.mll"
       l
# 221 "src/visualisation/htmlLexer.ml"
= Lexing.sub_lexeme_char lexbuf lexbuf.Lexing.lex_start_pos in
# 51 "src/visualisation/htmlLexer.mll"
                  ( Buffer.add_char buf l;
                    comment lexbuf )
# 226 "src/visualisation/htmlLexer.ml"

  | __ocaml_lex_state -> lexbuf.Lexing.refill_buff lexbuf;
      __ocaml_lex_comment_rec lexbuf __ocaml_lex_state

and comment_begin_line lexbuf =
   __ocaml_lex_comment_begin_line_rec lexbuf 19
and __ocaml_lex_comment_begin_line_rec lexbuf __ocaml_lex_state =
  match Lexing.engine __ocaml_lex_tables __ocaml_lex_state lexbuf with
      | 0 ->
# 55 "src/visualisation/htmlLexer.mll"
                  ( incr counter; 
                    Buffer.add_string buf "(*";
                    comment lexbuf)
# 240 "src/visualisation/htmlLexer.ml"

  | 1 ->
# 58 "src/visualisation/htmlLexer.mll"
                  ( decr counter;
                    if !counter = 0 then begin
                      let contents = Buffer.contents buf in
                      Buffer.reset buf;
                      COM(contents)
                    end
                    else begin
                      Buffer.add_string buf "*)";
                      comment lexbuf
                    end )
# 254 "src/visualisation/htmlLexer.ml"

  | 2 ->
# 68 "src/visualisation/htmlLexer.mll"
                  ( comment_begin_line lexbuf )
# 259 "src/visualisation/htmlLexer.ml"

  | 3 ->
# 69 "src/visualisation/htmlLexer.mll"
                  ( Buffer.add_char buf '\n';
                    comment_begin_line lexbuf )
# 265 "src/visualisation/htmlLexer.ml"

  | 4 ->
let
# 71 "src/visualisation/htmlLexer.mll"
       l
# 271 "src/visualisation/htmlLexer.ml"
= Lexing.sub_lexeme_char lexbuf lexbuf.Lexing.lex_start_pos in
# 71 "src/visualisation/htmlLexer.mll"
                  ( Buffer.add_char buf l;
                    comment lexbuf )
# 276 "src/visualisation/htmlLexer.ml"

  | __ocaml_lex_state -> lexbuf.Lexing.refill_buff lexbuf;
      __ocaml_lex_comment_begin_line_rec lexbuf __ocaml_lex_state

;;

