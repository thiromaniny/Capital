//
//  Todo.swift

import Foundation

// Define a structure to represent a Todo item
struct Todo: Identifiable, Codable {
    // The ID of the user who created the todo item
    let userId: Int
    
    // The unique ID of the todo item
    let id: Int
    
    // The title or description of the todo item
    let title: String
    
    // A boolean indicating whether the todo item is completed or not
    let completed: Bool
}




