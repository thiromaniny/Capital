//
//  swiftD6HWApp.swift
//  swiftD6HW
//
//  Created by sam on 7/10/24.
//

import SwiftUI
import SwiftData

@main
struct swiftD6HWApp: App {
  // Define a shared ModelContainer that will be used throughout the app
  var sharedModelContainer: ModelContainer = {
    
    
    // Create a ModelConfiguration with the schema, specifying that the data should be stored on disk
    let modelConfiguration = ModelConfiguration( isStoredInMemoryOnly: false)
    
    do {
      // Try to create and return a ModelContainer with the given schema and configuration
      return try ModelContainer(configurations: modelConfiguration)
    } catch {
      // If there's an error during the creation of the ModelContainer, terminate the app with a fatal error
      fatalError("Could not create ModelContainer: \(error)")
    }
  }()
  
  // The body property defines the content and behavior of the app's main scene
  var body: some Scene {
    // The main window group of the app
    WindowGroup {
      // The initial view of the app, in this case, `ContentView`
      ContentView()
    }
    // Attach the shared ModelContainer to the window group, making it available to the views
    .modelContainer(sharedModelContainer)
  }
  
}
