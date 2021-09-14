//
//  SortMenuWireFrame.swift
//  Pokedex
//
//  Created by user on 5/3/21.
//

import Foundation
import UIKit

class SortMenuWireFrame: SortMenuWireFrameProtocol {
    class func createSortMenuModule() -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier: Constants.StoryBoard.MenuViewStoryBoardID)
        if let view = navController as? SortMenuViewController {
            let presenter: SortMenuPresenterProtocol & SortMenuInteractorOutputProtocol = SortMenuPresenter()
            let interactor: SortMenuInteractorInputProtocol & SortMenuRemoteDataManagerOutputProtocol = SortMenuInteractor()
            let remoteDataManager: SortMenuRemoteDataManagerInputProtocol = SortMenuRemoteDataManager()
            let wireFrame: SortMenuWireFrameProtocol = SortMenuWireFrame()
            view.presenter = presenter
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            interactor.presenter = presenter
            interactor.remoteDatamanager = remoteDataManager
            remoteDataManager.remoteRequestHandler = interactor
            return navController
        }
        return UIViewController()
    }
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: Constants.StoryBoard.MenuViewStoryBoardID, bundle: Bundle.main)
    }
}
