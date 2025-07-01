import SwiftUI

// Define a view called ToggleButton.
struct ToggleButton: View {
    // @Binding is a property wrapper that creates a two-way connection between a view and its underlying model data.
    // In this case, isCompleted is a binding to a Bool value.
    @Binding var isCompleted: Bool

    var body: some View {
        // The body of the view.
        // A button that, when pressed, toggles the isCompleted property with animation.
        Button(action: {
            // Animate the toggle action with easeInOut animation over 1 second.
            withAnimation(Animation.easeInOut(duration: 1.0)) {
                isCompleted.toggle()
            }
        }) {
            // The button label consists of an image.
            // The image changes based on the isCompleted value.
            Image(systemName: isCompleted ? "checkmark.square" : "square")
                .foregroundColor(isCompleted ? .green : .red) // Changes the color based on isCompleted value.
                .font(.title) // Sets the font size to title.
        }
        // Apply plain button style to remove any default styling.
        .buttonStyle(PlainButtonStyle())
    }
}

