//
//  PokemonChainEvolutionTest.swift
//  PokedexTests
//
//  Created by Victor Arana on 5/17/21.
//

import XCTest
@testable import Pokedex

class PokemonChainEvolutionTest: XCTestCase {
    var pokemonChainEvolution: PokemonChainEvolution?
    let imageUrl = "imagePath"
    let pokemonId = "9"
    let pokemonName = "Blastoise"

    override func setUpWithError() throws {
        pokemonChainEvolution = PokemonChainEvolution(imageUrl: imageUrl, id: pokemonId, name: pokemonName)
    }
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    func testClassIsInitializedCorrectly() throws {
        XCTAssertEqual(pokemonChainEvolution?.imageUrl, imageUrl)
        XCTAssertEqual(pokemonChainEvolution?.id, pokemonId)
        XCTAssertEqual(pokemonChainEvolution?.name, pokemonName)
    }
}
