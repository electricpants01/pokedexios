//
//  PokemonChainEvolution.swift
//  Pokedex
//
//  Created by Victor Arana on 5/16/21.
//

import Foundation

class PokemonChainEvolution: Equatable {
    var imageUrl: String
    var id: String
    var name: String
    init(imageUrl: String, id: String, name: String) {
        self.imageUrl = imageUrl
        self.id = id
        self.name = name
    }
    static func == (lhs: PokemonChainEvolution, rhs: PokemonChainEvolution) -> Bool {
        return (lhs.imageUrl == rhs.imageUrl && lhs.id == rhs.id && lhs.name == rhs.name)
    }
}
