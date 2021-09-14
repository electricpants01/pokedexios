//
//  ListPresenterTest.swift
//  PokedexTests
//
//  Created by user on 5/5/21.
//

import XCTest
@testable import Pokedex
@testable import Apollo

class ListPresenterTest: XCTestCase {
    var presenter: (ListPresenterProtocol & ListInteractorOutputProtocol)?
    var view: MockListView?

    override func setUpWithError() throws {
        presenter = ListPresenter()
        view = MockListView()
        presenter?.view = self.view
    }

    override func tearDownWithError() throws {
        presenter = nil
        view = nil
    }

    func testReturnPokemonData() throws {
        let mockPokemon = GetAllPokemonsWithLimitQuery.Data.Pokemon(id: 1, name:"Mock", types: [])
        let mockPokemonList = GetAllPokemonsWithLimitQuery.Data.init(pokemons: [mockPokemon])
        presenter?.pokemonFetchSuccess(list: mockPokemonList)
        XCTAssertTrue(view?.loading ?? true)
    }
    func testFailPokemonList() throws {
        presenter?.pokemonFetchFail()
        XCTAssertTrue(view?.loading ?? true)
    }
}

class MockListView: ListViewProtocol {
    var loading = false
    var presenter: ListPresenterProtocol?
    func showPokemonList(list: GetAllPokemonsWithLimitQuery.Data) {
        self.loading = true
    }
    func showError() {
        self.loading = true
    }
}
