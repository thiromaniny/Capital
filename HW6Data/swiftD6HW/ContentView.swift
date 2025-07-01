//
//  ContentView.swift
//  swiftD6HW
//
//  Created by sam on 7/10/24.
//

import SwiftUI
import SwiftData

// Main view of the application
struct ContentView: View {
  // State variable to hold the API response data
  @State private var apiResponse: APIResponse?
  
  // State variable to hold the list of API entries
  @State private var entries: [APIEntry] = []
  
  // Body of the view
  var body: some View {
    // NavigationStack provides a container with navigation capabilities
    NavigationStack {
      // List displays a scrollable list of items
      List {
        // Check if there are entries to display
        if !entries.isEmpty {
          // Loop through each entry and create a navigation link for it
          ForEach(entries, id: \.self) { entry in
            // NavigationLink allows navigation to the detail view of each entry
            NavigationLink(destination: APIDetailView(entry: entry)) {
              // Display the API name
              Text(entry.API)
            }
          }
        } else {
          // Display a message if there are no entries
          Text("No data available")
        }
      }
      // Set the title of the navigation bar
      .navigationTitle("API List")
      // Load the API response data when the view appears
      .onAppear {
        // Load the JSON file from the app bundle
        if let bundleURL = Bundle.main.url(forResource: "apilist", withExtension: "json") {
          print(bundleURL)
        }
        // Read the JSON data and store it in the apiResponse variable
        apiResponse = APIStore.shared.readJSON()
        // Extract the entries from the apiResponse and store them in the entries variable | a valid array, either populated with API entries or empty, making it safe to use in the rest of the ContentView without additional nil checks.
        entries = apiResponse?.entries ?? []
      }
    }
  }
}

// Detail view for a specific API entry
struct APIDetailView: View {
  // The API entry to be displayed
  let entry: APIEntry
  
  // Body of the detail view
  var body: some View {
    // VStack arranges the content vertically
    VStack(alignment: .leading, spacing: 10) {
      // Display the description of the API
      Text("Description: \(entry.Description)")
      // Display the authentication type (or "None" if it's empty)
      Text("Auth: \(entry.Auth.isEmpty ? "None" : entry.Auth)")
      // Display whether HTTPS is supported
      Text("HTTPS: \(entry.HTTPS ? "Yes" : "No")")
      // Display the CORS support status
      Text("Cors: \(entry.Cors)")
      // Display the link to the API
      Text("Link: \(entry.Link)")
      // Display the category of the API
      Text("Category: \(entry.Category)")
    }
    // Add padding around the content
    .padding()
    // Set the title of the navigation bar to the API name
    .navigationTitle(entry.API)
  }
}

// Preview provider for the ContentView
#Preview {
  ContentView()
}
