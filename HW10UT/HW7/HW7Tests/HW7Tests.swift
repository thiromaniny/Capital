//
//  HW7Tests.swift
//  HW7Tests
//
//  Created by sam on 8/7/24.
//
import XCTest
@testable import HW7

// Define a test case class for HW7
final class HW7Tests: XCTestCase {
  // Timeout duration for waiting for expectations in tests
  let timeout: TimeInterval = 2
  // Variable to hold the expectation for asynchronous operations
  var expectation: XCTestExpectation!
  
  // Setup code to initialize test environment before each test method runs
  override func setUpWithError() throws {
    expectation = expectation(description: "Server responds in reasonable time")
    // This method is called before each test method in the class is executed
  }

  // Teardown code to clean up after each test method runs
  override func tearDownWithError() throws {
    // This method is called after each test method in the class is executed
    try super.tearDownWithError()
  }

  // Test method to verify decoding of Todo items from a network response
  func test_decodeTodo() {
    // Define the URL to fetch todo items
    let url = URL(string: "https://jsonplaceholder.typicode.com/todos")!
    // Create a data task to fetch data from the URL
    URLSession.shared.dataTask(with: url) { data, response, error in
      // Ensure that the expectation is fulfilled once the response is received
      defer { self.expectation.fulfill() }

      // Check if there was no error in the response
      XCTAssertNil(error)

      do {
        // Verify that the response is an HTTPURLResponse with a status code of 200 (OK)
        let response = try XCTUnwrap(response as? HTTPURLResponse)
        XCTAssertEqual(response.statusCode, 200)

        // Ensure that the data is not nil and attempt to decode it into an array of Todo items
        let data = try XCTUnwrap(data)
        XCTAssertNoThrow(
          try JSONDecoder().decode([Todo].self, from: data)
        )
      } catch { }
    }
    .resume()

    // Wait for the expectation to be fulfilled or timeout after the specified duration
    waitForExpectations(timeout: timeout)
  }
}

