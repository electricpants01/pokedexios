//
//  FiltersMenuPresenterTest.swift
//  PokedexTests
//
//  Created by Victor Arana on 5/1/21.
//

import XCTest
@testable import Pokedex

class FiltersMenuPresenterTest: XCTestCase {
    var presenter: FiltersMenuPresenter?
    let collectionFilter = CollectionFilter.weakness
    var index: Int = 0

    override func setUpWithError() throws {
        presenter = FiltersMenuPresenter()
        let interactor = FiltersMenuInteractor()
        let localDataManager: FiltersMenuLocalDataManagerInputProtocol = FiltersMenuLocalDataManager()
        interactor.localDatamanager = localDataManager
        presenter?.interactor = interactor
        interactor.loadPokemonFiltersList()
    }
    override func tearDownWithError() throws {
    }
    func testGetPokemonFilterListLength() throws {
        XCTAssertEqual(presenter?.getPokemonFilterListLength(collectionFilterId: collectionFilter), 18)
    }
    func testGetPokemonFilterByIndex() throws {
        XCTAssertNotEqual(presenter?.getPokemonFilterByIndex(index: index, collectionFilterId: collectionFilter), nil)
    }
    func testGetPokemonFilterByIndexOutOfRange() throws {
        index = (presenter?.getPokemonFilterListLength(collectionFilterId: collectionFilter))! + 1
        XCTAssertEqual(presenter?.getPokemonFilterByIndex(index: index, collectionFilterId: collectionFilter), nil)
    }
    func testMarkPokemonFilterInRange() throws {
        let pokemonFilter = presenter?.getPokemonFilterByIndex(index: index, collectionFilterId: collectionFilter)
        XCTAssertEqual(pokemonFilter?.isSelected, false)
        presenter?.markPokemonFilterByIndex(index: index, collectionFilterId: collectionFilter)
        let pokemonFilterMarked = presenter?.getPokemonFilterByIndex(index: index, collectionFilterId: collectionFilter)
        XCTAssertEqual(pokemonFilterMarked?.isSelected, true)
    }
}
