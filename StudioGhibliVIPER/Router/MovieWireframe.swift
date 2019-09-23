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
    
    class func createMovieController() -> UIViewController {
        let view = ViewController()
        let interactor = MovieInteractor()
        let presenter = MoviePresenter()
        let wireframe = MovieWireframe()
        let movieService = MovieService()
        
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = wireframe
        presenter.interactor = interactor
        //interactor.presenter = presenter
        interactor.movieService = movieService
        //self.controller = view
        return view
    }
    
    func pushToMovieDetailScreen(navigationController: UINavigationController) {
        
        
    }
    
}


