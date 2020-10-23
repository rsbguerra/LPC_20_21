BIN=miniturtle

all:
	dune build ./$(BIN).exe

test: $(BIN)
	for f in tests/*.logo; do ./$(BIN) $$f; done

clean:
	dune clean