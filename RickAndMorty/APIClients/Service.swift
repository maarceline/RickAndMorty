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
    ///   - completion: Callback with data or error
    public func execute( _ request: Requests, completion: @escaping () -> Void) {
        
    }
}
