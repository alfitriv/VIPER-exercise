//
//  ViewController.swift
//  StudioGhibliVIPER
//
//  Created by Vania Radmila Alfitri on 20/09/19.
//  Copyright © 2019 Gojek. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var presenter: IMoviePresenter?
    var movies: [Movie]?

//    func setData(movies: [Movie]) {
//        self.movies = movies
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.startFetchingMovies()
//        tableView.register(MovieTableViewCell.self, forCellReuseIdentifier: "MovieTableViewCell")
        
        
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.movies.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell", for: indexPath) as? MovieTableViewCell
        cell!.updateData(model: ((presenter?.movies[indexPath.row])!))
        return cell!
    }
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//        let movieData = movies[indexPath.row]
//
//        let movieDetailVC = MovieDetailViewController.init(nibName: "MovieDetailViewController", bundle: nil)
//
//        movieDetailVC.movieData = movieData
//        
//        navigationController?.pushViewController(movieDetailVC, animated: true)
//
//    }

}

extension ViewController: IMovieView {
    func showMovie(movies: [Movie]) {
        tableView.reloadData()
    }
    
    
    
    
}

