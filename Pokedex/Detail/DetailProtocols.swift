//
//  DetailProtocols.swift
//  Pokedex
//
//  Created by Cristian Misael Almendro Lazarte on 22/4/21.
//  
//

import Foundation
import UIKit

protocol DetailViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: DetailPresenterProtocol? { get set }
    func showPokemonTraining(evYield: String, catchRate: String, baseFriendship: String, baseExperience: String,growthRate: String)
    func showFailPokemonTraining()
    func showFetchError()
    func showPokemonLocation(pokemonLocations: [GetPokemonDetailQuery.Data.PokemonV2Pokemonspecy.PokemonV2Pokemondexnumber])
    func showFailPokemonLocation()
    func showPokemonBreeding(genderRate: Int, eggGroups: [GetPokemonDetailQuery.Data.PokemonV2Pokemonspecy.PokemonV2Pokemonegggroup], hatchCounter: Int)
    func showFailPokemonBreeding()
    func showPokemonData(pokemonData: GetPokemonDetailQuery.Data)
    func showPokemonDescription(description: String)
}

protocol DetailWireFrameProtocol: AnyObject {
    // PRESENTER -> WIREFRAME
    static func createDetailModule(detailview: DetailView, pokemonId: Int, imageUrl: URL, pokemonType: String)
}

protocol DetailPresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view: DetailViewProtocol? { get set }
    var interactor: DetailInteractorInputProtocol? { get set }
    var wireFrame: DetailWireFrameProtocol? { get set }
    var pokemonId: Int? { get set }
    var imageUrl: URL? { get set }
    var pokemonType: String? { get set }
    func fetchPokemonTraining()
    func fetchPokemonLocation()
    func viewDidLoad()
    func getPokemonChainEvolutions() -> GetPokemonDetailQuery.Data.PokemonV2Pokemonspecy.PokemonV2Evolutionchain?
    func getPokemonBaseStats() -> [GetPokemonDetailQuery.Data.PokemonV2Pokemonspecy.PokemonV2Pokemon.PokemonV2Pokemonstat]?
    func getPokemonFirstType() -> String
    func getPokemonTypes() -> [GetPokemonDetailQuery.Data.PokemonV2Pokemonspecy.PokemonV2Pokemon.PokemonV2Pokemontype]?
    func getPokemonName() -> String
    func fetchPokemonData()
    func fetchPokemonBreeding()
}

protocol DetailInteractorOutputProtocol: AnyObject {
    // INTERACTOR -> PRESENTER
    func fetchSuccessPokemonTraining(evYield: String, catchRate: String, baseFriendship: String, baseExperience: String,growthRate: String)
    func fetchFailPokemonTraining()
    func pokemonFetchFail()
    func fetchSuccessPokemonLocation(pokemonLocations: [GetPokemonDetailQuery.Data.PokemonV2Pokemonspecy.PokemonV2Pokemondexnumber])
    func fetchFailPokemonLocation()
    func fetchSuccesPokemonBreeding(genderRate: Int,eggGroups: [GetPokemonDetailQuery.Data.PokemonV2Pokemonspecy.PokemonV2Pokemonegggroup], hatchCounter:Int )
    func fetchFailPokemonBreeding()
    func fetchSuccessPokemonData(pokemonData: GetPokemonDetailQuery.Data)
    func fetchSuccessPokemonDescription(description: String)
}

protocol DetailInteractorInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var pokemon: GetPokemonDetailQuery.Data? { get set }
    var presenter: DetailInteractorOutputProtocol? { get set }
    var localDatamanager: DetailLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: DetailRemoteDataManagerInputProtocol? { get set }
    func fetchPokemonTraining(pokemonId: Int)
    func getPokemonDetail(id: Int)
    func getPokemonChainEvolutions() -> GetPokemonDetailQuery.Data.PokemonV2Pokemonspecy.PokemonV2Evolutionchain?
    func getPokemonBaseStats() -> [GetPokemonDetailQuery.Data.PokemonV2Pokemonspecy.PokemonV2Pokemon.PokemonV2Pokemonstat]?
    func getPokemonFirstType() -> String
    func getPokemonTypes() -> [GetPokemonDetailQuery.Data.PokemonV2Pokemonspecy.PokemonV2Pokemon.PokemonV2Pokemontype]?
    func getPokemonName() -> String
    func fetchPokemonLocation(pokemonId: Int)
    func fetchPokemonData(pokemonId: Int)
    func fetchPokemonBreeding(pokemonId: Int)
    func interactorRequestPokemonDescription(pokemonId: Int)
}

protocol DetailDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> DATAMANAGER
}

protocol DetailRemoteDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: DetailRemoteDataManagerOutputProtocol? { get set }
    /// You will fetch all pokemon training by pokemon ID
    func fetchPokemonTraining(pokemonId: Int)
    func loadPokemonDetail(id: Int)
    func fetchPokemonLocation(pokemonId: Int)
    func fetchPokemonBreeding(pokemonId: Int)
    func fetchPokemonData(pokemonId: Int)
    func fetchPokemonDescription(pokemonId: Int)
}

protocol DetailRemoteDataManagerOutputProtocol: AnyObject {
    // REMOTEDATAMANAGER -> INTERACTOR
    /// Fetch was done successfully, ready to pass to the interactor
    /// - Parameter pokemonTraining: a list of all the pokemon training
    func fetchSuccessPokemonTraining(evYield: String, catchRate: String, baseFriendship: String, baseExperience: String,growthRate: String)
    /// Something wrong happened when retrieving the pokemon training
    func fetchFailPokemonTraining()
    func fetchSuccess(pokemon: GetPokemonDetailQuery.Data)
    func fetchFail()
    func fetchSuccessPokemonLocation(pokemonLocations: [GetPokemonDetailQuery.Data.PokemonV2Pokemonspecy.PokemonV2Pokemondexnumber])
    func fetchFailPokemonLocation()
    func fetchSuccessPokemonData(pokemonData: GetPokemonDetailQuery.Data)
    func fetchSuccesPokemonBreeding(genderRate: Int,eggGroups: [GetPokemonDetailQuery.Data.PokemonV2Pokemonspecy.PokemonV2Pokemonegggroup], hatchCounter:Int )
    func fetchFailPokemonBreeding()
    func getPokemonDescription(receivedData: [GetPokemonDetailQuery.Data.PokemonV2Pokemonspecy.PokemonV2Evolutionchain.PokemonV2Pokemonspecy.PokemonV2Pokemonspeciesflavortext])
}

protocol DetailLocalDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> LOCALDATAMANAGER
    func loadPokemonTypeDefenses() -> [TypeDefense]
}
