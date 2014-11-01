module Chat =
  Eliom_registration.App (struct
      let application_name = "chat"
    end)

{shared{
  let (>>=) = Lwt.(>>=)

  open Eliom_content.Html5
}}

let print_time { Unix.tm_sec; tm_min; tm_hour } =
  Printf.sprintf "%02d:%02d:%02d" tm_hour tm_min tm_sec

let time =
  let time, set_time = React.S.create "" in
  Lwt.async (fun () ->
    while_lwt true do
      Lwt_unix.sleep 1.0 >>= fun () ->
      set_time (print_time (Unix.localtime (Unix.time ())));
      Lwt.return_unit
    done);
  Eliom_react.S.Down.of_react time

let main_service =
  Chat.register_service
     ~path:[""]
     ~get_params:Eliom_parameter.unit
    (fun () () ->
      let div  = D.div [C.node {{F.p [R.pcdata %time]}}] in
      Lwt.return
        (F.html
           (F.head (F.title (F.pcdata "Time")) [])
           (F.body [div]) ) )
