import SwiftUI // Import the SwiftUI framework to use its views and layout components

// MARK: - ContentView

/// The main view displaying a search interface and a grid of photos.
/// Conforms to `View` to be used in a SwiftUI interface.
struct ContentView: View {
  // StateObject to manage and observe the photo store.
  @StateObject private var store = PhotoStore()
  // State to hold the search query entered by the user.
  @State private var query = ""
  // State to hold the selected photo for detail view.
  @State private var selectedPhoto: Photo?
  
  // A grid item layout for displaying photos in a responsive grid.
  private let gridItems = [GridItem(.adaptive(minimum: 100))] // Adjust the minimum width as needed
  
  /// The body of the view, defining its layout and content.
  var body: some View {
    NavigationStack {
      // Vertical stack to arrange elements in a column.
      VStack {
        // Horizontal stack to arrange search and button horizontally.
        HStack {
          // TextField for entering search queries.
          TextField("Search photos", text: $query, onCommit: {
            // Trigger search when the user submits the query.
            store.searchPhotos(query: query)
          })
          .textFieldStyle(RoundedBorderTextFieldStyle()) // Apply rounded border style to the text field.
          .padding() // Add padding around the text field.
          
          // Button to initiate the search manually.
          Button("Search") {
            // Trigger search when the button is tapped.
            store.searchPhotos(query: query)
          }
          .padding() // Add padding around the button.
        }
        
        // Conditionally display content based on whether photos are available.
        if store.photos.isEmpty {
          
          // Show a view indicating no photos are available.
          ContentUnavailableView {
            Text("No photos to display")
            
          }
          
        } else {
          // Display a scrollable grid of photos.
          ScrollView {
            // LazyVGrid for a responsive grid layout.
            LazyVGrid(columns: gridItems, spacing: 10) {
              // Iterate over the photos and create grid items.
              ForEach(store.photos) { photo in
                // Navigation link to show detailed view of the photo.
                NavigationLink(destination: PhotoDetailView(photo: photo)) {
                  // Custom view for displaying photo grid item.
                  PhotoGridItem(photo: photo)
                }
              }
            }
            .padding() // Add padding around the grid.
          }
        }
      }
      .navigationTitle("Pexels Photos") // Set the navigation bar title.
      
    }
  }
}

// MARK: - PhotoGridItem

/// A view representing a single photo item in the grid.
/// Conforms to `View` to be used in a SwiftUI interface.
struct PhotoGridItem: View {
  // The photo to be displayed in the grid item.
  let photo: Photo
  
  /// The body of the view, defining its layout and content.
  var body: some View {
    // Asynchronously load and display the image from the URL.
    AsyncImage(url: URL(string: photo.src.large)) { image in
      image
        .resizable() // Make the image resizable.
        .aspectRatio(contentMode: .fit) // Maintain aspect ratio while fitting the image.
        .clipShape(RoundedRectangle(cornerRadius: 10)) // Clip the image to a rounded rectangle shape.
        .frame(height: 100) // Set the height of the image frame.
    } placeholder: {
      // Show a progress view while the image is loading.
      ProgressView()
    }
    .frame(height: 150) // Set the height of the photo grid item.
  }
}

// MARK: - Preview

/// Preview for SwiftUI Canvas to visualize `ContentView`.
#Preview {
  ContentView() // Show the `ContentView` in the preview.
}

