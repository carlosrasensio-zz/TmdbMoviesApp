//
//  Constants.swift
//  TmdbMoviesApp
//
//  Created by crodrigueza on 9/11/21.
//

import Foundation

struct Constants {
    struct NetworkManager {
        static let version = 3
        static let apiKey = "5d8bb741e4498fd5448bc0738a12eb52"

        struct URLs {
            static let base = "https://api.themoviedb.org/\(Constants.NetworkManager.version)/"
            static let image = "hhtps://image.tmdb.org/t/p/w200"
        }

        struct Endpoints {
            static let apiKey = "?api_key=\(Constants.NetworkManager.apiKey)"
            static let popularMovies = "movie/popular"
        }

        struct Optionals {
            static let language = "&language="
            static let numberOfPages = 1
            static let page = "&page=\(numberOfPages)"
            static let isIncludedAdult = false
            static let adult = "&include_adult=\(isIncludedAdult)"
        }
    }

    struct CustomCells {
        static let movieCellId = "MovieCustomCell"
    }

}
