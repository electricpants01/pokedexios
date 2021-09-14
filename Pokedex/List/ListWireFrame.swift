//
//  ListWireFrame.swift
//  Pokedex
//
//  Created by Cristian Misael Almendro Lazarte on 22/4/21.
//  
//

import Foundation
import UIKit
import PullUpController

class ListWireFrame: ListWireFrameProtocol {

    class func createListModule() -> UIViewController {
        let navController = listStoryboard.instantiateViewController(withIdentifier: Constants.StoryBoard.listViewStoryBoardID)
        if let view = navController as? ListView {
            let presenter: ListPresenterProtocol & ListInteractorOutputProtocol = ListPresenter()
            let interactor: ListInteractorInputProtocol & ListRemoteDataManagerOutputProtocol = ListInteractor()
            let localDataManager: ListLocalDataManagerInputProtocol = ListLocalDataManager()
            let remoteDataManager: ListRemoteDataManagerInputProtocol = ListRemoteDataManager()
            let wireFrame: ListWireFrameProtocol = ListWireFrame()
            view.presenter = presenter
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            interactor.presenter = presenter
            interactor.localDatamanager = localDataManager
            interactor.remoteDatamanager = remoteDataManager
            remoteDataManager.remoteRequestHandler = interactor
            return navController
        }
        return UIViewController()
    }
    static var listStoryboard: UIStoryboard {
        return UIStoryboard(name: Constants.StoryBoard.listViewStoryBoardID, bundle: Bundle.main)
    }
    func presentViewDetail(from view: ListViewProtocol,to detailView: DetailView, pokemonId: Int, imageUrl: URL, pokemonType: String) {
         DetailWireFrame.createDetailModule(detailview: detailView, pokemonId: pokemonId, imageUrl: imageUrl, pokemonType: pokemonType)
    }
}
