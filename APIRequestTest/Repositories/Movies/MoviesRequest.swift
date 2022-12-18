//
//  MoviesRequest.swift
//  APIRequestTest
//
//  Created by Joyce Rosario Batista on 18/12/22.
//

import Foundation

enum MoviesRequest {
    case list
    case details(Int)
}

extension MoviesRequest: APIRequest {
    var path: String {
        switch self {
        case .list: return "/list/1"
        case .details(let id): return "/movie/\(id)"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .list: return .get
        case .details: return .get
        }
    }
}
