//
//  SortMenuInteractor.swift
//  Pokedex
//
//  Created by user on 5/3/21.
//

import Foundation

class SortMenuInteractor: SortMenuInteractorInputProtocol {
    var presenter: SortMenuInteractorOutputProtocol?
    var localDatamanager: SortMenuLocalDataManagerInputProtocol?
    var remoteDatamanager: SortMenuRemoteDataManagerInputProtocol?
    func applySort(sort: String) {}
}
extension SortMenuInteractor: SortMenuRemoteDataManagerOutputProtocol {
}
