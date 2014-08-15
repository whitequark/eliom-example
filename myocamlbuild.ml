module M = Ocamlbuild_eliom.Make(struct
  let client_dir = "client"
  let server_dir = "server"
  let type_dir   = "type"
end)

let () = Ocamlbuild_plugin.dispatch M.dispatcher
