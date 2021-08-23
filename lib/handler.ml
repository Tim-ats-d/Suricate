module type HANDLER = sig
  val formatter : Formatter.t

  val emit : string -> unit
end

module type LEVELED_HANDLER = sig
  include HANDLER

  val level : Log_level.t
end

let create level ~formatter ~emit =
  (module struct
    let level = level

    and formatter = formatter

    and emit = emit
  end : LEVELED_HANDLER)

let make level (module H : HANDLER) =
  (module struct
    include H

    let level = level
  end : LEVELED_HANDLER)
