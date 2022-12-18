//
//  NetworkRequest.swift
//  APIRequestTest
//
//  Created by Joyce Rosario Batista on 18/12/22.
//

import Foundation

struct NetworkRequest {
    var request: URLRequest
    
    init(apiRequest: APIRequest) {
        var urlComponents = URLComponents(string: apiRequest.url?.description ?? Constants.urlBase)
        let path = urlComponents?.path.appending(apiRequest.path) ?? ""
        
        urlComponents?.path = path
        
        if let queryItems = apiRequest.queryItems {
            urlComponents?.queryItems = queryItems
            urlComponents?.queryItems?.append(URLQueryItem(name: "api_key", value: "63dc037173bf8d67f8f0315bf944d582"))
        } else {
            urlComponents?.queryItems = [URLQueryItem(name: "api_key", value: "63dc037173bf8d67f8f0315bf944d582")]
        }
        
        guard let fullURL = urlComponents?.url else {
            assertionFailure("Couldn't build URL.")
            request = URLRequest(url: URL(string: "")!)
            return
        }
        
        request = URLRequest(url: fullURL)
        request.httpMethod = apiRequest.method.rawValue
        request.timeoutInterval = apiRequest.timeoutInterval
    }
}
