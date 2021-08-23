(** Handler are used to make the link with logger. *)

(** {1 Handlers} *)

(** {2 Handler module type} *)

(** API used to describle a handler. *)
module type HANDLER = sig
  (** The formatter used by handler to log message. *)
  val formatter : Formatter.t

  (** The function which called by [Logger] when it log *)
  val emit : string -> unit
end

(** Full API used to describe a handler with its own log level. *)
module type LEVELED_HANDLER = sig
  include HANDLER

  (** The handler's log level *)
  val level : Log_level.t
end

(** {2 API} *)

(** [Handler.create level ~formatter ~emit] produces a fresh [LEVELED_HANDLER].
    It is a shorcut to facilitate custom handler construction.*)
val create :
  Log_level.t ->
  formatter:Formatter.t ->
  emit:(string -> unit) ->
  (module LEVELED_HANDLER)

(** [Handler.make level (module H)] produces a [LEVELED_HANDLER].
    It is a shorcut to facilitate custom handler construction. *)
val make : Log_level.t -> (module HANDLER) -> (module LEVELED_HANDLER)
