open Suricate

module Nul_handler =
(val Handler.create Debug ~formatter:(fun _ -> "") ~emit:(fun _ -> ()))

module Custom_logger =
(val Logger.create "main" Info ~handlers:[ (module Nul_handler) ])

let () = Custom_logger.info "This message will never be displayed "
