//
//  EvolutionTriggerTest.swift
//  PokedexTests
//
//  Created by Victor Arana on 5/17/21.
//

import XCTest
@testable import Pokedex

class EvolutionTriggerTest: XCTestCase {
    var evolutionTrigger: EvolutionTrigger?
    var imagePath = "imagePath"
    var triggerDescription = "(Trade)"
    var trigger = Trigger.trade

    override func setUpWithError() throws {
        evolutionTrigger = EvolutionTrigger(imagePath: imagePath, description: triggerDescription, trigger: trigger)
    }
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    func testEvolutionTriggerIsInitializedCorrectly() throws {
        XCTAssertEqual(evolutionTrigger?.imagePath, imagePath)
        XCTAssertEqual(evolutionTrigger?.description, triggerDescription)
        XCTAssertEqual(evolutionTrigger?.trigger, trigger)
    }
}
