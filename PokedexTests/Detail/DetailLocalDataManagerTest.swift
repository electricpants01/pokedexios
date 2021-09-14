//
//  DetailLocalDataManagerTest.swift
//  PokedexTests
//
//  Created by Victor Arana on 5/17/21.
//

import XCTest
@testable import Pokedex

class DetailLocalDataManagerTest: XCTestCase {
    var statsLocalDataManager: DetailLocalDataManager?

    override func setUpWithError() throws {
        statsLocalDataManager = DetailLocalDataManager()
    }
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    func testLoadPokemonTypeDefenses() throws {
        let listLenght = 18
        let pokemonTypeDefenses = statsLocalDataManager?.loadPokemonTypeDefenses()
        XCTAssertEqual(pokemonTypeDefenses?.count, listLenght)
    }
}
