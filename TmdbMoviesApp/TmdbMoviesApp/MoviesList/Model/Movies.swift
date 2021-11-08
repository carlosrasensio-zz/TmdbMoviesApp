//
//  Movies.swift
//  TmdbMoviesApp
//
//  Created by crodrigueza on 9/11/21.
//

import Foundation

struct Movies {
    let movies: [Movies]

    enum CodingKeys: String, CodingKey {
        case movies = "results"
    }
}
