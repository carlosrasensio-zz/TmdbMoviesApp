//
//  MovieDetailView.swift
//  TmdbMoviesApp
//
//  Created by crodrigueza on 11/11/21.
//

import UIKit

class MovieDetailView: UIViewController {
    // MARK: - Outlets
    @IBOutlet private weak var movieImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var voteAverageLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!

    // MARK: - Variables
    private var router = MovieDetailRouter()
    private var viewModel = MovieDetailViewModel()
    var movie: Movie?

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        configureNavigationItem()
        configureMovieDetail()
        viewModel.bind(view: self, router: router)
    }

    // MARK: - NavigationItem configuration
    private func configureNavigationItem() {
        navigationController?.navigationBar.tintColor = .systemPink
    }

    // MARK: View configuration
    func configureMovieDetail() {
        guard let movie = movie else { return }
        let imageUrl = Constants.NetworkManager.URLs.image + movie.image
        self.movieImageView.getImageFromURL(urlString: imageUrl)
        self.titleLabel.text = movie.title
        self.voteAverageLabel.text = "Vote average: \(movie.voteAverage)"
        self.descriptionLabel.text = movie.description
    }
}
