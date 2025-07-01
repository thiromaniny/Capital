import Foundation

// Define a protocol for network services
protocol NetworkService {
    func fetchTodos() async throws -> [Todo]
}

// Extend URLSession to conform to NetworkService protocol
extension URLSession: NetworkService {
    // Implement the fetchTodos method
    func fetchTodos() async throws -> [Todo] {
        // Define the URL for fetching todos
        let url = URL(string: "https://jsonplaceholder.typicode.com/todos")!
        // Perform an asynchronous network request
        let (data, _) = try await data(from: url)
        // Decode the fetched data into an array of Todo objects
        return try JSONDecoder().decode([Todo].self, from: data)
    }
}

// Mark the class to be used only on the main actor to ensure UI updates are on the main thread
@MainActor
class TodoViewModel: ObservableObject {
    // Published properties to update the UI
    @Published var todos: [Todo] = []
    @Published var showAlert: Bool = false
    @Published var errorMessage: String?
    @Published var isLoading = false
    
    // Network service to fetch data
    private let networkService: NetworkService
    
    // Initializer with a default value for networkService
    init(networkService: NetworkService = URLSession.shared) {
        self.networkService = networkService
    }
    
    // Asynchronous method to fetch todos
    func fetchTodos() async {
        // Set loading state to true
        isLoading = true
        do {
            // Fetch todos using the network service
            todos = try await networkService.fetchTodos()
            // Set loading state to false
            isLoading = false
        } catch {
            // Handle errors by setting error message and showing alert
            errorMessage = "Failed to fetch data."
            isLoading = false
            showAlert = true
        }
    }
}
