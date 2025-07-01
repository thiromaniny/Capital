//
//  TaskDetail.swift
//  TaskList4HW
//
//  Created by sam on 6/24/24.
//

import SwiftUI

struct TaskDetail: View {
    @ObservedObject var taskStore: TaskStore
    var task: Task
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(task.title)
                .font(.largeTitle)
                .padding(.bottom)
            Text(task.notes)
                .padding(.bottom)
            Toggle("Completed", isOn: Binding<Bool>(
                get: { task.isCompleted },
                set: { newValue in
                    if let index = taskStore.tasks.firstIndex(where: { $0.id == task.id }) {
                        taskStore.tasks[index].isCompleted = newValue
                    }
                }
            ))
            .padding()
            Spacer()
        }
        .navigationTitle("Task Detail")
        .padding()
    }
}
