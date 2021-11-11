//
//  MoviesListView.swift
//  TmdbMoviesApp
//
//  Created by crodrigueza on 9/11/21.
//

import UIKit
import RxSwift

class MoviesListView: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    // MARK: - Variables/Constants
    private var router = MoviesListRouter()
    private var viewModel = MoviesListViewModel()
    private var disposeBag = DisposeBag()
    private var movies = [Movie]()

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.bind(view: self, router: router)
        configureTableView()
        getMovies()
    }

    // MARK: - Get data from ViewModel with RxSwift
    private func getMovies() {
        return viewModel.getMovies()
            .subscribe(on: MainScheduler.instance)
            .observe(on: MainScheduler.instance)
            .subscribe { movies in
                self.movies = movies
                self.reloadTableView()
            } onError: { error in
                print("\n[X] Error: \(error.localizedDescription)\n")
            } onCompleted: {
            }.disposed(by: disposeBag)
    }

    // MARK: - TableView configuration
    private func reloadTableView() {
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
            self.activityIndicator.isHidden = true
            self.tableView.reloadData()
        }
    }

    private func configureTableView() {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(UINib(nibName: Constants.CustomCells.movieCellId, bundle: nil), forCellReuseIdentifier: Constants.CustomCells.movieCellId)
    }
}

// MARK: - TableView functions
extension MoviesListView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.CustomCells.movieCellId) as! MovieCustomCell
        cell.titleLabel.text = movies[indexPath.row].title
        cell.descriptionLabel.text = movies[indexPath.row].description
        cell.voteAverageLabel.text = "Vote average: \(movies[indexPath.row].voteAverage)"

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}

