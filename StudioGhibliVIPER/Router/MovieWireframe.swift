//
//  MovieWireframe.swift
//  StudioGhibliVIPER
//
//  Created by Vania Radmila Alfitri on 21/09/19.
//  Copyright © 2019 Gojek. All rights reserved.
//

import Foundation
import UIKit

class MovieWireframe: IMovieWireframe {
    
    func createMovieController() -> UIViewController {
        let view = ViewController(style: .plain)
        let movieService = MovieService()
        let interactor = MovieInteractor(movieService: movieService)
        let presenter = MoviePresenter(
            view: view,
            interactor: interactor,
            router: self
        )
        
        view.presenter = presenter
        interactor.delegate = presenter

        return view
    }
    
    func pushToMovieDetailScreen(navigationController: UINavigationController) {
        
        
    }
}


