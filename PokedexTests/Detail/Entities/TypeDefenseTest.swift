//
//  TypeDefenseTest.swift
//  PokedexTests
//
//  Created by Victor Arana on 5/17/21.
//

import XCTest
@testable import Pokedex

class TypeDefenseTest: XCTestCase {
    var typeDefense: TypeDefense?
    var typeDefenseName = "normal"
    var typeDefenseId = 1

    override func setUpWithError() throws {
        typeDefense = TypeDefense(typeDefenseName, typeDefenseId)
    }
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    func testTypeDefenseInitializedCorrectly() throws {
        XCTAssertEqual(typeDefense?.name, typeDefenseName)
        XCTAssertEqual(typeDefense?.id, typeDefenseId)
        XCTAssertEqual(typeDefense?.damageRelation, 1.0)
    }
    func testApplyDoubleDamageCorrectly() throws {
        typeDefense?.applyDoubleDamage()
        XCTAssertEqual(typeDefense?.damageRelation, 2.0)
    }
    func testApplyNormalDamageCorrectly() throws {
        typeDefense?.applyNormalDamage()
        XCTAssertEqual(typeDefense?.damageRelation, 1.0)
    }
    func testApplyHalfDamageCorrectly() throws {
        typeDefense?.applyHalfDamage()
        XCTAssertEqual(typeDefense?.damageRelation, 0.5)
    }
    func testApplyNoDamageCorrectly() throws {
        typeDefense?.applyNoDamage()
        XCTAssertEqual(typeDefense?.damageRelation, 0.0)
    }
}
