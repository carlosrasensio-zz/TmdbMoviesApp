//
//  MovieDetailRouter.swift
//  TmdbMoviesApp
//
//  Created by crodrigueza on 11/11/21.
//

import Foundation
import UIKit

class MovieDetailRouter {
    // MARK: - Variables
    private var sourceView: UIViewController?
    var viewController: UIViewController {
        createMovieDetailViewController()
    }
    var movie: Movie?

    // MARK: - Initializer
    init(movie: Movie? = nil) {
        self.movie = movie
    }

    // MARK: - Configuration functions
    func createMovieDetailViewController() -> UIViewController {
        let view = MovieDetailView(nibName: "MovieDetailView", bundle: Bundle.main)
        view.movie = movie

        return view
    }

    func setSourceView(_  sourceView: UIViewController?) {
        guard let view = sourceView else { return }
        self.sourceView = view
    }
}
