//
//  GameListModel.swift
//  Appcent
//
//  Created by ArdaSisli on 23.03.2022.
//


import Foundation

// MARK: - GameResult
struct Result: Codable {
    let count: Int
    let results: [GameResult]
}

// MARK: - Result
struct GameResult: Codable {
    let id: Int
    let slug, name, released: String
    let tba: Bool
    let backgroundImage: String
    let rating: Double
    let ratingTop: Int
    let ratings: [Rating]
    let ratingsCount, reviewsTextCount, added: Int
    let addedByStatus: AddedByStatus
    let metacritic, playtime, suggestionsCount: Int
    let updated: String
    let userGame: JSONNull?
    let reviewsCount: Int
    let saturatedColor, dominantColor: Color
    let platforms: [PlatformElement]
    let parentPlatforms: [ParentPlatform]
    let genres: [Genre]
    let stores: [Store]
    let clip: JSONNull?
    let tags: [Genre]
    let esrbRating: EsrbRating
    let shortScreenshots: [ShortScreenshot]

    enum CodingKeys: String, CodingKey {
        case id, slug, name, released, tba
        case backgroundImage = "background_image"
        case rating
        case ratingTop = "rating_top"
        case ratings
        case ratingsCount = "ratings_count"
        case reviewsTextCount = "reviews_text_count"
        case added
        case addedByStatus = "added_by_status"
        case metacritic, playtime
        case suggestionsCount = "suggestions_count"
        case updated
        case userGame = "user_game"
        case reviewsCount = "reviews_count"
        case saturatedColor = "saturated_color"
        case dominantColor = "dominant_color"
        case platforms
        case parentPlatforms = "parent_platforms"
        case genres, stores, clip, tags
        case esrbRating = "esrb_rating"
        case shortScreenshots = "short_screenshots"
    }
}

// MARK: - AddedByStatus
struct AddedByStatus: Codable {
    let yet, owned, beaten, toplay: Int
    let dropped, playing: Int
}

enum Color: String, Codable {
    case the0F0F0F = "0f0f0f"
}

// MARK: - EsrbRating
struct EsrbRating: Codable {
    let id: Int
    let name, slug: String
}

// MARK: - Genre
struct Genre: Codable {
    let id: Int
    let name, slug: String
    let gamesCount: Int
    let imageBackground: String
    let domain: Domain?
    let language: Language?

    enum CodingKeys: String, CodingKey {
        case id, name, slug
        case gamesCount = "games_count"
        case imageBackground = "image_background"
        case domain, language
    }
}

enum Domain: String, Codable {
    case appsAppleCOM = "apps.apple.com"
    case epicgamesCOM = "epicgames.com"
    case gogCOM = "gog.com"
    case marketplaceXboxCOM = "marketplace.xbox.com"
    case microsoftCOM = "microsoft.com"
    case nintendoCOM = "nintendo.com"
    case playGoogleCOM = "play.google.com"
    case storePlaystationCOM = "store.playstation.com"
    case storeSteampoweredCOM = "store.steampowered.com"
}

enum Language: String, Codable {
    case eng = "eng"
}

// MARK: - ParentPlatform
struct ParentPlatform: Codable {
    let platform: EsrbRating
}

// MARK: - PlatformElement
struct PlatformElement: Codable {
    let platform: PlatformPlatform
    let releasedAt: String?
    let requirementsEn, requirementsRu: Requirements?

    enum CodingKeys: String, CodingKey {
        case platform
        case releasedAt = "released_at"
        case requirementsEn = "requirements_en"
        case requirementsRu = "requirements_ru"
    }
}

// MARK: - PlatformPlatform
struct PlatformPlatform: Codable {
    let id: Int
    let name, slug: String
    let image, yearEnd: JSONNull?
    let yearStart: Int?
    let gamesCount: Int
    let imageBackground: String

    enum CodingKeys: String, CodingKey {
        case id, name, slug, image
        case yearEnd = "year_end"
        case yearStart = "year_start"
        case gamesCount = "games_count"
        case imageBackground = "image_background"
    }
}

// MARK: - Requirements
struct Requirements: Codable {
    let minimum: String
    let recommended: String?
}

// MARK: - Rating
struct Rating: Codable {
    let id: Int
    let title: Title
    let count: Int
    let percent: Double
}

enum Title: String, Codable {
    case exceptional = "exceptional"
    case meh = "meh"
    case recommended = "recommended"
    case skip = "skip"
}

// MARK: - ShortScreenshot
struct ShortScreenshot: Codable {
    let id: Int
    let image: String
}

// MARK: - Store
struct Store: Codable {
    let id: Int
    let store: Genre
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}



//// MARK: - GameResult
//struct GameResult: Codable {
//    let id: Int
//    let slug, name, released: String
//    let tba: Bool
//    let backgroundImage: String
//    let rating: Double
//    let ratingTop: Int
//    let ratings: [Rating]
//    let ratingsCount, reviewsTextCount, added: Int
//    let addedByStatus: AddedByStatus
//    let metacritic, playtime, suggestionsCount: Int
//    let updated: String
//    let reviewsCount: Int
//    let saturatedColor, dominantColor: String
//    let platforms: [PlatformElement]
//    let parentPlatforms: [ParentPlatform]
//    let genres: [Genre]
//    let stores: [Store]
//    let tags: [Genre]
//    let esrbRating: EsrbRating
//    let shortScreenshots: [ShortScreenshot]
//
//    enum CodingKeys: String, CodingKey {
//        case id, slug, name, released, tba
//        case backgroundImage = "background_image"
//        case rating
//        case ratingTop = "rating_top"
//        case ratings
//        case ratingsCount = "ratings_count"
//        case reviewsTextCount = "reviews_text_count"
//        case added
//        case addedByStatus = "added_by_status"
//        case metacritic, playtime
//        case suggestionsCount = "suggestions_count"
//        case updated
//        case reviewsCount = "reviews_count"
//        case saturatedColor = "saturated_color"
//        case dominantColor = "dominant_color"
//        case platforms
//        case parentPlatforms = "parent_platforms"
//        case genres, stores, tags
//        case esrbRating = "esrb_rating"
//        case shortScreenshots = "short_screenshots"
//    }
//}
//
//// MARK: - AddedByStatus
//struct AddedByStatus: Codable {
//    let yet, owned, beaten, toplay: Int
//    let dropped, playing: Int
//}
//
//// MARK: - EsrbRating
//struct EsrbRating: Codable {
//    let id: Int
//    let name, slug: String
//}
//
//// MARK: - Genre
//struct Genre: Codable {
//    let id: Int
//    let name, slug: String
//    let gamesCount: Int
//    let imageBackground: String
//    let domain: String?
//    let language: Language?
//
//    enum CodingKeys: String, CodingKey {
//        case id, name, slug
//        case gamesCount = "games_count"
//        case imageBackground = "image_background"
//        case domain, language
//    }
//}
//
//enum Language: String, Codable {
//    case eng = "eng"
//}
//
//// MARK: - ParentPlatform
//struct ParentPlatform: Codable {
//    let platform: EsrbRating
//}
//
//// MARK: - PlatformElement
//struct PlatformElement: Codable {
//    let platform: PlatformPlatform
//    let releasedAt: String
//
//    enum CodingKeys: String, CodingKey {
//        case platform
//        case releasedAt = "released_at"
//    }
//}
//
//// MARK: - PlatformPlatform
//struct PlatformPlatform: Codable {
//    let id: Int
//    let name, slug: String
//    let yearStart: Int?
//    let gamesCount: Int
//    let imageBackground: String
//
//    enum CodingKeys: String, CodingKey {
//        case id, name, slug
//        case yearStart = "year_start"
//        case gamesCount = "games_count"
//        case imageBackground = "image_background"
//    }
//}
//
//// MARK: - Rating
//struct Rating: Codable {
//    let id: Int
//    let title: String
//    let count: Int
//    let percent: Double
//}
//
//// MARK: - ShortScreenshot
//struct ShortScreenshot: Codable {
//    let id: Int
//    let image: String
//}
//
//// MARK: - Store
//struct Store: Codable {
//    let id: Int
//    let store: Genre
//}
