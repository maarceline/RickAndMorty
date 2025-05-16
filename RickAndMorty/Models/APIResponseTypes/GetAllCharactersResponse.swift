//
//  GetCharactersResponse.swift
//  RickAndMorty
//
//  Created by Marcela Hernández on 8/5/25.
//

import Foundation

struct GetAllCharactersResponse: Codable {
    struct Info: Codable {
        let count: Int
        let pages: Int
        let next: String
        let prev: String?
    }
    
    let info: Info
    let results: [Character]
}

