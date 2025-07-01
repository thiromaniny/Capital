import Foundation

// Define a structure to represent a todo item
struct Todo: Identifiable, Codable, Equatable {
    // Properties of the todo item
    let userId: Int         // Identifier for the user who created the todo
    let id: Int             // Unique identifier for the todo item
    let title: String       // Title or description of the todo item
    let completed: Bool     // Status indicating if the todo item is completed or not
    
    // Conformance to Identifiable protocol
    // Allows the Todo item to be uniquely identified by its 'id' property

    // Conformance to Codable protocol
    // Allows encoding and decoding of the Todo item for data serialization (e.g., JSON)

    // Conformance to Equatable protocol
    // Allows comparison between Todo items to check if they are equal
    // The conformance is automatically provided by the compiler
}

