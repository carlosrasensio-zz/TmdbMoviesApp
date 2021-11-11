//
//  MoviesListRouter.swift
//  TmdbMoviesApp
//
//  Created by crodrigueza on 9/11/21.
//

import Foundation
import UIKit

class MoviesListRouter {
    // MARK: - Variables
    private var sourceView: UIViewController?
    var viewController: UIViewController {
        createMoviesListViewController()
    }

    // MARK: - Configuration functions
    func createMoviesListViewController() -> UIViewController {
        let view = MoviesListView(nibName: "MoviesListView", bundle: Bundle.main)

        return view
    }

    func setSourceView(_  sourceView: UIViewController?) {
        guard let view = sourceView else { return }
        self.sourceView = view
    }

    func navigateToMovieDetail(movie: Movie) {
        let movieDetailView = MovieDetailRouter(movie: movie).viewController
        sourceView?.navigationController?.pushViewController(movieDetailView, animated: true)
    }
}
