//
//  DetailPresenter.swift
//  Pokedex
//
//  Created by Cristian Misael Almendro Lazarte on 22/4/21.
//  
//

import Foundation

class DetailPresenter {
    // MARK: Properties
    weak var view: DetailViewProtocol?
    var interactor: DetailInteractorInputProtocol?
    var wireFrame: DetailWireFrameProtocol?
    //var pokemon: GetAllPokemonsWithLimitQuery.Data.Pokemon?
    var pokemonId: Int?
    var imageUrl: URL?
    var pokemonType: String?
}

extension DetailPresenter: DetailPresenterProtocol {
    func getPokemonFirstType() -> String {
        return (interactor?.getPokemonFirstType())!
    }
    func fetchPokemonLocation() {
        if let safePokemonId = pokemonId {
            interactor?.fetchPokemonLocation(pokemonId: safePokemonId)
        }
    }
    func viewDidLoad() {
        if let safePokemonId = pokemonId {
            interactor?.interactorRequestPokemonDescription(pokemonId: safePokemonId)
        }
    }
    func fetchPokemonTraining() {
        if let safePokemonId = pokemonId {
            interactor?.fetchPokemonTraining(pokemonId: safePokemonId)
        }
    }
    func fetchPokemonBreeding() {
        if let safePokemonId = pokemonId {
            interactor?.fetchPokemonBreeding(pokemonId: safePokemonId)
        }
    }
    func getPokemonChainEvolutions() -> GetPokemonDetailQuery.Data.PokemonV2Pokemonspecy.PokemonV2Evolutionchain? {
        return interactor?.getPokemonChainEvolutions() ?? nil
    }
    func getPokemonBaseStats() -> [GetPokemonDetailQuery.Data.PokemonV2Pokemonspecy.PokemonV2Pokemon.PokemonV2Pokemonstat]? {
        return interactor?.getPokemonBaseStats()
    }
    func getPokemonTypes() -> [GetPokemonDetailQuery.Data.PokemonV2Pokemonspecy.PokemonV2Pokemon.PokemonV2Pokemontype]? {
        return interactor?.getPokemonTypes()
    }
    func getPokemonName() -> String {
        return interactor?.getPokemonName() ?? Constants.PokemonTypeDefenses.defaultPokemonName
    }
    func fetchPokemonData() {
        if let safePokemonId = pokemonId {
            interactor?.fetchPokemonData(pokemonId: safePokemonId)
        }
    }
}

extension DetailPresenter: DetailInteractorOutputProtocol {
    func fetchSuccessPokemonData(pokemonData: GetPokemonDetailQuery.Data) {
        view?.showPokemonData(pokemonData: pokemonData)
    }
    func fetchSuccessPokemonDescription(description: String) {
        view?.showPokemonDescription(description: description)
    }
    func fetchSuccessPokemonLocation(pokemonLocations: [GetPokemonDetailQuery.Data.PokemonV2Pokemonspecy.PokemonV2Pokemondexnumber]) {
        view?.showPokemonLocation(pokemonLocations: pokemonLocations)
    }
    func fetchFailPokemonLocation() {
        view?.showFailPokemonLocation()
    }
    func fetchSuccessPokemonTraining(evYield: String, catchRate: String, baseFriendship: String, baseExperience: String, growthRate: String) {
        view?.showPokemonTraining(evYield: evYield, catchRate: catchRate, baseFriendship: baseFriendship, baseExperience: baseExperience, growthRate: growthRate)
    }
    func fetchFailPokemonTraining() {
        view?.showFailPokemonTraining()
    }
    func pokemonFetchFail() {
        view?.showFetchError()
    }
    func fetchSuccesPokemonBreeding(genderRate: Int, eggGroups: [GetPokemonDetailQuery.Data.PokemonV2Pokemonspecy.PokemonV2Pokemonegggroup], hatchCounter: Int) {
        view?.showPokemonBreeding(genderRate: genderRate, eggGroups: eggGroups, hatchCounter: hatchCounter)
    }
    func fetchFailPokemonBreeding() {
        view?.showFailPokemonBreeding()
    }
}
