//
//  FiltersMenuWireFrame.swift
//  Pokedex
//
//  Created by Victor Arana on 4/29/21.
//  
//

import Foundation
import UIKit

class FiltersMenuWireFrame: FiltersMenuWireFrameProtocol {

    class func createFiltersMenuModule() -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier: Constants.StoryBoard.filtersViewStoryBoardID)
        if let view = navController as? FiltersMenuView {
            let presenter: FiltersMenuPresenterProtocol & FiltersMenuInteractorOutputProtocol = FiltersMenuPresenter()
            let localDataManager: FiltersMenuLocalDataManagerInputProtocol = FiltersMenuLocalDataManager()
            let interactor: FiltersMenuInteractorInputProtocol & FiltersMenuRemoteDataManagerOutputProtocol = FiltersMenuInteractor()
            let remoteDataManager: FiltersMenuRemoteDataManagerInputProtocol = FiltersMenuRemoteDataManager()
            let wireFrame: FiltersMenuWireFrameProtocol = FiltersMenuWireFrame()
            view.presenter = presenter
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            interactor.presenter = presenter
            interactor.localDatamanager = localDataManager
            interactor.remoteDatamanager = remoteDataManager
            remoteDataManager.remoteRequestHandler = interactor
            interactor.loadPokemonFiltersList()
            return navController
        }
        return UIViewController()
    }
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: Constants.StoryBoard.filtersViewStoryBoardID, bundle: Bundle.main)
    }
}
