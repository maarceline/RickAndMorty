//
//  Request.swift
//  RickAndMorty
//
//  Created by Marcela Hernández on 6/5/25.
//

import Foundation

/// Object that represents a single API call
final class Requests {
    
    /// API Constants
    private struct Constants {
        static let baseURL = "https://rickandmortyapi.com/api"
    }
    
    /// Desired endpoint
    private let endpoint: EndPoint
    
    /// Path components for API, if any
    private let pathComponents: [String]
    
    /// Query arguments for API, for any
    private let queryParameters: [URLQueryItem]
    
    /// Constructed url for the api request in string format
    private var urlString: String {
        var string = Constants.baseURL
        string += "/"
        string += endpoint.rawValue
        
        if !pathComponents.isEmpty {
            pathComponents.forEach ({
                string += "/\($0)"
            })
        }
        
        if !queryParameters.isEmpty {
            string += "?"
            // name=value&name=value
            let argumentString = queryParameters.compactMap({
                guard let value = $0.value else {return nil}
                return "\($0.name)=\(value)"
            }).joined(separator: "&")
            
            string += argumentString
        }
        
        return string
    }
    
    /// Computed & constructed API url
    public var url: URL? {
        return URL(string: urlString)
    }
    
    /// Desired http method
    public let httpMethod = "GET"
    
    // MARK: - Public
    
    /// Construct request
    /// - Parameters:
    ///   - endpoint: Target endpoint
    ///   - pathComponents: Collection of path components
    ///   - queryParameters: Collection of query parameters
    public init(
        endpoint: EndPoint,
        pathComponents: [String] = [],
        queryParameters: [URLQueryItem] = []
    ) {
        self.endpoint = endpoint
        self.pathComponents = pathComponents
        self.queryParameters = queryParameters
    }
    
    convenience init?(url: URL) {
        let string = url.absoluteString
        if !string.contains(Constants.baseURL) {
            return nil
        }
        let trimmed = string.replacingOccurrences(of: Constants.baseURL+"/", with: "")
        if trimmed.contains("/") {
            let components = trimmed.components(separatedBy: "/")
            if !components.isEmpty {
                let endpointString = components[0]
                if let enpoint = EndPoint(rawValue: endpointString) {
                    self.init(endpoint: enpoint)
                    return
                }
            }
            
        } else if trimmed.contains("?") {
            let components = trimmed.components(separatedBy: "?")
            if !components.isEmpty, components.count >= 2 {
                let endpointString = components[0]
                let queryItemsString = components[1]
                let queryItems: [URLQueryItem] = queryItemsString.components(separatedBy: "&").compactMap({
                    guard $0.contains("=") else {
                        return nil
                    }
                    let parts = $0.components(separatedBy: "=")
                    
                    return URLQueryItem(
                        name: parts[0],
                        value: parts[1])
                })
                if let enpoint = EndPoint(rawValue: endpointString) {
                    self.init(endpoint: enpoint, queryParameters: queryItems)
                    return
                }
            }
        }
        return nil
    }
}

extension Requests {
    static let listCharacterRequests = Requests(endpoint: .character)
}
