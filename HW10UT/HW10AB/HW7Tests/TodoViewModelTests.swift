import XCTest
@testable import HW7

// Define a test case class for testing asynchronous operations in HW7
final class AsynchronousTestCase: XCTestCase {
  // Timeout duration for waiting for asynchronous operations
  let timeout: TimeInterval = 2
  // Variables to hold instances of the view model and mock network service
  var viewModel: TodoViewModel!
  var mockNetworkService: MockNetworkService!
  
  // Setup code to initialize the test environment before each test method runs
  @MainActor override func setUpWithError() throws {
    // Create an instance of MockNetworkService
    mockNetworkService = MockNetworkService()
    // Create an instance of TodoViewModel with the mock network service
    viewModel = TodoViewModel(networkService: mockNetworkService)
  }
  
  // Teardown code to clean up after each test method runs
  override func tearDownWithError() throws {
    // Set view model and mock network service to nil
    viewModel = nil
    mockNetworkService = nil
  }
  
  // Test method to verify successful fetching of todos
  func testFetchTodosSuccess() async throws {
    // Arrange: Define expected todo items and set them in the mock network service
    let expectedTodos = [
      Todo(userId: 1, id: 1, title: "Test Todo 1", completed: false),
      Todo(userId: 1, id: 2, title: "Test Todo 2", completed: true)
    ]
    mockNetworkService.mockTodos = expectedTodos
    
    // Act: Fetch todos using the view model
    await viewModel.fetchTodos()
    
    // Assert: Verify the state of the view model after fetching todos
    await MainActor.run {
      XCTAssertEqual(viewModel.todos, expectedTodos, "The fetched todos should match the expected todos")
      XCTAssertFalse(viewModel.isLoading, "Loading state should be false after fetching todos")
      XCTAssertFalse(viewModel.showAlert, "No alert should be shown after successful fetch")
      XCTAssertNil(viewModel.errorMessage, "Error message should be nil after successful fetch")
    }
  }
  
  // Test method to verify behavior when fetching todos fails
  func testFetchTodosFailure() async throws {
    // Arrange: Set the mock network service to return an error
    mockNetworkService.shouldReturnError = true
    
    // Act: Attempt to fetch todos using the view model
    await viewModel.fetchTodos()
    
    // Assert: Verify the state of the view model after a fetch failure
    await MainActor.run {
      XCTAssertTrue(viewModel.showAlert, "An alert should be shown after a fetch failure")
      XCTAssertEqual(viewModel.errorMessage, "Failed to fetch data.", "Error message should be set after a fetch failure")
      XCTAssertFalse(viewModel.isLoading, "Loading state should be false after fetch failure")
      XCTAssertTrue(viewModel.todos.isEmpty, "Todos should be empty after a fetch failure")
    }
  }
  
  // Test method to verify behavior when the network returns an empty list of todos
  func testFetchTodosEmptyList() async throws {
    // Arrange: Set the mock network service to return an empty list of todos
    mockNetworkService.mockTodos = []
    
    // Act: Fetch todos using the view model
    await viewModel.fetchTodos()
    
    // Assert: Verify the state of the view model after receiving an empty list
    await MainActor.run {
      XCTAssertTrue(viewModel.todos.isEmpty, "Todos should be empty when the network returns an empty list")
      XCTAssertFalse(viewModel.isLoading, "Loading state should be false after fetching todos")
      XCTAssertFalse(viewModel.showAlert, "No alert should be shown for an empty list")
      XCTAssertNil(viewModel.errorMessage, "Error message should be nil after fetching an empty list")
    }
  }
  
  // Test method to verify behavior when there is a decoding error
  func testFetchTodosDecodingError() async throws {
    // Arrange: Set the mock network service to simulate a decoding error
    mockNetworkService.shouldReturnError = true
    
    // Act: Attempt to fetch todos using the view model
    await viewModel.fetchTodos()
    
    // Assert: Verify the state of the view model after a decoding failure
    await MainActor.run {
      XCTAssertTrue(viewModel.showAlert, "An alert should be shown after a decoding failure")
      XCTAssertEqual(viewModel.errorMessage, "Failed to fetch data.", "Error message should be set after a decoding failure")
      XCTAssertFalse(viewModel.isLoading, "Loading state should be false after a decoding failure")
      XCTAssertTrue(viewModel.todos.isEmpty, "Todos should be empty after a decoding failure")
    }
  }
}

