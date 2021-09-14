//
//  Stat.swift
//  Pokedex
//
//  Created by Victor Arana on 5/19/21.
//

import Foundation

class Stat: Equatable {
    static func == (lhs: Stat, rhs: Stat) -> Bool {
        return (lhs.id == rhs.id && lhs.name == rhs.name && lhs.baseValue == rhs.baseValue && lhs.minValue == rhs.minValue && lhs.maxValue == rhs.maxValue)
    }
    var id: Int
    var name: String
    var baseValue: String
    var minValue: String = ""
    var maxValue: String = ""
    init(_ id: Int, _ base: Int, _ name: String) {
        self.id = id
        self.name = name
        self.baseValue = String(base)
        self.calculateMinValue(base: base)
        self.calculateMaxValue(base: base)
    }
    func calculateMinValue(base: Int) {
        if self.id == PokeStat.hp.rawValue {
            self.minValue = String(2 * base + Constants.PokemonStats.hpMinAddition)
        } else {
            self.minValue = String(Int(Double(2 * base + Constants.PokemonStats.statMinAddition) * Constants.PokemonStats.hinderingNatureValue))
        }
    }
    func calculateMaxValue(base: Int) {
        if self.id == PokeStat.hp
            .rawValue {
            self.maxValue = String(2 * base + Constants.PokemonStats.hpMaxAdditon)
        } else {
            self.maxValue = String(Int(Double(2 * base + Constants.PokemonStats.statMaxAddition) * Constants.PokemonStats.beneficialNatureValue))
        }
    }
}
