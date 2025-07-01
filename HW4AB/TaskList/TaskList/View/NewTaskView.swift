import SwiftUI

// A view that allows the user to add a new task.
struct NewTaskView: View {
    // Access the presentation mode environment value to control the view's presentation state.
    @Environment(\.presentationMode) var presentationMode
    
    // Observes the taskStore to manage and add new tasks.
    @ObservedObject var taskStore: TaskStore
    
    // State variables to hold the input for the new task's title and notes.
    @State private var title: String = ""
    @State private var notes: String = ""
    
    // The body property defines the view hierarchy for the NewTaskView.
    var body: some View {
        // A navigation view to provide navigation capabilities.
        NavigationView {
            // A form that contains sections for entering the task's title and notes.
            Form {
                // Section for entering the task title.
                Section(header: Text("Task Title")) {
                    // TextField for the task title, binding its text to the title state variable.
                    TextField("Title", text: $title)
                }
                // Section for entering the task notes.
                Section(header: Text("Notes")) {
                    // TextEditor for the task notes, binding its text to the notes state variable.
                    TextEditor(text: $notes)
                        .frame(minHeight: 100) // Sets a minimum height for the text editor.
                        .cornerRadius(8) // Rounds the corners of the text editor.
                        .overlay(
                            // Adds a gray border around the text editor.
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                }
            }
            .navigationBarTitle("Adding New Task", displayMode: .inline) // Sets the title of the navigation bar.
            .navigationBarItems(
                // Adds a Cancel button to the navigation bar.
                leading: Button("Cancel") {
                    // Dismisses the view when the Cancel button is tapped.
                    presentationMode.wrappedValue.dismiss()
                },
                // Adds an Add button to the navigation bar.
                trailing: Button("Add") {
                    // Creates a new task with the entered title and notes.
                    let newTask = Task(title: title, isCompleted: false, notes: notes)
                    // Adds the new task to the taskStore.
                    taskStore.addTask(newTask)
                    // Dismisses the view when the Add button is tapped.
                    presentationMode.wrappedValue.dismiss()
                }
                // Disables the Add button if the title is empty.
                .disabled(title.isEmpty)
            )
        }
    }
}
