import SwiftUI

// MARK: - ContentView

struct ContentView: View {
    // A StateObject that holds a reference to the TaskStore, which manages the list of tasks.
    @StateObject var taskStore = TaskStore()

    var body: some View {
        // A TabView creates a tab bar at the bottom of the screen.
        TabView {
            // First tab:  not completed task lists
            NavigationView {
                // TaskListView displays the list of tasks.
                // The showCompleted parameter is set to false to show only incomplete tasks.
                TaskListView(taskStore: taskStore, showCompleted: false)
                    .navigationTitle("Tasks") // Sets the title of the navigation bar.
                    .toolbar {
                        // Adds a button to the navigation bar to add a new task.
                        ToolbarItem(placement: .navigationBarTrailing) {
                            NewTaskButtonView(taskStore: taskStore)
                        }
                    }
            }
            // Configures the tab item with an icon and text.
            .tabItem {
                Image(systemName: "list.bullet.circle")
                Text("Tasks")
            }

            // Second tab: completed task Lists
            NavigationView {
                // TaskListView displays the list of tasks.
                // The showCompleted parameter is set to true to show only completed tasks.
                TaskListView(taskStore: taskStore, showCompleted: true)
                    .navigationTitle("Completed") // Sets the title of the navigation bar.
                    .toolbar {
                        // Adds a button to the navigation bar to add a new task.
                        ToolbarItem(placement: .navigationBarTrailing) {
                            NewTaskButtonView(taskStore: taskStore)
                        }
                    }
            }
            // Configures the tab item with an icon and text.
            .tabItem {
                Image(systemName: "checkmark.circle")
                Text("Completed")
            }
        }
    }
}

struct MainView: View {
    var body: some View {
        SplashScreenView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
//// This structure provides a preview of the ContentView in the Xcode preview canvas.
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
}
