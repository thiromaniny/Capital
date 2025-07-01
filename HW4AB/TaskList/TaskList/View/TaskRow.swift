import SwiftUI

// A view that represents a single row in the list of tasks.
struct TaskRow: View {
    // Observes changes to taskStore and will update this view accordingly when taskStore changes.
    @ObservedObject var taskStore: TaskStore
    
    // A task object that this row represents.
    var task: Task
    
    // The body property defines the content and behavior of the view.
    var body: some View {
        // A horizontal stack that arranges its child views in a horizontal line.
        HStack {
            // Displays the title of the task.
            Text(task.title)
            
            // Spacer to push the button to the far right of the row.
            Spacer()
            
            // A button that toggles the completion status of the task.
            Button(action: {
                // Calls the toggleCompletion method on taskStore to update the task's completion status.
                taskStore.toggleCompletion(of: task)
            }) {
                // Displays a checkmark or square icon based on the task's completion status.
                Image(systemName: task.isCompleted ? "checkmark.square" : "square")
                    // Sets the color of the icon based on the task's completion status.
                    .foregroundColor(task.isCompleted ? .green : .red)
            }
            // Uses a plain button style to avoid default button styling that may interfere with the layout.
            .buttonStyle(PlainButtonStyle())
        }
        // Adds padding around the HStack to create space between the row's content and its edges.
        .padding()
    }
}



