//
//  Constants.swift
//  TmdbMoviesApp
//
//  Created by crodrigueza on 9/11/21.
//

import Foundation

struct Constants {
    static let version = 3
    static let apiKey = "5d8bb741e4498fd5448bc0738a12eb52"

    struct URL {
        static let base = "https://api.themoviedb.org/\(Constants.version)"
    }

    struct Endpoint {
        static let apiKey = "?api_key=\(Constants.apiKey)"
        static let searchMovies = "search/movie"
        static let getImages = "/movie/{movie_id}/images"
    }

    struct Optional {
        static let language = "&language="
        static let numberOfPages = 1
        static let page = "&page=\(numberOfPages)"
        static let isIncludedAdult = false
        static let adult = "&include_adult=\(isIncludedAdult)"
    }
}
