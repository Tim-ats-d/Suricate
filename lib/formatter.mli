(** Formatter have to produce a log message from the received log record. *)

(** {1 Type} *)

type t = Log.t -> string
(** Describes a formatter function. *)
