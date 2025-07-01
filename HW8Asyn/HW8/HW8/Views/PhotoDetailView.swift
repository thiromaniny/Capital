import SwiftUI // Import the SwiftUI framework for building the user interface
import Combine // Import the Combine framework for handling asynchronous events

// Define the PhotoDetailView structure, which conforms to the View protocol
struct PhotoDetailView: View {
  // A property to hold the photo data, passed when the view is created
  let photo: Photo
  // A state variable to hold the downloaded image, initially nil
  @State private var image: UIImage?
  // A state variable to hold the cancellable object for the Combine subscription, initially nil
  @State private var cancellable: AnyCancellable?
  
  // Define the body of the PhotoDetailView, which describes the view's layout and behavior
  var body: some View {
    // Arrange the contents vertically
    VStack {
      AsyncImage(url: URL(string: photo.src.large)) { image in
        image
          .resizable()
          .scaledToFill()
      } placeholder: {
        ProgressView()
      }
      Text(photo.alt)
      Text("Created By - \(photo.photographer)")
        .padding()
    }
    
  }
  
  // Define a private function to fetch the image
  private func fetchImage() {
    // Call the fetchImage method from PhotoStore and assign the cancellable object
    cancellable = PhotoStore().fetchImage(url: photo.src.large2X)
    // Handle the completion and receive events from the publisher
      .sink(receiveCompletion: { _ in }, receiveValue: { image in
        // Update the image state variable with the downloaded image
        self.image = image
      })
  }
}


