# ExplorersApp
## Ensures that all apps are built with the iPad 9th Gen in mind

```swift
import ExplorersApp

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            // Replace the parameter on the next line with `.landscape` for a landscape orientation
            ExplorersApp(.portrait) {
                ContentView()
            }
        }
    }
}
```
