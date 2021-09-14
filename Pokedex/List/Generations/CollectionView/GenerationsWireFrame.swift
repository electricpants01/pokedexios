//
//  GenerationsWireFrame.swift
//  Pokedex
//
//  Created by Cristian Misael Almendro Lazarte on 28/4/21.
//  
//

import Foundation
import UIKit

class GenerationsWireFrame: GenerationsWireFrameProtocol {

    class func createGenerationsModule() -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier: Constants.StoryBoard.generationsViewStoryBoardID)
        if let view = navController as? GenerationsView {
            let presenter: GenerationsPresenterProtocol & GenerationsInteractorOutputProtocol = GenerationsPresenter()
            let interactor: GenerationsInteractorInputProtocol & GenerationsRemoteDataManagerOutputProtocol = GenerationsInteractor()
            let localDataManager: GenerationsLocalDataManagerInputProtocol = GenerationsLocalDataManager()
            let remoteDataManager: GenerationsRemoteDataManagerInputProtocol = GenerationsRemoteDataManager()
            let wireFrame: GenerationsWireFrameProtocol = GenerationsWireFrame()
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
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: Constants.StoryBoard.generationsViewStoryBoardID, bundle: Bundle.main)
    }
}
