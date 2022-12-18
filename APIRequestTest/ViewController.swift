//
//  ViewController.swift
//  APIRequestTest
//
//  Created by Joyce Rosario Batista on 18/12/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let repository = MoviesRepository()
        
        Task {
            let movies = try? await repository.getMoviesList()
            print(movies)
            
            let details = try? await repository.getMovieDetails(550)
            print(details)
        }
        
        repository.getMoviesLis { response in
            switch response {
            case .success(let moviesList):
                print(moviesList)
            case .error(let error):
                print(error.description)
            }
        }
        
        repository.getMovieDetails(550) { response in
            switch response {
            case .success(let details):
                print(details)
            case .error(let error):
                print(error.description)
            }
        }
    }


}

