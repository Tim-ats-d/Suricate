(** Handler are used to make the link with logger. *)

(** {1 Logger} *)

(** {2 Logger module type} *)

(** API used to describle a handler. *)
module type LOGGER = sig
  (** The logger's name.  *)
  val name : string

  (** The logger's log level. *)
  val level : Log_level.t

  (** The logger's filter list. *)
  val filters : Filter.t list

  (**  Handlers attached to logger. *)
  val handlers : (module Handler.LEVELED_HANDLER) list
end

(** API used to describle a FULL handler with a set of log function. *)
module type FULL_LOGGER = sig
  include LOGGER

  (** Propages a log through logger's handlers with [Debug] log level. *)
  val debug : string -> unit

  (** Propages a log through logger's handlers with [Info] log level. *)
  val info : string -> unit

  (** Propages a log through logger's handlers with [Warning] log level. *)
  val warning : string -> unit

  (** Propages a log through logger's handlers with [Errror] log level. *)
  val error : string -> unit

  (** Propages a log through logger's handlers with [Critical] log level. *)
  val critical : string -> unit
end

(** {2 API}  *)

(** [Logger.Make (module L)] produces an extended copy of [L] with a set of log
    function. *)
module Make : functor (L : LOGGER) -> FULL_LOGGER

(** [Logger.create name level] produces a [FULL_LOGGER] module.
    Optionnal arguments consists of a list of filters (default to an empty
    list) and a list of handlers (default to an empty list) to attach to
    logger. *)
val create :
  ?filters:(Log.t -> bool) list ->
  ?handlers:(module Handler.LEVELED_HANDLER) list ->
  string ->
  Log_level.t ->
  (module FULL_LOGGER)

(** [Logger.set_level (module L) level] produces a copy of [L] with [level]
    log level. *)
val set_level :
  (module FULL_LOGGER) -> Log_level.t -> (module FULL_LOGGER)

(** [Logger.add_handler (module L) (module H)] produces a copy of [L] where
    [H] is added to [L] handlers list. *)
val add_handler :
  (module FULL_LOGGER) ->
  (module Handler.LEVELED_HANDLER) ->
  (module FULL_LOGGER)

(** [Logger.add_filter (module L) f] produces a copy of [L] where
    [f] is added to [L] filters list. *)
val add_filter : (module FULL_LOGGER) -> Filter.t -> (module FULL_LOGGER)
