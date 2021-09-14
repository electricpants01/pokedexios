//
//  ListPresenter.swift
//  Pokedex
//
//  Created by Cristian Misael Almendro Lazarte on 22/4/21.
//  
//

import Foundation
import Apollo

class ListPresenter {
    // MARK: Properties
    weak var view: ListViewProtocol?
    var interactor: ListInteractorInputProtocol?
    var wireFrame: ListWireFrameProtocol?
}

extension ListPresenter: ListPresenterProtocol {
    func showDetailView(detailView: DetailView, pokemonId: Int, imageUrl: URL, pokemonType: String) {
        wireFrame?.presentViewDetail(from: view!, to: detailView, pokemonId: pokemonId, imageUrl: imageUrl, pokemonType: pokemonType)
    }
    func startfetchingPokemonList() {
        self.interactor?.fetchPokemonList()
    }
    func fetchMorePokemons() {
        self.interactor?.fetchMorePokemons()
    }
    func viewDidLoad() {
    }
    func fetchPokemonWithFilters(listViewFilter: ListViewFilter) {
        interactor?.fetchPokemonWithFilters(listViewFilter: listViewFilter)
    }
}

extension ListPresenter: ListInteractorOutputProtocol {
    func pokemonFetchSuccess(list: [GraphQLSelectionSet], type: PokemonListResultType) {
        self.view?.showPokemonList(list: list, type: type)
    }
    func pokemonFetchFail() {
        self.view?.showError()
    }
}
