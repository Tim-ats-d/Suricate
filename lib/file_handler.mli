(** [File] handler writes logging output in a file. *)

(** [File.create level format ~filename:f] produces a handler where [f] is the
    file name where logging output was written. *)
val create :
  filename:string ->
  Log_level.t ->
  formatter:Formatter.t ->
  (module Handler.LEVELED_HANDLER)
