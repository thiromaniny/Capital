// Import necessary frameworks
import SwiftUI
import Combine

// Define the PhotoDetailView struct which conforms to the View protocol
struct PhotoDetailView: View {
    // The photo object passed to the view
    let photo: Photo
    
    // State variable to hold the image loaded from the URL
    @State private var image: UIImage?
    
    // State variable to manage any cancellable subscriptions
    @State private var cancellable: AnyCancellable?

    // Define the body of the view
    var body: some View {
        // Use a vertical stack to arrange elements vertically
        VStack {
            // Create a CachedAsyncImage view to load and display the image asynchronously
            CachedAsyncImage(url: photo.src.large) {
                // Display a progress view while the image is loading
                ProgressView()
            }
            // Set the aspect ratio of the image to fit the available space
            .aspectRatio(contentMode: .fit)
            // Allow the image to expand to fill the available width and height
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            // Ensure the image does not overflow its container
            .clipped()

            // Display the alternate text for the photo
            Text(photo.alt)
            
            // Display the photographer's name with padding around it
            Text("Created By - \(photo.photographer)")
                .padding()
        }
        // Add padding around the vertical stack
        .padding()
    }
}

