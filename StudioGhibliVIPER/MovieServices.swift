//
//  MovieServices.swift
//  StudioGhibliVIPER
//
//  Created by Vania Radmila Alfitri on 21/09/19.
//  Copyright © 2019 Gojek. All rights reserved.
//

import Foundation

protocol IMovieService {
    func getMoviesList(successHandler: @escaping ([Movie]) -> Void, errorHandler: @escaping (Error) -> Void)
}

class MovieService: IMovieService {
    static var shared = MovieService()
    public init(){}
    static var jsonDecoder: JSONDecoder = {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        return jsonDecoder
    }()
    
    func getMoviesList(successHandler: @escaping ([Movie]) -> Void, errorHandler: @escaping (Error) -> Void) {
        let session = URLSession.shared
        
        let urlRequest = URLRequest(url: URL(string: "https://ghibliapi.herokuapp.com/films")!)
        
        session.dataTask(with: urlRequest) { (data, response, error) in
            guard error == nil else {
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode >= 200 && httpResponse.statusCode < 300 else {
                return
            }
            
            guard let data = data else {
                DispatchQueue.main.async {
                    errorHandler(NSError(domain: "", code: 0, userInfo: nil))
                }
                return
            }
            
            print(data)
            
            do {
                let movies = try MovieService.jsonDecoder.decode([Movie].self, from: data)
                print(movies)
                
                DispatchQueue.main.async {
                    successHandler(movies)
                }
            } catch {
                
            }
            }.resume()
    }
}

