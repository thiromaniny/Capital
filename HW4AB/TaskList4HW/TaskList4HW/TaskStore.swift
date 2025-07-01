//
//  TaskStore.swift
//  TaskList4HW
//
//  Created by sam on 6/24/24.
//

import Foundation

class TaskStore: ObservableObject {
    @Published var tasks: [Task] = [
        Task(title: "Task 1", isCompleted: false, notes: "Notes for task 1"),
        Task(title: "Task 2", isCompleted: true, notes: "Notes for task 2"),
        Task(title: "Task 3", isCompleted: false, notes: "Notes for task 3"),
        Task(title: "Task 4", isCompleted: true, notes: "Notes for task 4"),
        Task(title: "Task 5", isCompleted: false, notes: "Notes for task 5")
    ]
    
    func addTask(_ task: Task) {
        tasks.append(task)
    }
    
    func toggleCompletion(of task: Task) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index].isCompleted.toggle()
        }
    }
}

