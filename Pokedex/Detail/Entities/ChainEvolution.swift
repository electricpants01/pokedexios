//
//  EvolutionChain.swift
//  Pokedex
//
//  Created by Victor Arana on 5/16/21.
//

import Foundation

class ChainEvolution {
    var currentPokemon: PokemonChainEvolution
    var evolutedPokemon: PokemonChainEvolution
    var evolutionTrigger: EvolutionTrigger
    init(current: PokemonChainEvolution, evoluted: PokemonChainEvolution, trigger: EvolutionTrigger) {
        self.currentPokemon = current
        self.evolutedPokemon = evoluted
        self.evolutionTrigger = trigger
    }
}
