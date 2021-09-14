//
// DetailPresenterTests.swift
// PokedexTests
// Created by Christian Torrico Avila on 5/18/21.
// @locoto
//

import XCTest
@testable import Pokedex

class DetailPresenterTests: XCTestCase {

    var presenter: DetailPresenter?
    var view: MockDetailView?
    override func setUpWithError() throws {
        presenter = DetailPresenter()
        view = MockDetailView()
        presenter?.view = self.view
    }
    override func tearDownWithError() throws {
        presenter = nil
        view = nil
    }
    func testFetchPokemonTraining() throws {
        presenter?.fetchSuccessPokemonTraining(evYield: "bulbasaur", catchRate: "45", baseFriendship: "70", baseExperience: "70", growthRate: "12")
        XCTAssertTrue(view?.loading ?? false)
    }
    func testFetchPokemonTrainingFailed() throws {
        presenter?.fetchFailPokemonTraining()
        XCTAssertTrue(view?.loading ?? false)
    }
    func testFetchPokemonLocation() throws {
        presenter?.fetchSuccessPokemonLocation(pokemonLocations: [GetPokemonDetailQuery.Data.PokemonV2Pokemonspecy.PokemonV2Pokemondexnumber]())
        XCTAssertTrue(view?.loading ?? false)
    }
    func testFetchPokemonLocationFailed() throws {
        presenter?.fetchFailPokemonTraining()
        XCTAssertTrue(view?.loading ?? false)
    }

}

class MockDetailView: DetailViewProtocol {
    func showPokemonData(pokemonData: GetPokemonDetailQuery.Data) {
    } 
    func showPokemonDescription(description: String) {
    }
    func showFetchError() {
    }
    var presenter: DetailPresenterProtocol?
    var loading = false
    func showPokemonTraining(evYield: String, catchRate: String, baseFriendship: String, baseExperience: String, growthRate: String) {
        // This means that the fetch was done successfully and there is a correct communication between
        // The View and the Presenter
        self.loading = true
    }
    func showFailPokemonTraining() {
        self.loading = true
    }
    func showPokemonLocation(pokemonLocations: [GetPokemonDetailQuery.Data.PokemonV2Pokemonspecy.PokemonV2Pokemondexnumber]) {
        self.loading = true
    }
    func showFailPokemonLocation() {
        self.loading = true
    }
    func showPokemonBreeding(genderRate: Int, eggGroups: [GetPokemonDetailQuery.Data.PokemonV2Pokemonspecy.PokemonV2Pokemonegggroup], hatchCounter: Int) {
        self.loading = true
    }
    func showFailPokemonBreeding() {
        self.loading = true
    }
}
