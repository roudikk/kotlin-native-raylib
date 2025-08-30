CINTEROP_DEF = nativeInterop/cinterop/raylib.def
CINTEROP_OUT = build/cinterop/raylib.klib
MAIN_SRC = Main.kt
EXECUTABLE_NAME = Main
EXECUTABLE = $(EXECUTABLE_NAME).kexe

all: $(EXECUTABLE)

build/cinterop:
	mkdir -p build/cinterop

# Generate cinterop bindings
$(CINTEROP_OUT): $(CINTEROP_DEF) | build/cinterop
	cinterop -def $(CINTEROP_DEF) -o build/cinterop/raylib

# Compile Kotlin Native executable
$(EXECUTABLE): $(MAIN_SRC) $(CINTEROP_OUT)
	kotlinc-native $(MAIN_SRC) -o $(EXECUTABLE_NAME) -library $(CINTEROP_OUT)

build: $(EXECUTABLE)

run: $(EXECUTABLE)
	./$(EXECUTABLE)

clean:
	rm -rf build/
	rm -f $(EXECUTABLE)
