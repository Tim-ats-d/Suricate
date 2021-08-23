(** Log record are object propaged by logger when a log is raised. *)

(** {1 Type} *)

type t = {
  message : string;  (** Represents the log message. *)
  level : Log_level.t;  (** Level of functions which emitted log. *)
  raised_date : Unix.tm;
      (** Represents date when the log was triggered as [Unix.tm]. *)
  name : string;  (** Name of logger which emitted log. *)
}
(** Describes a log. *)

(** {1 API} *)

(** [Log.create msg level name] produces a log record. *)
val create : string -> Log_level.t -> string -> t
