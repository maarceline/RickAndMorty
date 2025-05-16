//
//  CharacterDetailViewViewModel.swift
//  RickAndMorty
//
//  Created by Marcela Hernández on 11/5/25.
//

import Foundation

final class CharacterDetailViewViewModel {
    private let character: Character
    
    init(character: Character) {
        self.character = character
    }
    
    public var title: String {
        character.name.uppercased()
    }
}
