server: build
	ocsigenserver -v -c config/server.xml

browse:
	sensible-browser http://localhost:5000
	make server

build:
	ocamlbuild -use-ocamlfind -plugin-tags 'package(eliom.ocamlbuild)' \
   					 app/server/chat.cma app/server/chat.cmxs \
   					 app/client/chat.js
	@ln -sf ../_build/app/client/chat.js public/chat.js

clean:
	rm -f public/chat.js
	ocamlbuild -clean

.PHONY: server build clean
