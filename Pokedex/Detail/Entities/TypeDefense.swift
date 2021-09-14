//
//  TypeDefense.swift
//  Pokedex
//
//  Created by Victor Arana on 5/17/21.
//

import Foundation

class TypeDefense: Equatable {
    var name: String
    var id: Int
    var damageRelation: Float
    init(_ name: String, _ id: Int) {
        self.name = name
        self.id = id
        self.damageRelation = 1.0
    }
    func applyDoubleDamage() {
        self.damageRelation *= 2.0
    }
    func applyNormalDamage() {
        self.damageRelation *= 1.0
    }
    func applyHalfDamage() {
        self.damageRelation *= 0.5
    }
    func applyNoDamage() {
        self.damageRelation *= 0.0
    }
    static func == (lhs: TypeDefense, rhs: TypeDefense) -> Bool {
        return (lhs.name == rhs.name) && (lhs.damageRelation == rhs.damageRelation)
    }
}
