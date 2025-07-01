import SwiftUI // Import the SwiftUI framework to use its views and modifiers

/// A generic SwiftUI view that displays content when it's unavailable.
/// - Parameter Content: The type of view that will be displayed, conforming to `View`.
struct ContentUnavailableView<Content: View>: View {
    /// A closure that returns the view to be displayed when content is unavailable.
    let content: () -> Content

    /// The body property of the view that defines its layout and content.
    var body: some View {
        VStack {
            // Calls the closure to create the view and displays it.
            content()
                // Sets the font of the content to a headline style.
                .font(.headline)
                // Adds padding around the content.
                .padding()
            // Adds a spacer to push content to the top.
            Spacer()
        }
    }
}

