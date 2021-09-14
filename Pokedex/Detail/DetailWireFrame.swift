//
//  DetailWireFrame.swift
//  Pokedex
//
//  Created by Cristian Misael Almendro Lazarte on 22/4/21.
//  
//

import Foundation
import UIKit

class DetailWireFrame: DetailWireFrameProtocol {
    class func createDetailModule(detailview: DetailView, pokemonId: Int, imageUrl: URL, pokemonType: String) {
        let interactor: DetailInteractorInputProtocol & DetailRemoteDataManagerOutputProtocol = DetailInteractor()
        let localDataManager: DetailLocalDataManagerInputProtocol = DetailLocalDataManager()
        let remoteDataManager: DetailRemoteDataManagerInputProtocol = DetailRemoteDataManager()
        interactor.remoteDatamanager = remoteDataManager
        interactor.getPokemonDetail(id: pokemonId)
        let wireFrame: DetailWireFrameProtocol = DetailWireFrame()
        let presenter: DetailPresenterProtocol & DetailInteractorOutputProtocol = DetailPresenter()
        detailview.presenter = presenter
        presenter.view = detailview
        presenter.wireFrame = wireFrame
        presenter.interactor = interactor
        presenter.pokemonId = pokemonId
        presenter.imageUrl = imageUrl
        presenter.pokemonType = pokemonType
        interactor.presenter = presenter
        interactor.localDatamanager = localDataManager
        remoteDataManager.remoteRequestHandler = interactor
    }
    static var detailStoryboard: UIStoryboard {
        return UIStoryboard(name: Constants.StoryBoard.detailViewStoryBoardID, bundle: Bundle.main)
    }
}
