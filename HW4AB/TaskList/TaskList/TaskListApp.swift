

import SwiftUI

// The main entry point for the TaskListApp application.
@main
struct TaskListApp: App {
    // Declares a state object to manage the state of tasks throughout the app.
    // @StateObject ensures that the TaskStore instance is created once and is owned by the TaskListApp.
    @StateObject private var taskStore = TaskStore()
    
    // The body property defines the content and behavior of the app's main scene.
    var body: some Scene {
        // WindowGroup manages the app's main window and provides the root view of the app.
        WindowGroup {
            // ContentView is the root view of the app, where the user interface starts.
            // The taskStore is passed to ContentView to manage and observe task data.
            ContentView()
                .environmentObject(taskStore) // Makes taskStore available to all child views.
        }
    }
}



