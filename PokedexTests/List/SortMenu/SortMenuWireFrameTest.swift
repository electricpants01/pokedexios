//
//  SortMenuWireFrameTest.swift
//  PokedexTests
//
//  Created by user on 5/5/21.
//

import XCTest
@testable import Pokedex

class SortMenuWireFrameTest: XCTestCase {
    let sortMenuWireframe = SortMenuWireFrame.createSortMenuModule()

    override func tearDownWithError() throws {
        try super.setUpWithError()
    }

    func testForKnowIfExistGenerationStoryBoard() throws {
        let controller = SortMenuWireFrame.mainStoryboard.instantiateViewController(withIdentifier: Constants.StoryBoard.MenuViewStoryBoardID)
        XCTAssertNotNil(controller)
    }
    func testForKnowIfCanCastController() throws {
        let controller = SortMenuWireFrame.mainStoryboard.instantiateViewController(withIdentifier: Constants.StoryBoard.MenuViewStoryBoardID)
        XCTAssertNotNil(controller as? SortMenuViewController)
    }

}
