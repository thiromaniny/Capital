

import Foundation

// A class that manages a collection of tasks and allows observing changes to its tasks.
class TaskStore: ObservableObject {
    // Published property that holds an array of tasks. Views observing this property will update when it changes.
    @Published var tasks: [Task] = [
        Task(title: "Task 1", isCompleted: false, notes: "Notes for task 1"),
        Task(title: "Task 2", isCompleted: true, notes: "Notes for task 2"),
        Task(title: "Task 3", isCompleted: false, notes: "Notes for task 3"),
        Task(title: "Task 4", isCompleted: true, notes: "Notes for task 4"),
        Task(title: "Task 5", isCompleted: false, notes: "Notes for task 5")
    ]
    
    // Adds a new task to the tasks array.
    func addTask(_ task: Task) {
        tasks.append(task)
    }
    
    // Toggles the completion status of a given task.
    // - Parameter task: The task object whose completion status is to be toggled.
    func toggleCompletion(of task: Task) {
        // Finds the index of the task in the tasks array.
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            // Toggles the isCompleted property of the task at the found index.
            tasks[index].isCompleted.toggle()
        }
    }
}


