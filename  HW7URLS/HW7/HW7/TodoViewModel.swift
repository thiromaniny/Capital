//
//  TodoViewModel.swift


import Foundation

// This class is responsible for managing the data and business logic for the todos in the application.
// The @MainActor attribute ensures that all code within this class runs on the main thread.
@MainActor
class TodoViewModel: ObservableObject {
  
  // A published array to store the list of todos.
  // Views that observe this array will be notified of changes.
  @Published var todos: [Todo] = []
  
  // A published boolean to control the display of an alert.
  // Views that observe this property will show an alert when its value changes.
  @Published var showAlert: Bool = false
  
  // An optional string to store error messages.
  // This property can be nil if there are no error messages.
  @Published var errorMessage: String?
  
  // A published boolean to control the loading state.
  // Views that observe this property will show a loading indicator when its value is true.
  @Published var isLoading = false
  
  // This asynchronous function fetches todos from a remote server.
  func fetchTodos() async {
    // The URL string for the API endpoint.
    let urlString = "https://jsonplaceholder.typicode.com/todos"
    
    // Safely create a URL from the string.
    guard let url = URL(string: urlString) else { return }
    
    // Set loading state to true before starting the fetch operation.
    isLoading = true
    
    do {
      // Attempt to fetch data from the URL asynchronously.
      let (data, _) = try await URLSession.shared.data(from: url)
      
      // Decode the fetched data into an array of Todo objects.
      let todos = try JSONDecoder().decode([Todo].self, from: data)
      
      // Update the todos array with the fetched data.
      self.todos = todos
      
      // Set loading state to false after successfully fetching and decoding the data.
      isLoading = false
      
    } catch {
      // If an error occurs, set the errorMessage property with an appropriate message.
      self.errorMessage = "Failed to fetch data."
      
      // Set loading state to false if an error occurs.
      isLoading = false
      
      // Set showAlert to true to display an alert with the error message.
      self.showAlert = true
    }
  }
}

