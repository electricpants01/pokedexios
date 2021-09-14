//
//  StatTest.swift
//  PokedexTests
//
//  Created by Victor Arana on 5/19/21.
//

import XCTest
@testable import Pokedex

class StatTest: XCTestCase {
    var stat: Stat?
    var statId = 1
    var statBaseValue: Int?
    var statMinValue: String?
    var statMaxValue: String?
    var statName: String?
    override func setUpWithError() throws {
    }
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    func testStatHPIsInitializedCorrectly() throws {
        statId = 1
        statBaseValue = 45
        statMinValue = "200"
        statMaxValue = "294"
        statName = Constants.PokemonStats.names[statId - 1]
        stat = Stat(statId, statBaseValue!, statName!)
        XCTAssertEqual(stat?.id, statId)
        XCTAssertEqual(stat?.name, statName)
        XCTAssertEqual(stat?.baseValue, String(statBaseValue!))
        XCTAssertEqual(stat?.minValue, statMinValue)
        XCTAssertEqual(stat?.maxValue, statMaxValue)
    }
    func testStatAttackIsInitializedCorrectly() throws {
        statId = 2
        statBaseValue = 49
        statMinValue = "92"
        statMaxValue = "216"
        statName = Constants.PokemonStats.names[statId - 1]
        stat = Stat(statId, statBaseValue!, statName!)
        XCTAssertEqual(stat?.id, statId)
        XCTAssertEqual(stat?.name, statName)
        XCTAssertEqual(stat?.baseValue, String(statBaseValue!))
        XCTAssertEqual(stat?.minValue, statMinValue)
        XCTAssertEqual(stat?.maxValue, statMaxValue)
    }
    func testStatDefenseIsInitializedCorrectly() throws {
        statId = 3
        statBaseValue = 49
        statMinValue = "92"
        statMaxValue = "216"
        statName = Constants.PokemonStats.names[statId - 1]
        stat = Stat(statId, statBaseValue!, statName!)
        XCTAssertEqual(stat?.id, statId)
        XCTAssertEqual(stat?.name, statName)
        XCTAssertEqual(stat?.baseValue, String(statBaseValue!))
        XCTAssertEqual(stat?.minValue, statMinValue)
        XCTAssertEqual(stat?.maxValue, statMaxValue)
    }
    func testStatSpAttackIsInitializedCorrectly() throws {
        statId = 4
        statBaseValue = 65
        statMinValue = "121"
        statMaxValue = "251"
        statName = Constants.PokemonStats.names[statId - 1]
        stat = Stat(statId, statBaseValue!, statName!)
        XCTAssertEqual(stat?.id, statId)
        XCTAssertEqual(stat?.name, statName)
        XCTAssertEqual(stat?.baseValue, String(statBaseValue!))
        XCTAssertEqual(stat?.minValue, statMinValue)
        XCTAssertEqual(stat?.maxValue, statMaxValue)
    }
    func testStatSpDefenseIsInitializedCorrectly() throws {
        statId = 5
        statBaseValue = 65
        statMinValue = "121"
        statMaxValue = "251"
        statName = Constants.PokemonStats.names[statId - 1]
        stat = Stat(statId, statBaseValue!, statName!)
        XCTAssertEqual(stat?.id, statId)
        XCTAssertEqual(stat?.name, statName)
        XCTAssertEqual(stat?.baseValue, String(statBaseValue!))
        XCTAssertEqual(stat?.minValue, statMinValue)
        XCTAssertEqual(stat?.maxValue, statMaxValue)
    }
    func testStatSpeedIsInitializedCorrectly() throws {
        statId = 6
        statBaseValue = 45
        statMinValue = "85"
        statMaxValue = "207"
        statName = Constants.PokemonStats.names[statId - 1]
        stat = Stat(statId, statBaseValue!, statName!)
        XCTAssertEqual(stat?.id, statId)
        XCTAssertEqual(stat?.name, statName)
        XCTAssertEqual(stat?.baseValue, String(statBaseValue!))
        XCTAssertEqual(stat?.minValue, statMinValue)
        XCTAssertEqual(stat?.maxValue, statMaxValue)
    }
}
