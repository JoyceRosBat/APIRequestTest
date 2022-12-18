//
//  ResultResponse.swift
//  APIRequestTest
//
//  Created by Joyce Rosario Batista on 18/12/22.
//

import Foundation

enum ResultResponse<T> {
    case success(T)
    case error(NetworkError)
}
