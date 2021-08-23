(** Describes log level. *)

(** {1 Type} *)

(** Describes a log level. *)
type t = Debug | Info | Warning | Error | Critical

(** {1 Pretty Printing} *)

val to_string : ?uppercase:bool -> t -> string
