//
//  SortMenuProtocols.swift
//  Pokedex
//
//  Created by user on 5/3/21.
//

import Foundation
import UIKit

protocol SortMenuViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: SortMenuPresenterProtocol? { get set }
}

protocol SortMenuWireFrameProtocol: AnyObject {
    // PRESENTER -> WIREFRAME
    static func createSortMenuModule() -> UIViewController
}

protocol SortMenuPresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view: SortMenuViewProtocol? { get set }
    var interactor: SortMenuInteractorInputProtocol? { get set }
    var wireFrame: SortMenuWireFrameProtocol? { get set }
    func viewDidLoad()
    func applySort(sort: SortMethod) -> String
    func sendSelectedSort(type: SortMethod) -> String
}

protocol SortMenuInteractorOutputProtocol: AnyObject {
// INTERACTOR -> PRESENTER
}

protocol SortMenuInteractorInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter: SortMenuInteractorOutputProtocol? { get set }
    var localDatamanager: SortMenuLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: SortMenuRemoteDataManagerInputProtocol? { get set }
}

protocol SortMenuDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> DATAMANAGER
}

protocol SortMenuRemoteDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: SortMenuRemoteDataManagerOutputProtocol? { get set }
}

protocol SortMenuRemoteDataManagerOutputProtocol: AnyObject {
    // REMOTEDATAMANAGER -> INTERACTOR
}

protocol SortMenuLocalDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> LOCALDATAMANAGER
}
