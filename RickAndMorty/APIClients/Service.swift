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
    
    /// Send Rick and  morty API Call
    /// - Parameters:
    ///   - request: Request instance
    ///   - type: The type of object we expect to get back
    ///   - completion: Callback with data or error
    public func execute<T: Codable>( _ request: Requests,
                                     expecting type: T.Type,
                                     completion: @escaping (Result<T, Error>) -> Void) {
        
    }
}
