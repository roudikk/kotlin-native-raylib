# Kotlin/Native Raylib

Just a small example of how to use Kotlin/Native with Raylib.

<img width="500" height="500" alt="image" src="https://github.com/user-attachments/assets/2e84452e-1811-40cf-8f5d-9169c7d0de8d" />


### Instructions

- Get Kotlin/Native compiler from the [Kotlin Github releases](https://github.com/JetBrains/kotlin/releases)
- Get Raylib from [Raylib releases](https://github.com/raysan5/raylib)
- Create `nativeInterop/cinterop/raylib.def` (This is how we tell the compiler where to locate the header files and specify linker/compiler opts)
```
headers = raylib.h
headerFilter = raylib.h
package = raylib

# Compiler options: point to the folder containing raylib headers
compilerOpts.linux = -Iraylib/include

# Linker options: point to the Raylib static or shared library
linkerOpts.linux = raylib/lib/libraylib.a

```
- Run `cinterop -def nativeInterop/cinterop/raylib.def -o build/cinterop/raylib`, this generates the `raylib.klib` that we can use as library
- Run `kotlinc-native Main.kt   -o Main   -library ./build/cinterop/raylib.klib`, this compiles `Main.kt` using the generated raylib library
- `./Main` ro run the program

(Or use `make run/build/clean`) from the Makefile.

Check [Kotlin C Interop](https://kotlinlang.org/docs/native-c-interop.html) to undesrtand more how to import and use c primitives/structs/etc.

_(I am by no means an expert, just thought it was fun to try this out)_
