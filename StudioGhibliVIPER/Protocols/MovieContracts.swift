//
//  MovieContracts.swift
//  StudioGhibliVIPER
//
//  Created by Vania Radmila Alfitri on 20/09/19.
//  Copyright © 2019 Gojek. All rights reserved.
//

import Foundation
import UIKit

protocol IMovieView {
    func showMovie(movies: [Movie])
    
}

protocol IMoviePresenter {
    var movies: [Movie] { get }
    func startFetchingMovies()
    func showMovieController(navigationController: UINavigationController)
}

protocol IMovieInteractorDelegate: class {
    func movieInteractorDidSuccessToFetchMovies(movies: [Movie])
    func movieInteractorDidFailToFetchMovies()
}

protocol IMovieWireframe: class {
    func createMovieController() -> UIViewController
    func pushToMovieDetailScreen(navigationController: UINavigationController)
}

protocol IMovieInteractor {
    func fetchMovies()
}
