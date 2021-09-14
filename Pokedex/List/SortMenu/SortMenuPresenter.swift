//
//  SortMenuPresenter.swift
//  Pokedex
//
//  Created by user on 5/3/21.
//

import Foundation

class SortMenuPresenter {
    weak var view: SortMenuViewProtocol?
    var interactor: SortMenuInteractorInputProtocol?
    var wireFrame: SortMenuWireFrameProtocol?
}

extension SortMenuPresenter: SortMenuPresenterProtocol {
    func viewDidLoad() {
    }
    func sendSelectedSort(type: SortMethod) -> String {
        switch type {
        case .smallestnumberfirst:
            return "asc"
        case .highestnumber:
            return "dsc"
        case .alphabeticallyAZ:
            return "az"
        case .alphabeticallyZA:
            return "za"
        }
    }
    func applySort(sort: SortMethod) -> String {
        return "\(sort.rawValue)"
    }
}

extension SortMenuPresenter: SortMenuInteractorOutputProtocol {
}
