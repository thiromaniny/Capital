// Import the Foundation framework for basic functionalities like data handling and URLSession
import Foundation

// Import the Combine framework for handling asynchronous events
import Combine

// Import the UIKit framework for UI-related functionalities, particularly for UIImage
import UIKit

// Define a struct PhotoResponse that conforms to the Codable protocol
// This will be used to parse the JSON response from the Pexels API
struct PhotoResponse: Codable {
    // The response contains an array of Photo objects
    let photos: [Photo]
}

// Define a class PhotoStore that conforms to the ObservableObject protocol
// This class will manage the state and provide methods for fetching photos and images
class PhotoStore: ObservableObject {
    // A published property to hold an array of photos
    // When this value changes, any views observing it will be updated
    @Published var photos: [Photo] = []
    
    // A property to hold the Combine cancellable object
    private var cancellables: AnyCancellable?
    
    // The API key for accessing the Pexels API
    private let apiKey: String = PexelsAPI.apiKey
    
    // A cache to store downloaded images for quick access
    private let imageCache = NSCache<NSString, UIImage>()

    // Define a function to search for photos based on a query string
    func searchPhotos(query: String) {
        // Construct the URL for the search request
        guard let url = URL(string: "https://api.pexels.com/v1/search?query=\(query)&per_page=30") else { return }
        
        // Create a URLRequest and set the authorization header with the API key
        var request = URLRequest(url: url)
        request.setValue(apiKey, forHTTPHeaderField: "Authorization")

        // Perform the network request using URLSession's dataTaskPublisher
        cancellables = URLSession.shared.dataTaskPublisher(for: request)
            // Map the response data to PhotoResponse
            .map { $0.data }
            .decode(type: PhotoResponse.self, decoder: JSONDecoder())
            // Ensure the response is received on the main thread
            .receive(on: DispatchQueue.main)
            // Handle the completion and response
            .sink(receiveCompletion: { completion in
                switch completion {
                // Print an error message if the request fails
                case .failure(let error):
                    print("Error: \(error)")
                // Do nothing when the request finishes successfully
                case .finished:
                    break
                }
            }, receiveValue: { response in
                // Update the photos property with the response's photos
                self.photos = response.photos
            })
    }

    // Define a function to fetch an image from a URL
    func fetchImage(url: String) -> AnyPublisher<UIImage?, Never> {
        // Check if the image is already cached
        if let cachedImage = imageCache.object(forKey: url as NSString) {
            // Return the cached image as a Just publisher
            return Just(cachedImage).eraseToAnyPublisher()
        }

        // Construct the URL for the image request
        guard let url = URL(string: url) else {
            // Return nil if the URL is invalid
            return Just(nil).eraseToAnyPublisher()
        }

        // Perform the network request using URLSession's dataTaskPublisher
        return URLSession.shared.dataTaskPublisher(for: url)
            // Map the response data to a UIImage
            .map { UIImage(data: $0.data) }
            // Replace any errors with nil
            .replaceError(with: nil)
            // Handle events to cache the downloaded image
            .handleEvents(receiveOutput: { [weak self] image in
                if let image = image {
                    // Cache the image for future use
                    self?.imageCache.setObject(image, forKey: url.absoluteString as NSString)
                }
            })
            // Ensure the response is received on the main thread
            .receive(on: DispatchQueue.main)
            // Erase the publisher's type to AnyPublisher
            .eraseToAnyPublisher()
    }
}

