//
//  ListInteractor.swift
//  Pokedex
//
//  Created by Cristian Misael Almendro Lazarte on 22/4/21.
//  
//

import Foundation
import Apollo

class ListInteractor: ListInteractorInputProtocol {
    // MARK: Properties
    weak var presenter: ListInteractorOutputProtocol?
    var localDatamanager: ListLocalDataManagerInputProtocol?
    var remoteDatamanager: ListRemoteDataManagerInputProtocol?
    func fetchPokemonList() {
        remoteDatamanager?.fethPokemonList()
    }
    func fetchMorePokemons() {
        remoteDatamanager?.fetchMorePokemons()
    }
    func fetchPokemonWithFilters(listViewFilter: ListViewFilter) {
        remoteDatamanager?.fetchPokemonWithFilters(listViewFilter: listViewFilter)
    }
}

extension ListInteractor: ListRemoteDataManagerOutputProtocol {
    func fetchSuccess(list: [GraphQLSelectionSet], type: PokemonListResultType) {
        presenter?.pokemonFetchSuccess(list: list, type: type)
    }
    func fetchFail() {
        presenter?.pokemonFetchFail()
    }
}
