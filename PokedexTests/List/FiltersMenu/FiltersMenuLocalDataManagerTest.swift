//
//  FiltersMenuLocalDataManager.swift
//  PokedexTests
//
//  Created by Victor Arana on 5/1/21.
//

import XCTest
@testable import Pokedex

class FiltersMenuLocalDataManagerTest: XCTestCase {
    var localDataManager: FiltersMenuLocalDataManager?

    override func setUpWithError() throws {
        localDataManager = FiltersMenuLocalDataManager()
    }
    override func tearDownWithError() throws {
    }
    func testLoadPokemonTypeFilterList() throws {
        let pokemonTypeFilter = localDataManager?.loadPokemonTypeFilterList()
        XCTAssertEqual(pokemonTypeFilter?.count, 18)
    }
    func testLoadPokemonHeightFilterList() throws {
        let pokemonTypeFilter = localDataManager?.loadPokemonHeightFilterList()
        XCTAssertEqual(pokemonTypeFilter?.count, 3)
    }
    func testLoadPokemonWeightFilterList() throws {
        let pokemonTypeFilter = localDataManager?.loadPokemonWeightFilterList()
        XCTAssertEqual(pokemonTypeFilter?.count, 3)
    }
}
