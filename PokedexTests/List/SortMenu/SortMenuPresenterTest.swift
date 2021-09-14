//
//  SortMenuPresenterTest.swift
//  PokedexTests
//
//  Created by user on 5/5/21.
//

import XCTest
@testable import Pokedex

class SortMenuPresenterTest: XCTestCase {
    var sortMenuPresenter : SortMenuPresenter?
    override func setUpWithError() throws {
        sortMenuPresenter = SortMenuPresenter()
    }

    override func tearDownWithError() throws {
       sortMenuPresenter = nil
    }

    func testUpgradeSortMethod() throws {
        let sortMethod = sortMenuPresenter?.applySort(sort: .highestnumber)
        XCTAssertEqual(sortMethod, "1")
    }
    func testSelectedSortSmallestFirstsMethod() throws {
        let sortMethod = sortMenuPresenter?.sendSelectedSort(type: .smallestnumberfirst)
        XCTAssertEqual(sortMethod, "asc")
    }
    func testSelectedSortHighestFirstMethod() throws {
        let sortMethod = sortMenuPresenter?.sendSelectedSort(type: .highestnumber)
        XCTAssertEqual(sortMethod, "dsc")
    }
    func testSelectedSortAZMethod() throws {
        let sortMethod = sortMenuPresenter?.sendSelectedSort(type: .alphabeticallyAZ)
        XCTAssertEqual(sortMethod, "az")
    }
    func testSelectedSortZAMethod() throws {
        let sortMethod = sortMenuPresenter?.sendSelectedSort(type: .alphabeticallyZA)
        XCTAssertEqual(sortMethod, "za")
    }

}
