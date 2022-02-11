//
//  Movies.swift
//  TmdbMoviesApp
//
//  Created by crodrigueza on 9/11/21.
//

import Foundation

struct Movies: Codable, Equatable {
    let movies: [Movie]

    enum CodingKeys: String, CodingKey {
        case movies = "results"
    }

    static func == (lhs: Movies, rhs: Movies) -> Bool {
        return lhs.movies == rhs.movies
    }

}
