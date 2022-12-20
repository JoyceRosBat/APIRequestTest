//
//  MainInteractorProtocol.swift
//  APIRequestTest
//
//  Created by Joyce Rosario Batista on 20/12/22.
//

import Foundation

protocol MainInteractorProtocol {
    func getMovies() async throws -> [Item]
}
