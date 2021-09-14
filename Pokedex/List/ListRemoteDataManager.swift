//
//  ListRemoteDataManager.swift
//  Pokedex
//
//  Created by Cristian Misael Almendro Lazarte on 22/4/21.
//  
//

import Foundation
import Apollo

class ListRemoteDataManager:ListRemoteDataManagerInputProtocol {
    var limit = 20
    var remoteRequestHandler: ListRemoteDataManagerOutputProtocol?
    func fethPokemonList() {
        PokeApiService.shared.apollo.fetch(query: GetAllPokemonsWithLimitQuery(limit: limit)) { (result) in
            switch result {
            case .success(let list):
                self.remoteRequestHandler?.fetchSuccess(list: list.data!.pokemons, type: PokemonListResultType.normal)
            case .failure(let error):
                print(error)
                self.remoteRequestHandler?.fetchFail()
            }
        }
    }
    func fetchMorePokemons() {
        limit+=20
        PokeApiService.shared.apollo.fetch(query: GetAllPokemonsWithLimitQuery(limit: limit)) { (result) in
            switch result {
            case .success(let list):
                self.remoteRequestHandler?.fetchSuccess(list: list.data!.pokemons, type: PokemonListResultType.normal)
            case .failure(let error):
                print(error)
                self.remoteRequestHandler?.fetchFail()
            }
        }
    }
    func fetchPokemonWithFilters(listViewFilter: ListViewFilter) {
        let minId = listViewFilter.minPokemonId
        let maxId = listViewFilter.maxPokemonId
        var minH = Constants.FiltersMenuValues.pokemonHeightsValues[0]
        var maxH = Constants.FiltersMenuValues.pokemonHeightsValues[3]
        var minW = Constants.FiltersMenuValues.pokemonWeightsValues[0]
        var maxW = Constants.FiltersMenuValues.pokemonWeightsValues[3]
        if listViewFilter.heightId >= 0 {
            minH = Constants.FiltersMenuValues.pokemonHeightsValues[listViewFilter.heightId]
            maxH = Constants.FiltersMenuValues.pokemonHeightsValues[listViewFilter.heightId + 1]
        }
        if listViewFilter.weightId >= 0 {
            minW = Constants.FiltersMenuValues.pokemonWeightsValues[listViewFilter.weightId]
            maxW = Constants.FiltersMenuValues.pokemonWeightsValues[listViewFilter.weightId + 1]
        }
        if listViewFilter.typeId > -1 {
            let pokeType = Constants.FiltersMenuValues.typeIds[listViewFilter.typeId]
            PokeApiService.shared.apollo.fetch(query: GetPokemonsApplyingFiltersWithTypeQuery(_minId: minId, _maxId: maxId, _minH: minH, _maxH: maxH, _minW: minW, _maxW: maxW, _typeId: pokeType, limit: 1000, offset: 0)) { (result) in
                switch result {
                case .success(let list):
                    self.remoteRequestHandler?.fetchSuccess(list: list.data!.pokemons, type: PokemonListResultType.filterWithType)
                case .failure(let error):
                    print(error)
                    self.remoteRequestHandler?.fetchFail()
                }
            }
        } else if listViewFilter.weaknessTypeId > -1 {
            let pokeType = Constants.FiltersMenuValues.typeIds[listViewFilter.weaknessTypeId]
            let weaknessType = getWeaknessId(pokeType: pokeType)
            PokeApiService.shared.apollo.fetch(query: GetPokemonsApplyingFiltersWithTypeQuery(_minId: minId, _maxId: maxId, _minH: minH, _maxH: maxH, _minW: minW, _maxW: maxW, _typeId: weaknessType, limit: 1000, offset: 0)) { (result) in
                switch result {
                case .success(let list):
                    self.remoteRequestHandler?.fetchSuccess(list: list.data!.pokemons, type: PokemonListResultType.filterWithType)
                case .failure(let error):
                    print(error)
                    self.remoteRequestHandler?.fetchFail()
                }
            }
        } else {
            PokeApiService.shared.apollo.fetch(query: GetPokemonsApplyingFiltersQuery(_minId: minId, _maxId: maxId, _minH: minH, _maxH: maxH, _minW: minW, _maxW: maxW, limit: 1000, offset: 0)) { (result) in
                switch result {
                case .success(let list):
                    self.remoteRequestHandler?.fetchSuccess(list: list.data!.pokemons, type: PokemonListResultType.filter)
                case .failure(let error):
                    print(error)
                    self.remoteRequestHandler?.fetchFail()
                }
            }
        }
    }
    func getWeaknessId(pokeType: Int) -> Int {
        for index in 0...(Constants.FiltersMenuValues.typeIds.count - 1) {
            if Constants.PokemonTypeDefenses.damageRelations[index][pokeType - 1] == Constants.Damage.double {
                return (index + 1)
            }
        }
        return 1
    }
}
