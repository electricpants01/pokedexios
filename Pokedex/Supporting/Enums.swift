//
//  Enums.swift
//  Pokedex
//
//  Created by Cristian Misael Almendro Lazarte on 2/5/21.
//

import Foundation

enum PokemonTypes {
    case FIRE
    case WATER
    case GRASS
}
enum PokemonBackgroundColor: String {
    case bug = "back-bug"
    case dark = "back-dark"
    case dragon = "back-dragon"
    case electic = "back-electic"
    case fairy = "back-fairy"
    case fighting = "back-fighting"
    case fire = "back-fire"
    case flying = "back-flying"
    case ghost = "back-ghost"
    case grass = "back-grass"
    case ground = "back-ground"
    case ice = "back-ice"
    case normal = "back-normal"
    case poison = "back-poison"
    case psychic = "back-psychic"
    case rock = "back-rock"
    case steel = "back-steel"
    case water = "back-water"
}
enum PokeStat: Int {
    case hp = 1
    case attack = 2
    case defense = 3
    case spAttack = 4
    case spDefense = 5
    case speed = 6
    case other = 7
}
enum PokemonListResultType {
    case normal
    case filter
    case filterWithType
}
