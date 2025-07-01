// Import the SwiftUI framework for building the user interface
import SwiftUI

// Define the main view of the app
struct ContentView: View {
    // Create an observable object instance of PhotoStore to manage the state
    @StateObject private var store = PhotoStore()
    
    // Define a state variable to hold the search query
    @State private var query = ""
    
    // Define a state variable to hold the selected photo (if any)
    @State private var selectedPhoto: Photo?

    // Define the layout for the grid of photos
    private let gridItems = [GridItem(.adaptive(minimum: 100))]

    // Define the body of the view
    var body: some View {
        // Create a navigation stack to manage navigation within the app
        NavigationStack {
            // Use a vertical stack to arrange the elements vertically
            VStack {
                // Use a horizontal stack for the search bar and button
                HStack {
                    // Create a text field for entering the search query
                    TextField("Search photos", text: $query, onCommit: {
                        // Trigger the searchPhotos function when the return key is pressed
                        store.searchPhotos(query: query)
                    })
                    // Apply a rounded border style to the text field
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    // Add padding around the text field
                    .padding()

                    // Create a search button
                    Button("Search") {
                        // Trigger the searchPhotos function when the button is pressed
                        store.searchPhotos(query: query)
                    }
                    // Add padding around the button
                    .padding()
                }

                // Check if the photos array in the store is empty
                if store.photos.isEmpty {
                    // Display a view indicating that there are no photos to display
                    ContentUnavailableView {
                        Text("No photos to display")
                    }
                } else {
                    // Create a scroll view to hold the grid of photos
                    ScrollView {
                        // Create a lazy grid to display the photos
                        LazyVGrid(columns: gridItems, spacing: 10) {
                            // Loop through the photos in the store
                            ForEach(store.photos) { photo in
                                // Create a navigation link for each photo
                                NavigationLink(destination: PhotoDetailView(photo: photo)) {
                                    // Display each photo in a grid item
                                    PhotoGridItem(photo: photo)
                                }
                            }
                        }
                        // Add padding around the grid
                        .padding()
                    }
                }
            }
            // Set the navigation title for the view
            .navigationTitle("Pexels Photos")
        }
    }
}

// Define a view for displaying an individual photo in the grid
struct PhotoGridItem: View {
    // The photo to be displayed
    let photo: Photo

    // Define the body of the view
    var body: some View {
        // Use the CachedAsyncImage view to load and display the photo asynchronously
        CachedAsyncImage(url: photo.src.large) {
            // Display a progress view while the image is loading
            ProgressView()
        }
        // Set the aspect ratio to fit the content mode
        .aspectRatio(contentMode: .fit)
        // Clip the image to a rounded rectangle shape
        .clipShape(RoundedRectangle(cornerRadius: 10))
        // Set the height of the image frame
        .frame(height: 150)
    }
}

// Set up a preview for the ContentView
#Preview {
    ContentView()
}

