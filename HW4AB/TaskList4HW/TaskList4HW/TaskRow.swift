//
//  TaskRow.swift
//  TaskList4HW
//
//  Created by sam on 6/24/24.
//

import SwiftUI

struct TaskRow: View {
    @ObservedObject var taskStore: TaskStore
    var task: Task
    
    var body: some View {
        HStack {
            Image(systemName: task.isCompleted ? "checkmark.square" : "square")
                .foregroundColor(task.isCompleted ? .green : .red)
            Text(task.title)
            Spacer()
        }
        .onTapGesture {
            taskStore.toggleCompletion(of: task)
        }
    }
}

