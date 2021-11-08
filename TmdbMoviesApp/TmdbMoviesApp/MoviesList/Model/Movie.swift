//
//  Movie.swift
//  TmdbMoviesApp
//
//  Created by crodrigueza on 9/11/21.
//

import Foundation

struct Movie: Codable {
    let image: String
    let title: String
    let description: String
    let voteAverage: Double

    enum CodingKeys: String, CodingKey {
        case image = "poster_path"
        case title
        case description = "overview"
        case voteAverage = "vote_average"
    }
}
