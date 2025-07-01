import SwiftUI

// The main view of the application
struct ContentView: View {
  // A state object to manage the view model, which contains the todo data and logic
  @StateObject private var viewModel = TodoViewModel()
  
  var body: some View {
    // NavigationStack provides navigation capabilities
    NavigationStack {
      // Check if the todos list is empty
      if viewModel.todos.isEmpty {
        // Display a progress indicator if the todos list is empty
        ProgressView()
          .scaleEffect(8) // Scale the progress indicator to make it larger
          .task {
            // Fetch the todo items when the view appears
            await viewModel.fetchTodos()
          }
      } else {
        // If the todos list is not empty, display the list of todos
        List(viewModel.todos) { todo in
          // NavigationLink to navigate to the detail view of the selected todo
          NavigationLink(destination: TodoDetailView(todo: todo)) {
            Text(todo.title) // Display the title of the todo item
          }
        }
        .navigationTitle("Todos") // Set the title of the navigation bar
        .task {
          // Fetch the todo items when the view appears
          await viewModel.fetchTodos()
        }
        .alert("Error", isPresented: $viewModel.showAlert) {
          // Define the action for the alert's button
          Button("OK", role: .cancel) {}
        } message: {
          // Display the error message in the alert
          Text(viewModel.errorMessage ?? "Unknown error")
        }
      }
    }
  }
}

// A detailed view for displaying individual todo item details
struct TodoDetailView: View {
  let todo: Todo // The todo item to display
  
  var body: some View {
    // VStack to arrange the text elements vertically
    VStack(alignment: .leading, spacing: 10) {
      // Display user ID of the todo item
      Text("User ID: \(todo.userId)")
      // Display title of the todo item
      Text("Title: \(todo.title)")
      // Display completion status of the todo item
      Text("Completed: \(todo.completed ? "Yes" : "No")")
    }
    .padding() // Add padding around the VStack
    .navigationTitle("Todo Detail") // Set the title of the navigation bar
  }
}

// A preview of the ContentView
#Preview {
  ContentView()
}




