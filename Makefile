SRC = exercises.typ
OUT = exercises.pdf

all: $(OUT)

$(OUT): $(SRC)
	typst compile $(SRC) $(OUT)

watch:
	typst watch $(SRC) $(OUT)

.PHONY: all watch
