//
//  Requester.swift
//  APIRequestTest
//
//  Created by Joyce Rosario Batista on 18/12/22.
//

import Foundation

final class Requester {
    func doRequest<T: Decodable>(request: APIRequest) async throws -> T {
        do {
            let networkRequest = NetworkRequest(apiRequest: request)
            let (data, response) = try await URLSession.shared.data(for: networkRequest.request)
            
            guard let response = response as? HTTPURLResponse else { throw NetworkError.httpError }
            if response.statusCode == 200 {
                do {
                    return try JSONDecoder().decode(T.self, from: data)
                } catch {
                    throw NetworkError.parsing
                }
            } else {
                throw NetworkError.status(response.statusCode)
            }
        } catch let error as NetworkError {
            throw error
        } catch {
            throw NetworkError.general(error)
        }
    }
    
    func doRequest<T: Decodable>(request: APIRequest, completion: @escaping (ResultResponse<T>) -> Void) {
        let request =  NetworkRequest(apiRequest: request)
        let session = URLSession(configuration: .default)
        session.dataTask(with: request.request) { data, urlResponse, error in
            if let error = error {
                completion(.error(.general(error)))
                return
            }
            
            guard let urlResponse = urlResponse as? HTTPURLResponse else { completion(.error(.httpError))
                return
            }
            
            guard let data = data else { completion(.error(.parsing))
                return
            }
            
            if urlResponse.statusCode == 200 {
                do {
                    let json = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(json))
                } catch {
                    completion(.error(.parsing))
                }
            } else {
                completion(.error(.status(urlResponse.statusCode)))
            }
        }.resume()
    }
}
