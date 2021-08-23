(** Here is the list of modules exposed by the [Suricate] library. *)

module Log = Log
module Logger = Logger
module Filter = Filter
module Formatter = Formatter

module Handler : sig
  include module type of Handler

  module File = File_handler
  module Stream = Stream_handler
end

module Log_level = Log_level
