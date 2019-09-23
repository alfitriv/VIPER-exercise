//
//  MoviePresenter.swift
//  StudioGhibliVIPER
//
//  Created by Vania Radmila Alfitri on 21/09/19.
//  Copyright © 2019 Gojek. All rights reserved.
//

import Foundation
import UIKit

class MoviePresenter: IMoviePresenter {
    
    var view: IMovieView?
    var interactor: IMovieInteractor
    var router: IMovieWireframe
    var movies: [Movie] = []
    
    init(view: IMovieView?, interactor: IMovieInteractor, router: IMovieWireframe) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func startFetchingMovies() {
        interactor.fetchMovies()
    }
    
    func showMovieController(navigationController: UINavigationController) {
        router.pushToMovieDetailScreen(navigationController: navigationController)
    }
    
}

extension MoviePresenter: IMovieInteractorDelegate {
    func movieInteractorDidSuccessToFetchMovies(movies: [Movie]) {
//        var movies: [Movie] = []
        self.movies = movies
        view?.showMovie(movies: movies)
    }
    
    func movieInteractorDidFailToFetchMovies() {
        print("error")
    }
    
    
}
