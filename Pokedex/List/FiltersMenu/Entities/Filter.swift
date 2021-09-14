//
//  PokemonType.swift
//  Pokedex
//
//  Created by Victor Arana on 4/29/21.
//

import Foundation

class Filter: Equatable {
    static func == (lhs: Filter, rhs: Filter) -> Bool {
        return (lhs.name == rhs.name) && (lhs.isSelected == lhs.isSelected)
    }
    var name: String
    var isSelected: Bool
    init(_ name: String) {
        self.name = name
        self.isSelected = false
    }
    func select() {
        self.isSelected = !self.isSelected
    }
}
