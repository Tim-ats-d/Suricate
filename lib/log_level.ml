type t = Debug | Info | Warning | Error | Critical

let to_string ?(uppercase = false) level =
  (match level with
  | Debug -> "debug"
  | Info -> "info"
  | Warning -> "warning"
  | Error -> "error"
  | Critical -> "critical")
  |> if uppercase then String.uppercase_ascii else Fun.id
