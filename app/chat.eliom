let test_service _ () =
  Lwt.return "<html><head><title>hi</title></head><body>lo</body></html>"

let main_service =
  Eliom_registration.Html_text.register_service
    ~path:["test"]
    ~get_params:Eliom_parameter.any
    test_service
