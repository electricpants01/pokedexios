//
//  DetailRemoteDataManager.swift
//  Pokedex
//
//  Created by Cristian Misael Almendro Lazarte on 22/4/21.
//  
//
import Foundation
import Apollo

class DetailRemoteDataManager:DetailRemoteDataManagerInputProtocol {
    func fetchPokemonLocation(pokemonId: Int) {
        PokeApiService.shared.apollo.fetch(query: GetPokemonDetailQuery(_eq: pokemonId)) { result in
            switch result {
            case .success(let graphQLResult):
                if let data = graphQLResult.data?.pokemonV2Pokemonspecies.compactMap({$0}) {
                    self.remoteRequestHandler?.fetchSuccessPokemonLocation(pokemonLocations: data[0].pokemonV2Pokemondexnumbers)
                }
            case .failure(let error):
                self.remoteRequestHandler?.fetchFailPokemonLocation()
            }
        }
    }
    var remoteRequestHandler: DetailRemoteDataManagerOutputProtocol?
    func fetchPokemonTraining(pokemonId: Int) {
        PokeApiService.shared.apollo.fetch(query: GetPokemonDetailQuery(_eq: pokemonId)) { result in
            switch result {
            case .success(let graphQLResult):
                if let data = graphQLResult.data?.pokemonV2Pokemonspecies.compactMap({$0}) {
                    guard let baseExperience = data[0].baseHappiness else {return}
                    guard let growthRate = data[0].pokemonV2Growthrate?.name else {return}
                    guard let baseFiendship = data[0].baseHappiness else {return}
                    guard let catchRate = data[0].captureRate else {return}
                    let evYield = self.getEvYield(pokemonStats: data[0].pokemonV2Pokemons[0].pokemonV2Pokemonstats)
                    self.remoteRequestHandler?.fetchSuccessPokemonTraining(evYield: String(evYield),
                                                                           catchRate: String(catchRate),
                                                                           baseFriendship: String(baseFiendship),
                                                                           baseExperience: String(baseExperience),
                                                                           growthRate: String(growthRate))
                }
            case .failure(let error):
                self.remoteRequestHandler?.fetchFailPokemonTraining()
            }
        }
    }
    func getEvYield(pokemonStats: [GetPokemonDetailQuery.Data.PokemonV2Pokemonspecy.PokemonV2Pokemon.PokemonV2Pokemonstat]) -> String {
        var evYields: String = ""
        for index in 0..<pokemonStats.count {
            if pokemonStats[index].effort > 0 {
                if !evYields.isEmpty {
                    evYields += "\n"
                }
                evYields += "\(pokemonStats[index].effort) \(String(pokemonStats[index].pokemonV2Stat!.name))"
            }
        }
        return evYields
    }
    func fetchPokemonBreeding(pokemonId: Int) {
        PokeApiService.shared.apollo.fetch(query: GetPokemonDetailQuery(_eq: pokemonId)) { result in
            switch result {
            case .success(let graphQLResult):
                if let data = graphQLResult.data?.pokemonV2Pokemonspecies.compactMap({$0}) {
                    guard let genderRate = data[0].genderRate else {return}
                    let eggGroups = data[0].pokemonV2Pokemonegggroups
                    guard let hatchCounter = data[0].hatchCounter else {return}
                    self.remoteRequestHandler?.fetchSuccesPokemonBreeding(genderRate: genderRate,
                                                                          eggGroups: eggGroups,
                                                                          hatchCounter: hatchCounter)
                }
            case .failure(let error):
                self.remoteRequestHandler?.fetchFailPokemonBreeding()
            }
        }
    }
    func loadPokemonDetail(id: Int) {
        PokeApiService.shared.apollo.fetch(query: GetPokemonDetailQuery(_eq: id)) { (result) in
            switch result {
            case .success(let response):
                self.remoteRequestHandler?.fetchSuccess(pokemon: response.data!)
            case .failure(let error):
                print(error)
                self.remoteRequestHandler?.fetchFail()
            }
        }
    }
    func fetchPokemonData(pokemonId: Int) {
        PokeApiService.shared.apollo.fetch(query: GetPokemonDetailQuery(_eq: pokemonId)) { (result) in
            switch result {
            case .success(let response):
                self.remoteRequestHandler?.fetchSuccessPokemonData(pokemonData: response.data!)
            case .failure(let error):
                print(error)
                self.remoteRequestHandler?.fetchFail()
            }
        }
    }
    func fetchPokemonDescription(pokemonId: Int) {
        PokeApiService.shared.apollo.fetch(query: GetPokemonDetailQuery(_eq: pokemonId)) { result in
            switch result {
            case .success(let getPokemonDetail):
                if let safeData = getPokemonDetail.data?.pokemonV2Pokemonspecies.compactMap({$0}) {
                    guard let safePokemonV2Evolutionchain : GetPokemonDetailQuery.Data.PokemonV2Pokemonspecy.PokemonV2Evolutionchain  = safeData[0].pokemonV2Evolutionchain else {return}
                    guard let safePokemonV2Pokemonspecy : [GetPokemonDetailQuery.Data.PokemonV2Pokemonspecy.PokemonV2Evolutionchain.PokemonV2Pokemonspecy]? = safePokemonV2Evolutionchain.pokemonV2Pokemonspecies else { return }
                    guard let safePokemonV2Pokemonspeciesflavortext: [GetPokemonDetailQuery.Data.PokemonV2Pokemonspecy.PokemonV2Evolutionchain.PokemonV2Pokemonspecy.PokemonV2Pokemonspeciesflavortext]? = safePokemonV2Pokemonspecy?[0].pokemonV2Pokemonspeciesflavortexts else { return }
                    self.remoteRequestHandler?.getPokemonDescription(receivedData: safePokemonV2Pokemonspeciesflavortext!)
                }
            case .failure(let error) :
                print(error)
            }
        }
    }
}
