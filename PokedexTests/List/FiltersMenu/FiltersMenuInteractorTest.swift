//
//  FiltersMenuInteractorTest.swift
//  PokedexTests
//
//  Created by Victor Arana on 5/1/21.
//

import XCTest
@testable import Pokedex

class FiltersMenuInteractorTest: XCTestCase {
    var interactor: FiltersMenuInteractor?
    let collectionFilter = CollectionFilter.weakness
    var index: Int = 0

    override func setUpWithError() throws {
        let localDataManager: FiltersMenuLocalDataManagerInputProtocol = FiltersMenuLocalDataManager()
        interactor = FiltersMenuInteractor()
        interactor?.localDatamanager = localDataManager
        interactor?.loadPokemonFiltersList()
        index = 0
    }
    override func tearDownWithError() throws {
    }
    func testLoadPokemonFiltersLists() throws {
        XCTAssertEqual(interactor?.getPokemonFilterListCount(collectionFilterId: CollectionFilter.type), 18)
        XCTAssertEqual(interactor?.getPokemonFilterListCount(collectionFilterId: CollectionFilter.weakness), 18)
        XCTAssertEqual(interactor?.getPokemonFilterListCount(collectionFilterId: CollectionFilter.height), 3)
        XCTAssertEqual(interactor?.getPokemonFilterListCount(collectionFilterId: CollectionFilter.weight), 3)
    }
    func testGetPokemonFilterByIndex() throws {
        XCTAssertNotEqual(try interactor?.getPokemonFilterByIndex(index: index, collectionFilterId: collectionFilter), nil)
    }
    func testGetPokemonFilterByIndexThrowsException() throws {
        index = (interactor?.getPokemonFilterListCount(collectionFilterId: collectionFilter))! + 1
        XCTAssertThrowsError(try interactor?.getPokemonFilterByIndex(index: index, collectionFilterId: collectionFilter)) { error in
            XCTAssertEqual(error as? FiltersMenuError, FiltersMenuError.indexOutOfRange)
        }
    }
    func testMarkPokemonFilterByIndex() throws {
        let pokemonFilter = try interactor?.getPokemonFilterByIndex(index: index, collectionFilterId: collectionFilter)
        XCTAssertEqual(pokemonFilter?.isSelected, false)
        try interactor?.markPokemonFilterByIndex(index: index, collectionFilterId: collectionFilter)
        let pokemonFilterMarked = try interactor?.getPokemonFilterByIndex(index: index, collectionFilterId: collectionFilter)
        XCTAssertEqual(pokemonFilterMarked?.isSelected, true)
    }
    func testMarkPokemonFilterByIndexThrowsException() throws {
        index = (interactor?.getPokemonFilterListCount(collectionFilterId: collectionFilter))! + 1
        XCTAssertThrowsError(try interactor?.markPokemonFilterByIndex(index: index, collectionFilterId: collectionFilter)) { error in
            XCTAssertEqual(error as? FiltersMenuError, FiltersMenuError.indexOutOfRange)
        }
    }
    func testResetFilters() throws {
        try interactor?.markPokemonFilterByIndex(index: index, collectionFilterId: collectionFilter)
        let pokemonFilterMarked = try interactor?.getPokemonFilterByIndex(index: index, collectionFilterId: collectionFilter)
        XCTAssertEqual(pokemonFilterMarked?.isSelected, true)
        interactor?.resetFilters()
        let pokemonFilterReseted = try interactor?.getPokemonFilterByIndex(index: index, collectionFilterId: collectionFilter)
        XCTAssertEqual(pokemonFilterReseted?.isSelected, false)
    }
    func testIndexInRangeValidation() throws {
        XCTAssertEqual(interactor?.validateIndexRange(index: index, collectionFilterId: collectionFilter), true)
    }
    func testIndexOutOfRangeValidation() throws {
        index = (interactor?.getPokemonFilterListCount(collectionFilterId: collectionFilter))! + 1
        XCTAssertEqual(interactor?.validateIndexRange(index: index, collectionFilterId: collectionFilter), false)
    }
}
