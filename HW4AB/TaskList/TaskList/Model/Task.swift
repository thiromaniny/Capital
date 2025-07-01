

import Foundation

// The Task struct represents a task with a unique identifier, title, completion status, and notes.
struct Task: Identifiable, Codable {
    // A unique identifier for each task, automatically generated.
    var id: UUID = UUID()
    
    // The title of the task, describing what the task is about.
    var title: String
    
    // A boolean indicating whether the task has been completed.
    var isCompleted: Bool
    
    // Additional notes or details about the task.
    var notes: String
}


