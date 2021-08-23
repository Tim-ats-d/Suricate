let print_in_channel end' out_chan str =
  str ^ end' |> Printf.fprintf out_chan "%s"

let create ?(terminator = "\n") ?(outc = stderr) =
  Handler.create ~emit:(print_in_channel terminator outc)
