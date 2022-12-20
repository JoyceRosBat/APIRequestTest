//
//  MainInteractor.swift
//  APIRequestTest
//
//  Created by Joyce Rosario Batista on 20/12/22.
//

import Foundation

final class MainInteractor: MainInteractorProtocol {
    let repository: MoviesRepositoryProtocol
    
    init(repository: MoviesRepositoryProtocol) {
        self.repository = repository
    }
    
    func getMovies() async throws -> [Item] {
        let movieList = try await repository.getMoviesList()
        return movieList.items
    }
}
