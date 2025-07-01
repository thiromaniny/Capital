import SwiftUI

// Define a view called TaskRowView.
struct TaskRowView: View {
    // @Binding is a property wrapper that creates a two-way connection between a view and its underlying model data. task - binding to a Task object.
    @Binding var task: Task

    var body: some View {
        // The body of the view.
        HStack {
            // Display the task title.
            Text(task.title)
            Spacer() // Adds space between the task title and the toggle button.
            // A custom view to toggle the completion status of the task.
            ToggleButton(isCompleted: $task.isCompleted)
        }
        .font(.title3) // Sets the font to title3.
        .bold() // Makes the text bold.
        .padding([.top, .bottom], 15) // Adds padding of 15 points to the top and bottom.
        .padding([.leading, .trailing], 10) // Adds padding of 10 points to the leading and trailing sides.
    }
}


