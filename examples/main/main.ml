open Suricate

let string_of_unix_tm ({ tm_hour; tm_min; tm_sec; _ } : Unix.tm) =
  Printf.sprintf "%i:%i:%i" tm_hour tm_min tm_sec

let formatter (log : Log.t) =
  let level = log.level |> Log_level.to_string ~uppercase:true
  and date = string_of_unix_tm log.raised_date
  and msg = log.message in
  Printf.sprintf "%s :: %s :: %s" level date msg

module File_handler =
(val Handler.File.create Warning ~filename:"examples/main/logbook.log" ~formatter)

module Stream_handler = (val Handler.Stream.create Debug ~formatter)

module Main_logger =
(val Logger.create "main" Debug
       ~handlers:[ (module File_handler); (module Stream_handler) ])

let () =
  Main_logger.critical "This message is displayed because of an side effect!"
