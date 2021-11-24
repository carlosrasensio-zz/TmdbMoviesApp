//
//  MoviesListView.swift
//  TmdbMoviesApp
//
//  Created by crodrigueza on 9/11/21.
//

import UIKit
import RxSwift
import RxCocoa

class MoviesListView: UIViewController {
    // MARK: - Outlets
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    
    // MARK: - Variables
    private var router = MoviesListRouter()
    private var viewModel = MoviesListViewModel()
    private var disposeBag = DisposeBag()
    private var movies = [Movie]()
    private var filteredMovies = [Movie]()

    lazy var searchController: UISearchController = ({
        let controller = UISearchController(searchResultsController: nil)
        controller.hidesNavigationBarDuringPresentation = true
        controller.obscuresBackgroundDuringPresentation = false
        controller.searchBar.sizeToFit()
        controller.searchBar.barStyle = .default
        controller.searchBar.backgroundColor = .systemPink
        controller.searchBar.placeholder = "Search your movie!"
        let cancelButtonAttributes = [NSAttributedString.Key.foregroundColor: UIColor.systemPink]
         UIBarButtonItem.appearance().setTitleTextAttributes(cancelButtonAttributes, for: .normal)

        return controller
    })()

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        configureNavigationItem()
        configureSearchBarController()
        configureTableView()
        viewModel.bind(view: self, router: router)
        getMovies()
    }

    // MARK: - NavigationItem configuration
    private func configureNavigationItem() {
        self.navigationItem.title = Constants.appName
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.systemPink]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
    }

    // MARK: - SearchBarController configuration
    private func configureSearchBarController() {
        let searchBar = searchController.searchBar
        searchController.delegate = self
        tableView.tableHeaderView = searchBar
        tableView.contentOffset = CGPoint(x: 0, y: searchBar.frame.size.height)
        // Reactive filter
        searchBar.rx.text
            .orEmpty
            .distinctUntilChanged()
            .subscribe { result in
                self.filteredMovies = self.movies.filter({ movie in
                    self.reloadTableView()
                    return movie.title.contains(result)
                })
            } onError: { error in
                print("\n[X] Error: \(error.localizedDescription)\n")
            }
            .disposed(by: disposeBag)
    }

    // MARK: - TableView configuration
    private func configureTableView() {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(UINib(nibName: Constants.CustomCells.movieCellId, bundle: nil), forCellReuseIdentifier: Constants.CustomCells.movieCellId)
        tableView.separatorColor = .systemPink
    }

    private func reloadTableView() {
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
            self.activityIndicator.isHidden = true
            self.tableView.reloadData()
        }
    }
}

// MARK: - Get data from ViewModel with RxSwift
private extension MoviesListView {
    func getMovies() {
        self.activityIndicator.startAnimating()
        return viewModel.getMovies()
            .subscribe(on: MainScheduler.instance)
            .observe(on: MainScheduler.instance)
            .subscribe { movies in
                self.movies = movies
                self.reloadTableView()
            } onError: { error in
                print("\n[X] Error: \(error.localizedDescription)\n")
            } onCompleted: {
            }
            .disposed(by: disposeBag)
    }
}

// MARK: - TableView functions
extension MoviesListView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.isActive && searchController.searchBar.text != "" {
            return filteredMovies.count
        } else {
            return movies.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.CustomCells.movieCellId) as! MovieCustomCell
        if searchController.isActive && searchController.searchBar.text != "" {
            cell.titleLabel.text = filteredMovies[indexPath.row].title
            cell.descriptionLabel.text = filteredMovies[indexPath.row].description
            cell.voteAverageLabel.text = "Vote average: \(filteredMovies[indexPath.row].voteAverage)"
            let imageUrl = Constants.NetworkManager.URLs.image + filteredMovies[indexPath.row].image
            cell.movieImageView.getImageFromURL(urlString: imageUrl)
        } else {
            cell.titleLabel.text = movies[indexPath.row].title
            cell.descriptionLabel.text = movies[indexPath.row].description
            cell.voteAverageLabel.text = "Vote average: \(movies[indexPath.row].voteAverage)"
            let imageUrl = Constants.NetworkManager.URLs.image + movies[indexPath.row].image
            cell.movieImageView.getImageFromURL(urlString: imageUrl)
        }

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}

extension MoviesListView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if searchController.isActive && searchController.searchBar.text != "" {
            viewModel.createMovieDetailView(movie: filteredMovies[indexPath.row])
        } else {
            viewModel.createMovieDetailView(movie: movies[indexPath.row])
        }
    }
}

// MARK: - SearchController functions
extension MoviesListView: UISearchControllerDelegate {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchController.isActive = false
        reloadTableView()
    }
}

