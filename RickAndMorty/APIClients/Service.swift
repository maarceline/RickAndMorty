//
//  Service.swift
//  RickAndMorty
//
//  Created by Marcela Hernández on 6/5/25.
//

import Foundation

/// Primary API Service object to get Rick and morty data
final class Service {
    
    /// Shared singleton instance
    static let shared = Service()
    
    
    /// Privatized Constructor
    private init() {}
    
    enum ServiceError: Error {
        case failedToCreateURLRequest
        case failedToGetData
    }
    
    /// Send Rick and  morty API Call
    /// - Parameters:
    ///   - request: Request instance
    ///   - type: The type of object we expect to get back
    ///   - completion: Callback with data or error
    public func execute<T: Codable>( _ request: Requests,
                                     expecting type: T.Type,
                                     completion: @escaping (Result<T, Error>) -> Void
    ) {
        guard let urlRequest = self.request(from: request) else {
            completion(.failure(ServiceError.failedToCreateURLRequest))
            return
        }
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? ServiceError.failedToGetData))
                return
            }
            
            // Decode Response
            do {
                let result = try JSONDecoder().decode(type.self, from: data)
                completion(.success(result))
                
                //
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    // MARK: - Private
    
    private func request(from reequest: Requests) -> URLRequest? {
        guard let url = reequest.url else { return nil }
        
        var request = URLRequest(url: url)
        request.httpMethod = reequest.httpMethod
        
        return request
    }
}
