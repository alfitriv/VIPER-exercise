//
//  MovieInteractor.swift
//  StudioGhibliVIPER
//
//  Created by Vania Radmila Alfitri on 21/09/19.
//  Copyright © 2019 Gojek. All rights reserved.
//

import Foundation

class MovieInteractor: IMovieInteractor {
    var response: Movie?
    var movieService: IMovieService
    weak var delegate: IMovieInteractorDelegate?
    
    init(movieService: IMovieService) {
        self.movieService = movieService
    }
    
    func fetchMovies() {
        
        self.movieService.getMoviesList(successHandler: { [weak self] (movies) in
            
        self?.delegate?.movieInteractorDidSuccessToFetchMovies(movies: movies)
            
        }) { (error) in
            self.delegate?.movieInteractorDidFailToFetchMovies()
        }
    }
    
}
