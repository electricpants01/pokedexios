//
//  EvolutionTrigger.swift
//  Pokedex
//
//  Created by Victor Arana on 5/16/21.
//

import Foundation

enum Trigger: Int {
    case levelUp = 1
    case trade = 2
    case useItem = 3
    case shed = 4
    case other = 5
}

class EvolutionTrigger: Equatable {
    var imagePath: String
    var description: String
    var trigger: Trigger
    var descriptionComplement: String
    var descriptionSecondComplement: String
    init(imagePath: String, description: String, trigger: Trigger) {
        self.imagePath = imagePath
        self.description = description
        self.trigger = trigger
        self.descriptionComplement = ""
        self.descriptionSecondComplement = ""
    }
    static func == (lhs: EvolutionTrigger, rhs: EvolutionTrigger) -> Bool {
        return (lhs.imagePath == rhs.imagePath && lhs.description == rhs.description && lhs.trigger == rhs.trigger)
    }
}
