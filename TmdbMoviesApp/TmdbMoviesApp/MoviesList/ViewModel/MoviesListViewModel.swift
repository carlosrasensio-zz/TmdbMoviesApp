//
//  MoviesListViewModel.swift
//  TmdbMoviesApp
//
//  Created by crodrigueza on 9/11/21.
//

import Foundation
import RxSwift

class MoviesListViewModel {
    // MARK: - Variables
    private weak var view: MoviesListView?
    private var router: MoviesListRouter?
    private var networkManager = NetworkManager()

    // MARK: - Connecting view and router
    func bind(view: MoviesListView, router: MoviesListRouter) {
        self.view = view
        self.router = router
        self.router?.setSourceView(view)
    }

    // MARK: - Get data from service
    func getMovies() -> Observable<[Movie]> {
        return networkManager.getMovies()
    }
}
