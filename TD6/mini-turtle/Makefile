BIN=mini-turtle

all:
	dune build ./$(BIN).exe --verbose

test: $(BIN)
	for f in tests/*.logo; do ./$(BIN) $$f; done

clean:
	dune clean