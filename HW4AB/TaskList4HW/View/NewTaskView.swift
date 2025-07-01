//
//  NewTaskView.swift
//  TaskList4HW
//
//  Created by sam on 6/24/24.
//

import SwiftUI

struct NewTaskView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var taskStore: TaskStore
    @State private var title: String = ""
    @State private var notes: String = ""
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Title", text: $title)
                TextField("Notes", text: $notes)
                Button("Add") {
                    let newTask = Task(title: title, isCompleted: false, notes: notes)
                    taskStore.addTask(newTask)
                    presentationMode.wrappedValue.dismiss()
                }
                Button("Cancel") {
                    presentationMode.wrappedValue.dismiss()
                }
            }
            .navigationTitle("New Task")
        }
    }
}
