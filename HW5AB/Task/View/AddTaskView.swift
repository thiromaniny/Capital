import SwiftUI

struct AddTaskView: View {
    // @Environment property wrapper to access the dismiss action for this view.
    @Environment(\.dismiss) var dismiss

    // An observed object to track changes in the task store.
    @ObservedObject var taskStore: TaskStore

    // State properties to hold the input values for the new task.
    @State private var title = ""
    @State private var notes = ""
    @State private var category = "No Category"

    var body: some View {
        // A navigation stack that provides navigation capabilities.
        NavigationStack {
            // A form to collect input from the user.
            Form {
                // Section for task title input.
                Section(header: Text("Task Title")) {
                    TextField("Title", text: $title)
                }
                // Section for notes input.
                Section(header: Text("Notes")) {
                    TextField("Notes", text: $notes, axis: .vertical)
                        .lineLimit(5...) // Allows the notes field to expand up to 5 lines.
                }
            }
            .toolbar {
                // Adds a Cancel button to the navigation bar's leading side.
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        // Action to perform when Cancel button is tapped: stop adding a task and dismiss the view.
                        taskStore.addingTask = false
                        dismiss()
                    }, label: {
                        Text("Cancel")
                    })
                }
                // Adds a title to the navigation bar.
                ToolbarItem(placement: .principal) {
                    Text("Adding New Task")
                        .font(.headline) // Sets the font style of the title.
                }
                // Adds an Add button to the navigation bar's trailing side.
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        // Action to perform when Add button is tapped: add the task and dismiss the view.
                        taskStore.addTask(title: title)
                        taskStore.addingTask = false
                        dismiss()
                    }, label: {
                        Text("Add")
                    })
                    .disabled(title.isEmpty) // Disables the Add button if the title is empty.
                }
            }
            .navigationBarTitleDisplayMode(.inline) // Displays the title in the center.
        }
    }
}

// This structure provides a preview of the AddTaskView in the Xcode preview canvas.
struct AddTask_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView(taskStore: TaskStore())
    }
}
