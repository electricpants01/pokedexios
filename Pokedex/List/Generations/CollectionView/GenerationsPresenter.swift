//
//  GenerationsPresenter.swift
//  Pokedex
//
//  Created by Cristian Misael Almendro Lazarte on 28/4/21.
//  
//

import Foundation

class GenerationsPresenter {
    // MARK: Properties
    weak var view: GenerationsViewProtocol?
    var interactor: GenerationsInteractorInputProtocol?
    var wireFrame: GenerationsWireFrameProtocol?
}

extension GenerationsPresenter: GenerationsPresenterProtocol {
    func viewDidLoad() {
        interactor?.interactorRequestGenerationsNames()
    }

    func imageByGenerationId(generationId: Int, pokemonType: PokemonTypes) -> String {
        switch generationId {
        case 1:
            switch pokemonType {
            case .FIRE: return Constants.GenerationPokemons.firstGenerationFire
            case .GRASS: return Constants.GenerationPokemons.firstGenerationGrass
            case .WATER: return Constants.GenerationPokemons.firstGenerationWater
            }
        case 2:
            switch pokemonType {
            case .FIRE: return Constants.GenerationPokemons.secondGenerationFire
            case .GRASS: return Constants.GenerationPokemons.secondGenerationGrass
            case .WATER: return Constants.GenerationPokemons.secondGenerationWater
            }
        case 3:
            switch pokemonType {
            case .FIRE: return Constants.GenerationPokemons.thirdGenerationFire
            case .GRASS: return Constants.GenerationPokemons.thirdGenerationGrass
            case .WATER: return Constants.GenerationPokemons.thirdGenerationWater
            }
        case 4:
            switch pokemonType {
            case .FIRE: return Constants.GenerationPokemons.fourthGenerationFire
            case .GRASS: return Constants.GenerationPokemons.fourthGenerationGrass
            case .WATER: return Constants.GenerationPokemons.fourthGenerationWater
            }
        case 5:
            switch pokemonType {
            case .FIRE: return Constants.GenerationPokemons.fifthGenerationFire
            case .GRASS: return Constants.GenerationPokemons.fifthGenerationGrass
            case .WATER: return Constants.GenerationPokemons.fifthGenerationWater
            }
        case 6:
            switch pokemonType {
            case .FIRE: return Constants.GenerationPokemons.sixthGenerationFire
            case .GRASS: return Constants.GenerationPokemons.sixthGenerationGrass
            case .WATER: return Constants.GenerationPokemons.sixthGenerationWater
            }
        case 7:
            switch pokemonType {
            case .FIRE: return  Constants.GenerationPokemons.seventhGenerationFire
            case .GRASS: return Constants.GenerationPokemons.seventhGenerationGrass
            case .WATER: return Constants.GenerationPokemons.seventhGenerationWater
            }
        case 8:
            switch pokemonType {
            case .FIRE: return Constants.GenerationPokemons.eightGenerationFire
            case .GRASS: return Constants.GenerationPokemons.eightGenerationGrass
            case .WATER: return Constants.GenerationPokemons.eightGenerationWater
            }
        default:
            return ""
        }
    }
}

extension GenerationsPresenter: GenerationsInteractorOutputProtocol {
    func interactorPushDataPresenter(generations: [GetGenerationsQuery.Data.Generation]) {
        view?.presenterPushGenerationNames(generations: generations)
    }
}
