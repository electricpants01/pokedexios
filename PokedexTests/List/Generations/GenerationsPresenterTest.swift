//
//  GenerationPresenterTest.swift
//  PokedexTests
//
//  Created by Cristian Misael Almendro Lazarte on 4/5/21.
//

import XCTest
@testable import Pokedex

class GenerationsPresenterTest: XCTestCase {
    var generationsPresenter : GenerationsPresenter?
    override func setUpWithError() throws {
        generationsPresenter = GenerationsPresenter()
    }

    override func tearDownWithError() throws {
        generationsPresenter = nil
    }

    func testReturnStringPokemonID() throws {
        let pokemon = generationsPresenter!.imageByGenerationId(generationId: 1, pokemonType: .FIRE)
        XCTAssertNotNil(pokemon)
    }

    func testReturnStringPokemonIDExist() throws {
        let pokemon = generationsPresenter!.imageByGenerationId(generationId: 3, pokemonType: .FIRE)
        XCTAssertEqual(pokemon, "255")
    }
}
