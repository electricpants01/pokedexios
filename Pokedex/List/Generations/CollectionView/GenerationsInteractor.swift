//
//  GenerationsInteractor.swift
//  Pokedex
//
//  Created by Cristian Misael Almendro Lazarte on 28/4/21.
//  
//

import Foundation

class GenerationsInteractor: GenerationsInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: GenerationsInteractorOutputProtocol?
    var localDatamanager: GenerationsLocalDataManagerInputProtocol?
    var remoteDatamanager: GenerationsRemoteDataManagerInputProtocol?
    func interactorRequestGenerationsNames() {
        remoteDatamanager?.externalRequestGenerationsNames()
    }
}

extension GenerationsInteractor: GenerationsRemoteDataManagerOutputProtocol {
    func getGenerationNames(receivedData: [GetGenerationsQuery.Data.Generation]) {
        presenter?.interactorPushDataPresenter(generations: receivedData)
    }
}
