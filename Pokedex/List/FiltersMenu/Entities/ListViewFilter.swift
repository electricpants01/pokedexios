//
//  ListViewFilter.swift
//  Pokedex
//
//  Created by Victor Arana on 5/20/21.
//

import Foundation

class ListViewFilter {
    var typeId: Int
    var weaknessTypeId: Int
    var heightId: Int
    var weightId: Int
    var minPokemonId: Int
    var maxPokemonId: Int
    init() {
        typeId = -1
        weaknessTypeId = -1
        heightId = -1
        weightId = -1
        minPokemonId = 0
        maxPokemonId = 11000
    }
}
