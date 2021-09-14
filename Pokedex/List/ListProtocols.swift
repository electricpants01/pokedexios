//
//  ListProtocols.swift
//  Pokedex
//
//  Created by Cristian Misael Almendro Lazarte on 22/4/21.
//  
//

import Foundation
import UIKit
import Apollo

protocol ListViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: ListPresenterProtocol? { get set }
    func showPokemonList(list: [GraphQLSelectionSet], type: PokemonListResultType)
    func showError()
}

protocol ListWireFrameProtocol: AnyObject {
    // PRESENTER -> WIREFRAME
    static func createListModule() -> UIViewController
    func presentViewDetail(from view: ListViewProtocol,to detailView: DetailView, pokemonId: Int, imageUrl: URL, pokemonType: String)
}

protocol ListPresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view: ListViewProtocol? { get set }
    var interactor: ListInteractorInputProtocol? { get set }
    var wireFrame: ListWireFrameProtocol? { get set }
    func viewDidLoad()
    func startfetchingPokemonList()
    func fetchMorePokemons()
    func fetchPokemonWithFilters(listViewFilter: ListViewFilter)
    func showDetailView(detailView: DetailView, pokemonId: Int, imageUrl: URL, pokemonType: String)
}

protocol ListInteractorOutputProtocol: AnyObject {
// INTERACTOR -> PRESENTER
    func pokemonFetchSuccess(list: [GraphQLSelectionSet], type: PokemonListResultType)
    func fetchMorePokemons()
    func pokemonFetchFail()
}

protocol ListInteractorInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter: ListInteractorOutputProtocol? { get set }
    var localDatamanager: ListLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: ListRemoteDataManagerInputProtocol? { get set }
    func fetchPokemonList()
    func fetchMorePokemons()
    func fetchPokemonWithFilters(listViewFilter: ListViewFilter)
}

protocol ListDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> DATAMANAGER
}

protocol ListRemoteDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: ListRemoteDataManagerOutputProtocol? { get set }
    func fethPokemonList()
    func fetchMorePokemons()
    func fetchPokemonWithFilters(listViewFilter: ListViewFilter)
}

protocol ListRemoteDataManagerOutputProtocol: AnyObject {
    // REMOTEDATAMANAGER -> INTERACTOR
    func fetchSuccess(list: [GraphQLSelectionSet], type: PokemonListResultType)
    func fetchFail()
}

protocol ListLocalDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> LOCALDATAMANAGER
}
