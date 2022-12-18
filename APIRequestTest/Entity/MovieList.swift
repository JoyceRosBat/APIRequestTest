//
//  MovieList.swift
//  APIRequestTest
//
//  Created by Joyce Rosario Batista on 18/12/22.
//

import Foundation

// MARK: - MovieList
struct MovieList: Codable {
    let createdBy, movieListDescription: String
    let favoriteCount: Int
    let id: String
    let items: [Item]
    let itemCount: Int
    let iso639_1, name, posterPath: String

    enum CodingKeys: String, CodingKey {
        case createdBy = "created_by"
        case movieListDescription = "description"
        case favoriteCount = "favorite_count"
        case id, items
        case itemCount = "item_count"
        case iso639_1 = "iso_639_1"
        case name
        case posterPath = "poster_path"
    }
}

// MARK: - Item
struct Item: Codable {
    let posterPath: String
    let adult: Bool
    let overview, releaseDate, originalTitle: String
    let genreIDS: [Int]
    let id: Int
    let mediaType, originalLanguage, title: String
    let popularity: Double
    let voteCount: Int
    let video: Bool
    let voteAverage: Double

    enum CodingKeys: String, CodingKey {
        case posterPath = "poster_path"
        case adult, overview
        case releaseDate = "release_date"
        case originalTitle = "original_title"
        case genreIDS = "genre_ids"
        case id
        case mediaType = "media_type"
        case originalLanguage = "original_language"
        case title
        case popularity
        case voteCount = "vote_count"
        case video
        case voteAverage = "vote_average"
    }
}
