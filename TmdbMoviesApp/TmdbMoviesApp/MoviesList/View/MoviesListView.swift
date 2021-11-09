//
//  MoviesListView.swift
//  TmdbMoviesApp
//
//  Created by crodrigueza on 9/11/21.
//

import UIKit

class MoviesListView: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    // MARK: - Variables/Constants
    private var router = MoviesListRouter()
    private var viewModel = MoviesListViewModel()

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.bind(view: self, router: router)
    }
}

// MARK: - TableView functions
extension MoviesListView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        cell.backgroundColor = .red

        return cell
    }
}

