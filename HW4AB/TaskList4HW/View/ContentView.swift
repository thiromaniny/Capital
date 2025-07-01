//
//  ContentView.swift
//  TaskList4HW
//
//  Created by sam on 6/24/24.
//
import SwiftUI

struct ContentView: View {
    @StateObject var taskStore = TaskStore()
    @State private var isPresentingNewTaskView = false
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Text("Tasks")
                        .font(.largeTitle)
                        .padding()
                    Spacer()
                    Button(action: {
                        isPresentingNewTaskView = true
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .font(.largeTitle)
                            .padding()
                    }
                }
                ScrollView {
                    ForEach(taskStore.tasks) { task in
                        NavigationLink(destination: TaskDetail(taskStore: taskStore, task: task)) {
                            TaskRow(taskStore: taskStore, task: task)
                                .padding(.horizontal)
                                .padding(.vertical, 4)
                        }
                    }
                }
                .sheet(isPresented: $isPresentingNewTaskView) {
                    NewTaskView(taskStore: taskStore)
                }
            }
            .navigationTitle("Task List")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

