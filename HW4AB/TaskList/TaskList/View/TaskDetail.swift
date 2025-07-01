import SwiftUI

// A view that displays the details of a specific task.
struct TaskDetail: View {
    // The TaskDetail view observes changes to taskStore and updates its view accordingly.
    @ObservedObject var taskStore: TaskStore
    
    // The task to display details for.
    var task: Task
    
    // The body property defines the view hierarchy for the TaskDetail view.
    var body: some View {
        VStack(alignment: .leading) {
            // Section for displaying the task title
            Text("TASK TITLE")
                .font(.headline) // Applies a headline font style
                .padding(.bottom, 2) // Adds padding below the text
            
            // Displays the actual title of the task
            Text(task.title)
                .foregroundColor(.gray) // Sets the text color to gray
                .padding(.bottom) // Adds padding below the text
            
            // Section for displaying the task notes
            Text("NOTES")
                .font(.headline) // Applies a headline font style
                .padding(.bottom, 2) // Adds padding below the text
            
            // Displays the notes of the task
            Text(task.notes)
                .foregroundColor(.gray) // Sets the text color to gray
                .padding(.bottom) // Adds padding below the text
            
            // Toggle for marking the task as completed or not
            Toggle("Completed", isOn: Binding<Bool>(
                get: { task.isCompleted },
                set: { newValue in
                    // Find the index of the task in taskStore's tasks array
                    if let index = taskStore.tasks.firstIndex(where: { $0.id == task.id }) {
                        // Update the task's completion status
                        taskStore.tasks[index].isCompleted = newValue
                    }
                }
            ))
            .padding() // Adds padding around the toggle
            
            Spacer() // Adds flexible space to push the content to the top
        }
        .padding() // Adds padding around the entire VStack
    }
}

