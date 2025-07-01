//
//  APIEntry.swift
//  swiftD6HW
//
//  Created by sam on 7/10/24.
//

import Foundation

// Struct representing an individual API entry
struct APIEntry: Codable, Hashable {
  // The name of the API
  let API: String
  // A brief description of the API
  let Description: String
  // The type of authentication required (if any)
  let Auth: String
  // Indicates whether the API supports HTTPS (true or false)
  let HTTPS: Bool
  // Indicates whether the API supports CORS (Cross-Origin Resource Sharing)
  let Cors: String
  // The URL link to the API
  let Link: String
  // The category to which the API belongs
  let Category: String
}

// Struct representing the API response which includes a count and a list of API entries
struct APIResponse: Codable {
  // The total number of API entries
  var count: Int
  // An array of APIEntry objects representing the individual API entries
  var entries: [APIEntry]
}

