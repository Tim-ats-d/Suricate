(** Filers are additionnal control object used by [Suricate]. Filtering
    function received a log record and decides if the log should be propagated
    to the logger's handlers. *)

(** {1 Type} *)

(** Describes a filtering function. *)
type t = Log.t -> bool
