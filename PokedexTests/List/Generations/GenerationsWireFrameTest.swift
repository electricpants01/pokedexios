//
//  GenerationsRemoteDataManagerTest.swift
//  PokedexTests
//
//  Created by Cristian Misael Almendro Lazarte on 3/5/21.
//

import XCTest
@testable import Pokedex

class GenerationsWireFrameTest: XCTestCase {
    let generationWireFrame = GenerationsWireFrame.createGenerationsModule()
    let generationsInteractor: GenerationsInteractor = GenerationsInteractor()
    let generationsRemoteDataManager: GenerationsRemoteDataManager = GenerationsRemoteDataManager()

    override func setUpWithError() throws {
        generationsInteractor.remoteDatamanager = generationsRemoteDataManager
        try super.setUpWithError()
    }
    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }

    func testForKnowIfExistGenerationStoryBoard() throws {
        let controller = GenerationsWireFrame.mainStoryboard.instantiateViewController(withIdentifier: Constants.StoryBoard.generationsViewStoryBoardID)
        XCTAssertNotNil(controller)
    }

    func testForKnowIfCanCastController() throws {
        let controller = GenerationsWireFrame.mainStoryboard.instantiateViewController(withIdentifier: Constants.StoryBoard.generationsViewStoryBoardID)
        XCTAssertNotNil(controller as? GenerationsView)
    }

}
