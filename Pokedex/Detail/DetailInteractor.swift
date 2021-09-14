//
//  DetailInteractor.swift
//  Pokedex
//
//  Created by Cristian Misael Almendro Lazarte on 22/4/21.
//  
//

import Foundation

class DetailInteractor: DetailInteractorInputProtocol {
    // MARK: Properties
    var pokemon: GetPokemonDetailQuery.Data?
    var pokemonTypeDefenses: [TypeDefense] = []
    weak var presenter: DetailInteractorOutputProtocol?
    var localDatamanager: DetailLocalDataManagerInputProtocol?
    var remoteDatamanager: DetailRemoteDataManagerInputProtocol?
    func fetchPokemonTraining(pokemonId: Int) {
        remoteDatamanager?.fetchPokemonTraining(pokemonId: pokemonId)
    }
    func getPokemonDetail(id: Int) {
        remoteDatamanager?.loadPokemonDetail(id: id)
    }
    func getPokemonChainEvolutions() -> GetPokemonDetailQuery.Data.PokemonV2Pokemonspecy.PokemonV2Evolutionchain? {
        return pokemon?.pokemonV2Pokemonspecies[0].pokemonV2Evolutionchain ?? nil
    }
    func getPokemonBaseStats() -> [GetPokemonDetailQuery.Data.PokemonV2Pokemonspecy.PokemonV2Pokemon.PokemonV2Pokemonstat]? {
        return pokemon?.pokemonV2Pokemonspecies[0].pokemonV2Pokemons[0].pokemonV2Pokemonstats ?? []
    }
    func getPokemonFirstType() -> String {
        if let pokemonFirstTypeId = pokemon?.pokemonV2Pokemonspecies[0].pokemonV2Pokemons[0].pokemonV2Pokemontypes[0].typeId {
            for typeDefense in pokemonTypeDefenses where typeDefense.id == pokemonFirstTypeId {
                return typeDefense.name
            }
        }
        return Constants.PokemonTypeDefenses.defaultTitleColort
    }
    func getPokemonTypes() -> [GetPokemonDetailQuery.Data.PokemonV2Pokemonspecy.PokemonV2Pokemon.PokemonV2Pokemontype]? {
        return pokemon?.pokemonV2Pokemonspecies[0].pokemonV2Pokemons[0].pokemonV2Pokemontypes ?? []
    }
    func getPokemonName() -> String {
        return pokemon?.pokemonV2Pokemonspecies[0].name ?? Constants.PokemonTypeDefenses.defaultPokemonName
    }
    func fetchPokemonLocation(pokemonId: Int) {
        remoteDatamanager?.fetchPokemonLocation(pokemonId: pokemonId)
    }
    func fetchPokemonBreeding(pokemonId: Int) {
        remoteDatamanager?.fetchPokemonBreeding(pokemonId: pokemonId)
    }
    func fetchPokemonData(pokemonId: Int) {
        remoteDatamanager?.fetchPokemonData(pokemonId: pokemonId)
    }
    func interactorRequestPokemonDescription(pokemonId: Int) {
        remoteDatamanager?.fetchPokemonDescription(pokemonId: pokemonId)
    }
}
extension DetailInteractor: DetailRemoteDataManagerOutputProtocol {
    func fetchSuccesPokemonBreeding(genderRate: Int, eggGroups: [GetPokemonDetailQuery.Data.PokemonV2Pokemonspecy.PokemonV2Pokemonegggroup], hatchCounter: Int) {
        presenter?.fetchSuccesPokemonBreeding(genderRate: genderRate, eggGroups: eggGroups, hatchCounter: hatchCounter)
    }
    func fetchFailPokemonBreeding() {
        presenter?.fetchFailPokemonBreeding()
    }
    func fetchSuccessPokemonData(pokemonData: GetPokemonDetailQuery.Data) {
        presenter?.fetchSuccessPokemonData(pokemonData: pokemonData)
    }
    func fetchSuccessPokemonLocation(pokemonLocations: [GetPokemonDetailQuery.Data.PokemonV2Pokemonspecy.PokemonV2Pokemondexnumber]) {
        presenter?.fetchSuccessPokemonLocation(pokemonLocations: pokemonLocations)
    }
    func fetchFailPokemonLocation() {
        presenter?.fetchFailPokemonLocation()
    }
    func fetchSuccessPokemonTraining(evYield: String, catchRate: String, baseFriendship: String, baseExperience: String, growthRate: String) {
        presenter?.fetchSuccessPokemonTraining(evYield: evYield, catchRate: catchRate, baseFriendship: baseFriendship, baseExperience: baseExperience, growthRate: growthRate)
    }
    func fetchFailPokemonTraining() {
        presenter?.fetchFailPokemonTraining()
    }
    func fetchSuccess(pokemon: GetPokemonDetailQuery.Data) {
        self.pokemon = pokemon
        loadPokemonTypeDefenses()
    }
    func fetchFail() {
        presenter?.pokemonFetchFail()
    }
    func loadPokemonTypeDefenses() {
        pokemonTypeDefenses = (localDatamanager?.loadPokemonTypeDefenses())!
    }
    func getPokemonDescription(receivedData: [GetPokemonDetailQuery.Data.PokemonV2Pokemonspecy.PokemonV2Evolutionchain.PokemonV2Pokemonspecy.PokemonV2Pokemonspeciesflavortext]) {
        presenter?.fetchSuccessPokemonDescription(description: receivedData[0].flavorText)
    }
}
