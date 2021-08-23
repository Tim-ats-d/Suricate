# Suricate

**Suricate** is a lightweight **logging library** inspired by Python [`logging`](https://docs.python.org/3/library/logging.html) library written in **Ocaml**.

## Installation

### Using opam

```
cd Suricate
opam install .
```

## Usage

```ocaml
open Suricate

let formatter (log : Log.t) =
  Printf.sprintf "%s :: %s"
    (log.level |> Log_level.to_string)
    log.message

module Stream_handler = (val Handler.Stream.create Debug ~formatter)

module Main_logger =
(val Logger.create "main" Debug ~handlers:[ (module Stream_handler) ])

let () = Main_logger.info "program is finished"
```

## Run examples

```
dune build examples
dune exec examples/main/main.exe
dune exec examples/custom/custom.exe
```

## Build documentation

```
dune build @doc
```

## License

* **GPL 3.0** or later. See [license](LICENSE) for more information.
