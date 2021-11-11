//
//  MovieDetailViewModel.swift
//  TmdbMoviesApp
//
//  Created by crodrigueza on 11/11/21.
//

import Foundation
import RxSwift

class MovieDetailViewModel {
    // MARK: - Variables
    private var view: MovieDetailView?
    private var router: MovieDetailRouter?

    // MARK: - Connecting view and router
    func bind(view: MovieDetailView, router: MovieDetailRouter) {
        self.view = view
        self.router = router
        self.router?.setSourceView(view)
    }
}
