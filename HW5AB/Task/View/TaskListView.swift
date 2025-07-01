import SwiftUI

// Define a view called TaskListView.
struct TaskListView: View {
    // @ObservedObject property wrapper to observe changes in the task store.
    @ObservedObject var taskStore: TaskStore
    // A Boolean value to determine whether to show completed tasks or not.
    let showCompleted: Bool
    // A state property to hold the search text input.
    @State private var searchText = ""

    // A computed property that filters the tasks based on completion status and search text.
    var filteredTasks: [Task] {
        taskStore.tasks.filter { task in
            // Filter tasks by completion status and search text.
            task.isCompleted == showCompleted && (searchText.isEmpty || task.title.lowercased().contains(searchText.lowercased()))
        }
    }

    var body: some View {
        // A list view that displays the filtered tasks.
        List {
            // Iterate over each filtered task and create a row for it.
            ForEach(filteredTasks) { task in
                // A navigation link to navigate to the task detail view when a task row is tapped.
                NavigationLink(destination: TaskDetailView(task: $taskStore.tasks.first(where: { $0.id == task.id })!)) {
                    VStack {
                        // A custom view to display the task row.
                        TaskRowView(task: $taskStore.tasks.first(where: { $0.id == task.id })!)
                        // A divider line between tasks.
//                        Divider()
                    }
                    // Adds padding to the leading and trailing sides.
                    .padding([.leading, .trailing], 20)
                }
            }
        }
        // Sets the list style to plain.
        .listStyle(PlainListStyle())
        // Adds a search bar to the list.
        .searchable(text: $searchText, prompt: "Search tasks")
    }
}

// This structure provides a preview of the TaskListView in the Xcode preview canvas.
struct TaskListView_Previews: PreviewProvider {
    static var previews: some View {
        // Provide a preview of the TaskListView with a TaskStore and showCompleted set to false.
        TaskListView(taskStore: TaskStore(), showCompleted: false)
    }
}
