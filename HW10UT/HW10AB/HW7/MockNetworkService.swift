import Foundation

// Define a mock network service for testing purposes
class MockNetworkService: NetworkService {
    // Properties to control the mock behavior
    var mockTodos: [Todo] = []              // List of mock todo items to return
    var shouldReturnError = false           // Flag to indicate if an error should be returned
    var shouldSimulateTimeout = false       // Flag to indicate if a timeout should be simulated
    
    // Implement the fetchTodos method as required by the NetworkService protocol
    func fetchTodos() async throws -> [Todo] {
        if shouldSimulateTimeout {
            // If timeout simulation is enabled, delay the response by 3 seconds
            try await Task.sleep(nanoseconds: 3 * 1_000_000_000) // 3 seconds delay
        }
        
        if shouldReturnError {
            // If error simulation is enabled, throw a test error
            throw NSError(domain: "TestError", code: 0, userInfo: nil)
        }
        
        // Return the mock todos
        return mockTodos
    }
}



