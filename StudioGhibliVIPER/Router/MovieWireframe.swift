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
    //weak var controller: ViewController?
    
    func createMovieController() -> UIViewController {
        let view = UIStoryboard(name:"Main",bundle: Bundle.main).instantiateViewController(withIdentifier: "ViewController") as? ViewController
        let movieService = MovieService()
        let interactor = MovieInteractor(movieService: movieService)
        let presenter = MoviePresenter(
            view: view,
            interactor: interactor,
            router: self
        )
        
        view?.presenter = presenter
        interactor.delegate = presenter
//        presenter.view = view
//        presenter.router = wireframe
//        presenter.interactor = interactor
        //interactor.presenter = presenter
//        interactor.movieService = movieService
        //self.controller = view
        return view!
    }
    
    func pushToMovieDetailScreen(navigationController: UINavigationController) {
        
        
    }
}


