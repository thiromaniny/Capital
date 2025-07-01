import SwiftUI

// Define a view called TaskDetailView.
struct TaskDetailView: View {
    // @Binding is a property wrapper that creates a two-way connection between a view and its underlying model data.
    // In this case, task is a binding to a Task object.
    @Binding var task: Task

    var body: some View {
        // The body of the view.
        VStack {
            // A form that contains sections for editing task details.
            Form {
                // Section for the task title.
                Section(header: Text("Task Title")) {
                    // A text field for editing the task title.
                    TextField("Title", text: $task.title)
                }
                // Section for the task notes.
                Section(header: Text("Notes")) {
                    // A text field for editing the task notes.
                    TextField("Notes", text: $task.notes, axis: .vertical)
                        .lineLimit(5...) // Allows the text field to have multiple lines.
                }
                // Section for the task completion toggle.
                Section {
                    // A toggle switch for marking the task as completed or not.
                    Toggle("Completed: ", isOn: $task.isCompleted)
                }
            }
            .navigationBarTitleDisplayMode(.inline) // Sets the navigation bar title display mode to inline.
            Spacer() // Adds flexible space at the bottom.
        }
    }
}

// This structure provides a preview of the TaskDetailView in the Xcode preview canvas.
struct TaskDetail_Previews: PreviewProvider {
    // A sample task for previewing.
    @State static var task = Task(title: "This Task", category: .noCategory)
    
    static var previews: some View {
        // Provide a preview of the TaskDetailView with a sample task.
        TaskDetailView(task: $task)
    }
}

