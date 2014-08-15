server: build
	ocsigenserver -c config/server.xml

browse:
	sensible-browser http://localhost:5000
	make server

build:
	ocamlbuild -use-ocamlfind -plugin-tags 'package(eliom.ocamlbuild)' \
   					 app/server/chat.cma app/server/chat.cmxs \
   					 app/client/chat.js

clean:
	ocamlbuild -clean

.PHONY: server build clean
