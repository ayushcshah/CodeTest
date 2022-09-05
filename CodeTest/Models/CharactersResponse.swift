//
//  CharactersResponse.swift
//  CodeTest
//
//  Created by Ayush Shah on 9/4/22.
//

import Foundation

// MARK: - CharactersResponse
struct CharactersResponse: Codable {
    let error: String
    let limit, offset, numberOfPageResults, numberOfTotalResults: Int
    let statusCode: Int
    let Characters: [Character]
    let version: String?

    enum CodingKeys: String, CodingKey {
        case error, limit, offset
        case numberOfPageResults = "number_of_page_results"
        case numberOfTotalResults = "number_of_total_results"
        case statusCode = "status_code"
        case Characters = "results"
        case version
    }
}

// MARK: - Character Result
struct Character: Codable {
    let aliases: String?
    let apiDetailURL: String
    let birthday: String?
    let dateAdded, dateLastUpdated: String
    let deck, resultDescription: String?
    let firstAppearedInGame: FirstAppearedInGame?
    let gender: Int
    let guid: String
    let id: Int
    let image: Image
    let imageTags: [ImageTag]
    let lastName: String?
    let name: String
    let realName: String?
    let siteDetailURL: String

    enum CodingKeys: String, CodingKey {
        case aliases
        case apiDetailURL = "api_detail_url"
        case birthday
        case dateAdded = "date_added"
        case dateLastUpdated = "date_last_updated"
        case deck
        case resultDescription = "description"
        case firstAppearedInGame = "first_appeared_in_game"
        case gender, guid, id, image
        case imageTags = "image_tags"
        case lastName = "last_name"
        case name
        case realName = "real_name"
        case siteDetailURL = "site_detail_url"
    }
}

// MARK: - FirstAppearedInGame
struct FirstAppearedInGame: Codable {
    let apiDetailURL: String
    let id: Int
    let name: String

    enum CodingKeys: String, CodingKey {
        case apiDetailURL = "api_detail_url"
        case id, name
    }
}

// MARK: - Image
struct Image: Codable {
    let iconURL, mediumURL, screenURL, screenLargeURL: String
    let smallURL, superURL, thumbURL, tinyURL: String
    let originalURL: String
    let imageTags: String

    enum CodingKeys: String, CodingKey {
        case iconURL = "icon_url"
        case mediumURL = "medium_url"
        case screenURL = "screen_url"
        case screenLargeURL = "screen_large_url"
        case smallURL = "small_url"
        case superURL = "super_url"
        case thumbURL = "thumb_url"
        case tinyURL = "tiny_url"
        case originalURL = "original_url"
        case imageTags = "image_tags"
    }
}

// MARK: - ImageTag
struct ImageTag: Codable {
    let apiDetailURL: String
    let name: String
    let total: Int

    enum CodingKeys: String, CodingKey {
        case apiDetailURL = "api_detail_url"
        case name, total
    }
}
