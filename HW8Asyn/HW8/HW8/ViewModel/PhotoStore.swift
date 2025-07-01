import Foundation // Import the Foundation framework for basic data handling and networking
import Combine // Import the Combine framework for handling asynchronous events
import UIKit // Import the UIKit framework for working with images

struct PhotoResponse: Codable {
  let photos: [Photo]
}
// Define the PhotoStore class, which conforms to the ObservableObject protocol
class PhotoStore: ObservableObject {
  // A published property to hold an array of photos, which will notify the view of changes
  @Published var photos: [Photo] = []
  // A private set to hold cancellable objects for Combine subscriptions
  private var cancellables: AnyCancellable?
  
  // A private constant to hold the API key, retrieved from PexelsAPI
  private let apiKey: String = PexelsAPI.apiKey
  
  // A method to search for photos based on a query string
  func searchPhotos(query: String) {
    // Create a URL with the query string, ensuring it is valid
    guard let url = URL(string: "https://api.pexels.com/v1/search?query=\(query)&per_page=30") else { return }
    // Create a URLRequest with the URL
    var request = URLRequest(url: url)
    // Set the API key in the request's HTTP header for authorization
    request.setValue(apiKey, forHTTPHeaderField: "Authorization")
    
    // Perform the data task using a Combine publisher
    cancellables = URLSession.shared.dataTaskPublisher(for: request)
    // Map the response data to the data property
      .map { $0.data }
    // Decode the data into a PhotoSearchResult using JSONDecoder
      .decode(type: PhotoResponse.self, decoder: JSONDecoder())
    // Ensure the following operations run on the main dispatch queue
      .receive(on: DispatchQueue.main)
    // Handle the completion and receive events from the publisher
      .sink(receiveCompletion: { completion in
        switch completion {
        case .failure(let error):
          print("Error: \(error)")
        case .finished:
          break
        }
      }, receiveValue: { response in
        self.photos = response.photos
      })
    
  }
  
  // A method to fetch an image from a URL, returning a publisher that outputs an optional UIImage
  func fetchImage(url: String) -> AnyPublisher<UIImage?, Never> {
    // Ensure the URL string is valid
    guard let url = URL(string: url) else {
      // If not, return a publisher that immediately outputs nil
      return Just(nil).eraseToAnyPublisher()
    }
    
    // Perform the data task using a Combine publisher
    return URLSession.shared.dataTaskPublisher(for: url)
    // Map the response data to a UIImage
      .map { UIImage(data: $0.data) }
    // Replace any errors with nil
      .replaceError(with: nil)
    // Ensure the following operations run on the main dispatch queue
      .receive(on: DispatchQueue.main)
    // Erase the publisher's type to AnyPublisher to simplify usage
      .eraseToAnyPublisher()
  }
}


