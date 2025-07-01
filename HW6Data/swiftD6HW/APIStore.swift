//
//  APIStore.swift
//  swiftD6HW
//  Created by sam on 7/10/24.
// Read the JSON from the App Bundle // Write the JSON to a new file in the user's document directory.
//The read operation should attempt to read from the app bundle first, and if the file is not present, try to read the file from the user’s document directory. If the file cannot be found in either location, show an error message to the user.


import Foundation

// Singleton class to manage reading and writing API response data in JSON format
final class APIStore {
  // Shared singleton instance of APIStore
  static let shared = APIStore()
  
  // Private initializer to prevent multiple instances
  private init() {}
  
  // The name of the JSON file
  let fileName = "apilist.json"
  
  // Function to read JSON data and return an APIResponse object
  func readJSON() -> APIResponse? {
    // Attempt to read the JSON file from the app bundle
    if let bundleURL = Bundle.main.url(forResource: "apilist", withExtension: "json"),
       let bundleData = try? Data(contentsOf: bundleURL) {
      // Decode the JSON data from the bundle
      return decodeJSON(data: bundleData)
    }
    
    // If the file is not found in the app bundle, try reading from the user's document directory
    let fileURL = getDocumentsDirectory().appendingPathComponent(fileName)
    if let fileData = try? Data(contentsOf: fileURL) {
      // Decode the JSON data from the document directory
      return decodeJSON(data: fileData)
    }
    
    // If the file is not found in either location, print an error message
    print("Error: JSON file not found.")
    return nil
  }
  
  // Function to write APIResponse data to a JSON file
  func writeJSON(apiResponse: APIResponse) {
    // Get the URL for the JSON file in the user's document directory
    let fileURL = getDocumentsDirectory().appendingPathComponent(fileName)
    do {
      // Encode the APIResponse object into JSON data
      let data = try JSONEncoder().encode(apiResponse)
      // Write the JSON data to the file
      try data.write(to: fileURL)
      //            print("Successfully saved to \(fileURL)")
    } catch {
      // Print an error message if writing the data fails
      print("Failed to write JSON data: \(error)")
    }
  }
  
  // Private helper function to decode JSON data into an APIResponse object
  private func decodeJSON(data: Data) -> APIResponse? {
    let decoder = JSONDecoder()
    // Attempt to decode the data and return the APIResponse object
    return try? decoder.decode(APIResponse.self, from: data)
  }
  
  // Private helper function to get the URL for the user's document directory
  private func getDocumentsDirectory() -> URL {
    // Return the first URL for the document directory in the user domain mask
    return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
  }
}

