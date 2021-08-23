type t = {
  message : string;
  level : Log_level.t;
  raised_date : Unix.tm;
  name : string;
}

let create message level name =
  let _, raised_date = Unix.(time () |> gmtime |> mktime) in
  { level; message; raised_date; name }
