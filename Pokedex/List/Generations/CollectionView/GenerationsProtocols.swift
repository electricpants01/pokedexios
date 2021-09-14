//
//  GenerationsProtocols.swift
//  Pokedex
//
//  Created by Cristian Misael Almendro Lazarte on 28/4/21.
//  
//

import Foundation
import UIKit

protocol GenerationsViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: GenerationsPresenterProtocol? { get set }
    var generations: [GetGenerationsQuery.Data.Generation] { get set }
    func presenterPushGenerationNames(generations: [GetGenerationsQuery.Data.Generation])
}

protocol GenerationsWireFrameProtocol: AnyObject {
    // PRESENTER -> WIREFRAME
    static func createGenerationsModule() -> UIViewController
}

protocol GenerationsPresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view: GenerationsViewProtocol? { get set }
    var interactor: GenerationsInteractorInputProtocol? { get set }
    var wireFrame: GenerationsWireFrameProtocol? { get set }
    func viewDidLoad()
    func imageByGenerationId(generationId: Int, pokemonType: PokemonTypes) -> String
}

protocol GenerationsInteractorOutputProtocol: AnyObject {
    // INTERACTOR -> PRESENTER
    func interactorPushDataPresenter(generations: [GetGenerationsQuery.Data.Generation])
}

protocol GenerationsInteractorInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter: GenerationsInteractorOutputProtocol? { get set }
    var localDatamanager: GenerationsLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: GenerationsRemoteDataManagerInputProtocol? { get set }
    func interactorRequestGenerationsNames()
}

protocol GenerationsDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> DATAMANAGER
}

protocol GenerationsRemoteDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: GenerationsRemoteDataManagerOutputProtocol? { get set }
    func externalRequestGenerationsNames()
}

protocol GenerationsRemoteDataManagerOutputProtocol: AnyObject {
    // REMOTEDATAMANAGER -> INTERACTOR
    func getGenerationNames(receivedData: [GetGenerationsQuery.Data.Generation])
}

protocol GenerationsLocalDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> LOCALDATAMANAGER
}
