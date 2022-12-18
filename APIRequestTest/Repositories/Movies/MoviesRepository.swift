//
//  MoviesRepository.swift
//  APIRequestTest
//
//  Created by Joyce Rosario Batista on 18/12/22.
//

import Foundation

final class MoviesRepository: MoviesRepositoryProtocol {
    let networkRequester = Requester()
    
    func getMoviesList() async throws -> MovieList {
        let request = MoviesRequest.list
        return try await networkRequester.doRequest(request: request)
    }
    
    func getMovieDetails(_ id: Int) async throws -> MovieDetails {
        let request = MoviesRequest.details(id)
        return try await networkRequester.doRequest(request: request)
    }
    
    func getMoviesLis(completion: @escaping (ResultResponse<MovieList>) -> Void) {
        let request = MoviesRequest.list
        networkRequester.doRequest(request: request, completion: completion)
    }
    
    func getMovieDetails(_ id: Int, completion: @escaping (ResultResponse<MovieDetails>) -> Void) {
        let request = MoviesRequest.details(id)
        networkRequester.doRequest(request: request, completion: completion)
    }
}
