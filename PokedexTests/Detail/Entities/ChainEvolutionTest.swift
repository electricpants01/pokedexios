//
//  ChainEvolutionTest.swift
//  PokedexTests
//
//  Created by Victor Arana on 5/17/21.
//

import XCTest
@testable import Pokedex

class ChainEvolutionTest: XCTestCase {
    var chainEvolution: ChainEvolution?
    let currentImageUrl = "imagePath1"
    let currentPokemonId = "8"
    let currentPokemonName = "Wartortle"
    let evolutedImageUrl = "imagePath2"
    let evolutedPokemonId = "9"
    let evolutedPokemonName = "Blastoise"
    var imagePath = "imagePath"
    var triggerDescription = "(Trade)"
    var trigger = Trigger.trade
    var currentPokemon: PokemonChainEvolution?
    var evolutedPokemon: PokemonChainEvolution?
    var evolutionTrigger: EvolutionTrigger?
    override func setUpWithError() throws {
        currentPokemon = PokemonChainEvolution(imageUrl: currentImageUrl, id: currentPokemonId, name: currentPokemonId)
        evolutedPokemon = PokemonChainEvolution(imageUrl: evolutedImageUrl, id: evolutedPokemonId, name: evolutedPokemonName)
        evolutionTrigger = EvolutionTrigger(imagePath: imagePath, description: triggerDescription, trigger: trigger)
        chainEvolution = ChainEvolution(current: currentPokemon!, evoluted: evolutedPokemon!, trigger: evolutionTrigger!)
    }
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    func testChainEvolutionIsInitializedCorrectly() throws {
        XCTAssertEqual(chainEvolution?.currentPokemon, currentPokemon)
        XCTAssertEqual(chainEvolution?.evolutedPokemon, evolutedPokemon)
        XCTAssertEqual(chainEvolution?.evolutionTrigger, evolutionTrigger)
    }
}
