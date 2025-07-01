import SwiftUI

// The main view of the application that displays a list of tasks and allows the user to add new tasks.
struct ContentView: View {
    // Declares a state object to manage the state of tasks throughout the app.
    // @StateObject ensures that the TaskStore instance is created once and is owned by the ContentView.
    @StateObject var taskStore = TaskStore()
    
    // State variable to track whether the NewTaskView is being presented.
    @State private var isPresentingNewTaskView = false
    
    // The body property defines the content and behavior of the view.
    var body: some View {
        // A navigation stack that manages a stack of views and provides navigation capabilities.
        NavigationStack {
            // A scroll view to display a list of tasks.
            ScrollView {
                // Iterates over the tasks in the taskStore and creates a view for each task.
                ForEach(taskStore.tasks) { task in
                    // NavigationLink to navigate to the TaskDetail view when a task is tapped.
                    NavigationLink(destination: TaskDetail(taskStore: taskStore, task: task)) {
                        // Displays a row for each task using the TaskRow view.
                        TaskRow(taskStore: taskStore, task: task)
                            .padding(.horizontal) // Adds horizontal padding to each row.
                            .padding(.vertical, 4) // Adds vertical padding to each row.
                    }
                }
            }
            // Presents a modal view (NewTaskView) when isPresentingNewTaskView is true.
            .sheet(isPresented: $isPresentingNewTaskView) {
                NewTaskView(taskStore: taskStore)
            }
            // Sets the title of the navigation bar.
            .navigationTitle("My Tasks")
            // Adds an overlay to the bottom leading corner of the view.
            .overlay(
                HStack {
                    // Button to present the NewTaskView.
                    Button(action: {
                        isPresentingNewTaskView = true
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .font(.largeTitle) // Sets the font size of the button.
                            .padding() // Adds padding around the button.
                    }
                    // Text label next to the button.
                    Text("New Task")
                        .padding(.leading, 10) // Adds padding to the leading edge of the text.
                }
                .padding() // Adds padding around the entire HStack.
                .cornerRadius(10) // Rounds the corners of the HStack.
                .shadow(radius: 5) // Adds a shadow effect to the HStack.
                .padding([.bottom, .leading], 16), // Adds padding to the bottom and leading edges of the HStack.
                alignment: .bottomLeading // Aligns the HStack to the bottom leading corner of the view.
            )
        }
    }
}

// A preview provider for the ContentView, allowing the view to be previewed in Xcode.
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
