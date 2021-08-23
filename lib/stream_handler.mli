(** [Stream] handler sends logging output to an out channel. *)

(** {1 API} *)

(** [Stream.create level format ~terminator:t ~outc:o] produces a handler
    where [t] is string added to end of each logging output (by default to
    ["\n"]) and [o] is [out_channel] where logging output was sends (by default
    to [stderr]). *)
val create :
  ?terminator:string ->
  ?outc:out_channel ->
  Log_level.t ->
  formatter:Formatter.t ->
  (module Handler.LEVELED_HANDLER)
