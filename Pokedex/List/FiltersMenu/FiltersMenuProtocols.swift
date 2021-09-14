//
//  FiltersMenuProtocols.swift
//  Pokedex
//
//  Created by Victor Arana on 4/29/21.
//  
//

import Foundation
import UIKit

protocol FiltersMenuViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: FiltersMenuPresenterProtocol? { get set }
}

protocol FiltersMenuWireFrameProtocol: AnyObject {
    // PRESENTER -> WIREFRAME
    static func createFiltersMenuModule() -> UIViewController
}

protocol FiltersMenuPresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view: FiltersMenuViewProtocol? { get set }
    var interactor: FiltersMenuInteractorInputProtocol? { get set }
    var wireFrame: FiltersMenuWireFrameProtocol? { get set }
    func viewDidLoad()
    func getPokemonFilterListLength(collectionFilterId: CollectionFilter) -> Int
    func getPokemonFilterByIndex(index: Int, collectionFilterId: CollectionFilter) -> Filter?
    func markPokemonFilterByIndex(index: Int, collectionFilterId: CollectionFilter)
    func resetFilters()
}

protocol FiltersMenuInteractorOutputProtocol: AnyObject {
// INTERACTOR -> PRESENTER
}

protocol FiltersMenuInteractorInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter: FiltersMenuInteractorOutputProtocol? { get set }
    var localDatamanager: FiltersMenuLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: FiltersMenuRemoteDataManagerInputProtocol? { get set }
    func loadPokemonFiltersList()
    func getPokemonFilterListCount(collectionFilterId: CollectionFilter) -> Int
    func getPokemonFilterByIndex(index: Int, collectionFilterId: CollectionFilter) throws -> Filter
    func markPokemonFilterByIndex(index: Int, collectionFilterId: CollectionFilter) throws
    func resetFilters()
}

protocol FiltersMenuDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> DATAMANAGER
}

protocol FiltersMenuRemoteDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: FiltersMenuRemoteDataManagerOutputProtocol? { get set }
}

protocol FiltersMenuRemoteDataManagerOutputProtocol: AnyObject {
    // REMOTEDATAMANAGER -> INTERACTOR
}

protocol FiltersMenuLocalDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> LOCALDATAMANAGER
    func loadPokemonTypeFilterList() -> [Filter]
    func loadPokemonHeightFilterList() -> [Filter]
    func loadPokemonWeightFilterList() -> [Filter]
}
