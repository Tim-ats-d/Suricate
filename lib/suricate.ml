module Filter = Filter
module Formatter = Formatter

module Handler = struct
  include Handler
  module File = File_handler
  module Stream = Stream_handler
end

module Log = Log
module Logger = Logger
module Log_level = Log_level
