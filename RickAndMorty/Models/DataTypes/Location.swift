//
//  Location.swift
//  RickAndMorty
//
//  Created by Marcela Hernández on 6/5/25.
//

import Foundation

struct Location: Codable {
    let id: Int
    let name: String
    let type: String
    let dimension: String
    let residents: [String]
    let url: String
    let created: String
    
}
