//
//  MoviesRepositoryProtocol.swift
//  APIRequestTest
//
//  Created by Joyce Rosario Batista on 18/12/22.
//

import Foundation

protocol MoviesRepositoryProtocol {
    func getMoviesList() async throws -> MovieList
    func getMovieDetails(_ id: Int) async throws -> MovieDetails
    func getMoviesLis(completion: @escaping (ResultResponse<MovieList>) -> Void)
    func getMovieDetails(_ id: Int, completion: @escaping (ResultResponse<MovieDetails>) -> Void)
}
