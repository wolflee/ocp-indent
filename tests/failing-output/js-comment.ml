(* ocp-indent is not going to be confused by comment-embedded tokens. *)



type t = {
  (* This is a comment *)
  a: int;
}

type t = {
  (* This is a comment : with a colon. *)
  a: int;
}

type t = {
  a: int;
  (* with the :     second field *)
  b: int;
}

type t = {
  a: int;
  b: int;
  (* and : the third... *)
  c: int;
}



(* colon in CR comment messes Tuareg up *)
type cfg = {
  foo : int;  (* CR mburns: float? *)
  bar : string;
}

(* To be more precise about the Tuareg bug, it is the fact that the colon in the comment
   is the first or second colon after the start of the record definition.  If the comment
   occurs after the first 2 fields in the record everything is fine.

   For example, this is OK: *)
type t= {
  foo : int;
  bar : string; (* CR mburns: float? *)
  baz : string;
}

(* but Tuareg messes this up *)
type t= {
  foo : int;
  (* CR mburns: float? *)
  bar : string;
}



(* Now that we have support for {v v} and {[ ]}, reindent inside comments,
   unless they are explicitly delimited as code or pre-formatted text.  These
   three all end up flattened to the same level. *)
(*
type t = {
  (* This is a comment *)
  a: int;
}
*)
(*
   type t = {
   (* This is a comment *)
   a: int;
   }
*)
(*
       type t = {
         (* This is a comment *)
         a: int;
       }
*)



(* Possible to-do warning: Star-prefixed lines are allowed and indented a little
   less, to line up with the star in the opening comment parenthesis.  Maybe we
   don't care enough about them to worry about it, though. *)



(** Doc comment text should be aligned with the first line, so indented more
    than otherwise. *)

(* We're now using some ocamldoc block syntax to control indentation, and sweeks
   and the rest of us have been relying on it, in and out of doc comments.

   {[
     let code =
       should be reindented like code
         so as to work also with vim
   ]}

    {v g
   This is totally verbatim text and shouldn't be reindented.  Maybe you don't
  need to special-case this, since you will not be reindenting comments.  It
 probably doesn't matter what the indentation of the first line of a
verbatim block is.  But how will this be done in vim?
 xx
  yy
   zz
    c  v}

   Does this even confront ocp-indent?  I think, when reindenting whole files,
   source code blocks do confront ocp-indent.
*)



(* {v

     (* comments embedded in verbatim sections *)
(* want to be able to verbatim-out big chunks of code *)

v} *)



(* {v

non-comments in verbatim sections
duh

v} *)
