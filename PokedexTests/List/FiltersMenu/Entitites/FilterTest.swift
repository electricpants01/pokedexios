//
//  Filter.swift
//  PokedexTests
//
//  Created by Victor Arana on 5/1/21.
//

import XCTest
@testable import Pokedex

class FilterTest: XCTestCase {
    var filter: Filter?
    let filterName = "test"

    override func setUpWithError() throws {
        filter = Filter(filterName)
    }
    override func tearDownWithError() throws {
    }
    func testFilterIsInitializedCorrectly() throws {
        XCTAssertEqual(filter?.name, filterName)
        XCTAssertEqual(filter?.isSelected, false)
    }
    func testFilterIsSelectedCorrectly() throws {
        filter!.select()
        XCTAssertEqual(filter?.isSelected, true)
    }
}
