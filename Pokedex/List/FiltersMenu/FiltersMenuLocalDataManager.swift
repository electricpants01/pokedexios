//
//  FiltersMenuLocalDataManager.swift
//  Pokedex
//
//  Created by Victor Arana on 4/29/21.
//  
//

import Foundation

class FiltersMenuLocalDataManager:FiltersMenuLocalDataManagerInputProtocol {
    func loadPokemonTypeFilterList() -> [Filter] {
        return Constants.FiltersMenuValues.pokemonTypes.map { Filter($0) }
    }
    func loadPokemonHeightFilterList() -> [Filter] {
        return Constants.FiltersMenuValues.pokemonHeights.map { Filter($0) }
    }
    func loadPokemonWeightFilterList() -> [Filter] {
        return Constants.FiltersMenuValues.pokemonWeights.map { Filter($0) }
    }
}
