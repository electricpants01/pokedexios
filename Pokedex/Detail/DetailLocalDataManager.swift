//
//  DetailLocalDataManager.swift
//  Pokedex
//
//  Created by Cristian Misael Almendro Lazarte on 22/4/21.
//  
//

import Foundation

class DetailLocalDataManager:DetailLocalDataManagerInputProtocol {
    func loadPokemonTypeDefenses() -> [TypeDefense] {
        return zip(Constants.PokemonTypeDefenses.typeNames, Constants.PokemonTypeDefenses.typeIds).map { TypeDefense($0, $1)}
    }
}
