import kotlinx.cinterop.ExperimentalForeignApi
import kotlinx.cinterop.cValue
import raylib.*

@OptIn(kotlinx.cinterop.ExperimentalForeignApi::class)
fun main() {
    InitWindow(800, 600, "Raylib Kotlin Example")
    SetTargetFPS(60)
    while (!WindowShouldClose()) {
        BeginDrawing()
        ClearBackground(
                cValue<Color> {
                    r = 245u
                    g = 245u
                    b = 245u
                    a = 255u
                }
        )
        DrawText(
                "Hello World!",
                190,
                200,
                20,
                cValue<Color> {
                    r = 80u
                    g = 80u
                    b = 80u
                    a = 255u
                }
        )
        EndDrawing()
    }
}
