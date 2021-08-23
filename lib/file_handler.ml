let write filename str =
  let out_chan = open_out filename in
  Printf.fprintf out_chan "%s" str;
  close_out out_chan

let read_all filename =
  let in_chan = open_in filename in
  let n = in_channel_length in_chan in
  let b = Bytes.create n in
  really_input in_chan b 0 n;
  close_in in_chan;
  Bytes.unsafe_to_string b

let append_line filename line =
  Printf.sprintf "%s\n%s" (read_all filename) line |> write filename

let create ~filename = Handler.create ~emit:(append_line filename)
