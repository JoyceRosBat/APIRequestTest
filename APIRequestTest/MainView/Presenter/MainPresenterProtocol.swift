//
//  MainPresenterProtocol.swift
//  APIRequestTest
//
//  Created by Joyce Rosario Batista on 20/12/22.
//

import Foundation

protocol MainPresenterProtocol {
    var view: MainPresenterDelegate? { get set }
    func viewDidLoad()
}

protocol MainPresenterDelegate {
    func moviesLoaded(_ movies: [MovieView.Model])
}
