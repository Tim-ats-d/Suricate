module type LOGGER = sig
  val name : string

  val level : Log_level.t

  val filters : Filter.t list

  val handlers : (module Handler.LEVELED_HANDLER) list
end

module type FULL_LOGGER = sig
  include LOGGER

  val debug : string -> unit

  val info : string -> unit

  val warning : string -> unit

  val error : string -> unit

  val critical : string -> unit
end

module Make (L : LOGGER) : FULL_LOGGER = struct
  include L

  let propage level msg =
    let is_filter = List.for_all (fun _ -> true) L.filters in
    if is_filter then
      let log = Log.create msg level L.name in
      List.iter
        (fun (module H : Handler.LEVELED_HANDLER) ->
          if H.level <= level && L.level <= level then H.formatter log |> H.emit)
        L.handlers

  open Log_level

  let debug = propage Debug

  let info = propage Info

  let warning = propage Warning

  let error = propage Error

  let critical = propage Critical
end

let create ?(filters = []) ?(handlers = []) name level =
  (module Make (struct
    let name = name

    and level = level

    and filters = filters

    and handlers = handlers
  end) : FULL_LOGGER)

let set_level (module L : FULL_LOGGER) lvl =
  (module struct
    include L

    let level = lvl
  end : FULL_LOGGER)

let add_handler (module L : FULL_LOGGER) (module H : Handler.LEVELED_HANDLER)
    =
  (module struct
    include L

    let handlers = (module H : Handler.LEVELED_HANDLER) :: L.handlers
  end : FULL_LOGGER)

let add_filter (module L : FULL_LOGGER) filter =
  (module Make (struct
    include L

    let filters = filter :: L.filters
  end) : FULL_LOGGER)
