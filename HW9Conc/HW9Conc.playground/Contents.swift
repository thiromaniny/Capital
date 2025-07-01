import Foundation // Importing the Foundation framework to access basic classes and functions.
import PlaygroundSupport // Importing PlaygroundSupport to use features specific to Playgrounds.

PlaygroundPage.current.needsIndefiniteExecution = true // Allows the Playground to run indefinitely to complete asynchronous tasks.

// Struct for decoding the JSON response from the cat fact API.
struct CatFact: Codable {
    let fact: String // Declaring a property 'fact' of type String to hold the cat fact text.
}

// Struct for the AsyncSequence.
struct CatFactSequence: AsyncSequence {
    typealias Element = CatFact // Defining the type of elements produced by this sequence as 'CatFact'.
    
    // Struct for the Iterator.
    struct CatFactIterator: AsyncIteratorProtocol {
        var currentCount: Int // Variable to keep track of the number of facts retrieved so far.
        let maxCount: Int // Constant to store the maximum number of facts to be retrieved.
        
        // The next() method to produce the next element or nil if the end is reached.
        mutating func next() async throws -> CatFact? {
            guard currentCount < maxCount else { return nil } // Check if the current count is less than the maximum count; if not, return nil to end the iteration.
            currentCount += 1 // Increment the current count by 1.
            let url = URL(string: "https://catfact.ninja/fact")! // Create a URL object for the cat fact API endpoint.
            
            do {
                let (data, response) = try await URLSession.shared.data(from: url) // Fetch data from the URL asynchronously.
                if let httpResponse = response as? HTTPURLResponse { // Cast the response to HTTPURLResponse to access the status code.
                    switch httpResponse.statusCode { // Check the status code of the response.
                    case 200:
                        print("Request \(currentCount) succeeded with status code 200") // Print success message for status code 200.
                    case 403:
                        print("Request \(currentCount) failed with status code 403 (Forbidden)") // Print error message for status code 403.
                        return nil
                    case 500:
                        print("Request \(currentCount) failed with status code 500 (Server Error)") // Print error message for status code 500.
                        return nil
                    default:
                        print("Request \(currentCount) failed with status code \(httpResponse.statusCode)") // Print error message for other status codes.
                        return nil
                    }
                }
                let catFact = try JSONDecoder().decode(CatFact.self, from: data) // Decode the fetched JSON data into a 'CatFact' object.
                return catFact // Return the decoded 'CatFact' object.
            } catch {
                print("Request \(currentCount) encountered an error: \(error.localizedDescription)") // Print error message if an exception occurs.
                return nil
            }
        }
    }
    
    let count: Int // Declaring a constant 'count' to store the number of cat facts to be retrieved.
    
    // The method to create and return an instance of the iterator.
    func makeAsyncIterator() -> CatFactIterator {
        return CatFactIterator(currentCount: 0, maxCount: count) // Initialize a 'CatFactIterator' with 'currentCount' set to 0 and 'maxCount' set to the specified count.
    }
}

// Function that uses the iterator to get Cat Facts.
func getCatFacts(count: Int) async {
    let sequence = CatFactSequence(count: count) // Create an instance of 'CatFactSequence' with the specified count.
    var iterator = sequence.makeAsyncIterator() // Create an iterator from the 'CatFactSequence'.
    
    // Loop to fetch and print cat facts as long as 'next()' returns a 'CatFact'.
    while let fact = try? await iterator.next() {
        print(fact.fact) // Print the 'fact' property of the 'CatFact' object.
    }
}

// Example usage: Get 5 cat facts.
Task {
    await getCatFacts(count: 5) // Call the 'getCatFacts' function to fetch and print 5 cat facts.
}
