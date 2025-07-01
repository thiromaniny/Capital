import Foundation // Import the Foundation framework to use Codable and other basic types

// MARK: - Welcome

/// A data model representing the structure of photo data.
/// Conforms to Codable to support encoding and decoding.
struct PhotoDataModel: Codable {
  // The total number of results available.
  let totalResults: Int
  // The current page number of results.
  let page: Int
  // The number of results per page.
  let perPage: Int
  // An array of `Photo` objects representing the photo items.
  let photos: [Photo]
  // The URL for the next page of results.
  let nextPage: String
  
  // MARK: Coding Keys
  
  /// Coding keys used to map the JSON keys to the properties of `PhotoDataModel`.
  enum CodingKeys: String, CodingKey {
    // Maps the JSON key "total_results" to the `totalResults` property.
    case totalResults = "total_results"
    // Maps the JSON key "page" to the `page` property.
    case page
    // Maps the JSON key "per_page" to the `perPage` property.
    case perPage = "per_page"
    // Maps the JSON key "photos" to the `photos` property.
    case photos
    // Maps the JSON key "next_page" to the `nextPage` property.
    case nextPage = "next_page"
  }
}

// MARK: - Photo

/// A data model representing the structure of a photo item.
/// Conforms to Codable for encoding and decoding, and Identifiable to be uniquely identifiable.
struct Photo: Codable, Identifiable {
  // Unique identifier for the photo.
  let id: Int
  // The width of the photo in pixels.
  let width: Int
  // The height of the photo in pixels.
  let height: Int
  // The URL of the photo.
  let url: String
  // The name of the photographer who took the photo.
  let photographer: String
  // The URL to the photographer's profile or website.
  let photographerURL: String
  // The unique identifier for the photographer.
  let photographerID: Int
  // The average color of the photo represented in hexadecimal format.
  let avgColor: String
  // The source object containing different sizes of the photo.
  let src: Src
  // Indicates whether the photo has been liked.
  let liked: Bool
  // The alt text description of the photo.
  let alt: String
  
  // MARK: Coding Keys
  
  /// Coding keys used to map the JSON keys to the properties of `Photo`.
  enum CodingKeys: String, CodingKey {
    // Maps the JSON key "id" to the `id` property.
    case id
    // Maps the JSON key "width" to the `width` property.
    case width
    // Maps the JSON key "height" to the `height` property.
    case height
    // Maps the JSON key "url" to the `url` property.
    case url
    // Maps the JSON key "photographer" to the `photographer` property.
    case photographer
    // Maps the JSON key "photographer_url" to the `photographerURL` property.
    case photographerURL = "photographer_url"
    // Maps the JSON key "photographer_id" to the `photographerID` property.
    case photographerID = "photographer_id"
    // Maps the JSON key "avg_color" to the `avgColor` property.
    case avgColor = "avg_color"
    // Maps the JSON key "src" to the `src` property.
    case src
    // Maps the JSON key "liked" to the `liked` property.
    case liked
    // Maps the JSON key "alt" to the `alt` property.
    case alt
  }
}

// MARK: - Src

/// A data model representing different sizes of the photo source.
/// Conforms to Codable to support encoding and decoding.
struct Src: Codable {
  // The URL for the original size of the photo.
  let original: String
  // The URL for the 2x large size of the photo.
  let large2X: String
  // The URL for the large size of the photo.
  let large: String
  // The URL for the medium size of the photo.
  let medium: String
  // The URL for the small size of the photo.
  let small: String
  // The URL for the portrait size of the photo.
  let portrait: String
  // The URL for the landscape size of the photo.
  let landscape: String
  // The URL for the tiny size of the photo.
  let tiny: String
  
  // MARK: Coding Keys
  
  /// Coding keys used to map the JSON keys to the properties of `Src`.
  enum CodingKeys: String, CodingKey {
    // Maps the JSON key "original" to the `original` property.
    case original
    // Maps the JSON key "large2x" to the `large2X` property.
    case large2X = "large2x"
    // Maps the JSON key "large" to the `large` property.
    case large
    // Maps the JSON key "medium" to the `medium` property.
    case medium
    // Maps the JSON key "small" to the `small` property.
    case small
    // Maps the JSON key "portrait" to the `portrait` property.
    case portrait
    // Maps the JSON key "landscape" to the `landscape` property.
    case landscape
    // Maps the JSON key "tiny" to the `tiny` property.
    case tiny
  }
}

