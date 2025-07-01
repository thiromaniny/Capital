import SwiftUI

// Define a view called NewTaskButtonView.
struct NewTaskButtonView: View {
    // @ObservedObject is a property wrapper that subscribes to an observable object.
    // taskStore is an instance of TaskStore.
    @ObservedObject var taskStore: TaskStore

    var body: some View {
        // The body of the view.
        // A button that, when pressed, toggles the addingTask property of taskStore.
        Button(action: {
            taskStore.addingTask.toggle()
        }, label: {
            // The button label consists of an image.
            Image(systemName: "plus.circle")
                .font(.title3) // Sets the font size to title3.
                .bold() // Makes the font bold.
        })
        // When the addingTask property of taskStore is true, present a sheet with AddTaskView.
        .sheet(isPresented: $taskStore.addingTask) {
            AddTaskView(taskStore: taskStore)
        }
    }
}

// This structure provides a preview of the NewTaskButtonView in the Xcode preview canvas.
struct NewTaskButton_Previews: PreviewProvider {
    static var previews: some View {
        // Provide a preview of the NewTaskButtonView with a sample TaskStore.
        NewTaskButtonView(taskStore: TaskStore())
    }
}

