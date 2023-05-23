//
//  PopularListResponse.swift
//  MoviesApp
//
//  Created by sneha.jarsania on 19/05/23.
//

import Foundation

/*
// MARK: - PopularListResponse
struct PopularListResponse: Codable {
    let page: Int?
    let results: [MoviesResult]?
    let totalPages, totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Result
struct MoviesResult: Codable {
    let adult: Bool?
    let gender: Int?
    let id: Int
    let knownFor: [KnownFor]?
    let knownForDepartment: KnownForDepartment?
    let name: String?
    let popularity: Double?
    let profilePath: String?

    enum CodingKeys: String, CodingKey {
        case adult, gender, id
        case knownFor = "known_for"
        case knownForDepartment = "known_for_department"
        case name, popularity
        case profilePath = "profile_path"
    }
}

// MARK: - KnownFor
struct KnownFor: Codable {
    let adult: Bool?
    let backdropPath: String?
    let genreIDS: [Int]?
    let id: Int?
    let mediaType: MediaType?
    let originalLanguage: OriginalLanguage?
    let originalTitle: String?
    let overview, posterPath: String?
    let releaseDate, title: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?
    let firstAirDate, name: String?
    let originCountry: [OriginCountry]?
    let originalName: String?

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case mediaType = "media_type"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case firstAirDate = "first_air_date"
        case name
        case originCountry = "origin_country"
        case originalName = "original_name"
    }
}

enum MediaType: String, Codable {
    case movie = "movie"
    case tv = "tv"
}

enum OriginCountry: String, Codable {
    case gb = "GB"
    case tr = "TR"
    case us = "US"
}

enum OriginalLanguage: String, Codable {
    case en = "en"
    case it = "it"
    case ko = "ko"
    case ta = "ta"
    case tl = "tl"
    case tr = "tr"
}

enum KnownForDepartment: String, Codable {
    case acting = "Acting"
    case directing = "Directing"
    case production = "Production"
}
*/

// MARK: - PopularListResponse
struct PopularListResponse: Codable {
    let page: Int
    let results: [MoviesResult]?
    let totalPages, totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Result
struct MoviesResult: Codable {
    let adult: Bool?
    let backdropPath: String?
    let genreIDS: [Int]?
    let id: Int
    let originalLanguage, originalTitle, overview: String?
    let popularity: Double
    let posterPath, releaseDate, title: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}
