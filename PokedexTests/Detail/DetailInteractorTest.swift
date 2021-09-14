//
//  DetailInteractorTest.swift
//  PokedexTests
//
//  Created by Victor Arana on 5/17/21.
//

import XCTest
@testable import Pokedex

class DetailInteractorTest: XCTestCase {
    var interactor: DetailInteractor?
    let listLenght = 18
    override func setUpWithError() throws {
        interactor = DetailInteractor()
        interactor?.localDatamanager = DetailLocalDataManager()
        interactor?.loadPokemonTypeDefenses()
    }
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    func testTypeDefensesAreLoadedCorrectly() throws {
        XCTAssertEqual(interactor?.pokemonTypeDefenses.count, listLenght)
    }
}
