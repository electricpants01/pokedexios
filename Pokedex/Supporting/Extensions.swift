//
//  Extensions.swift
//  Pokedex
//
//  Created by user on 4/30/21.
//

import Foundation
import Apollo
import Kingfisher

extension GetAllPokemonsWithLimitQuery.Data.Pokemon {
    func getImageUrl() -> URL? {
        let urlStr = "\(Constants.PokeApi.officialArtworkImageURL)\(self.id).png"
        let url = URL(string: urlStr)!
        return url
    }
    func getTypesList() -> [String] {
        var typeList: [String] = []
        for type in self.types {
            typeList.append(type.pokemonV2Type!.name)
        }
        return typeList
    }
}
extension GetPokemonsApplyingFiltersWithTypeQuery.Data.Pokemon {
    func getImageUrl() -> URL? {
        let urlStr = "\(Constants.PokeApi.officialArtworkImageURL)\(self.id).png"
        let url = URL(string: urlStr)!
        return url
    }
    func getTypesList() -> [String] {
        var typeList: [String] = []
        for type in self.types {
            typeList.append(type.pokemonV2Type!.name)
        }
        return typeList
    }
}
extension GetPokemonsApplyingFiltersQuery.Data.Pokemon {
    func getImageUrl() -> URL? {
        let urlStr = "\(Constants.PokeApi.officialArtworkImageURL)\(self.id).png"
        let url = URL(string: urlStr)!
        return url
    }
    func getTypesList() -> [String] {
        var typeList: [String] = []
        for type in self.types {
            typeList.append(type.pokemonV2Type!.name)
        }
        return typeList
    }
}
extension GetPokemonDetailQuery.Data.PokemonV2Pokemonspecy.PokemonV2Evolutionchain.PokemonV2Pokemonspecy {
    func getImageUrl() -> String {
        let urlStr = "\(Constants.PokeApi.officialArtworkImageURL)\(self.id).png"
        return urlStr
    }
}
extension String {
    /// will uppercase the frist letter of your string
    var uppercasingFirst: String {
        return prefix(1).uppercased() + dropFirst()
    }
    /// will lowercase the First letter of your string
    var lowercasingFirst: String {
        return prefix(1).lowercased() + dropFirst()
    }

    var camelized: String {
        guard !isEmpty else {
            return ""
        }

        let parts = self.components(separatedBy: " ")

        let first = String(describing: parts.first!).uppercasingFirst
        let rest = parts.dropFirst().map({String($0).uppercased()})

        return ([first] + rest).joined(separator: " ")
    }
    /// will Camelcase your string separated by dashes
    var camelizedDash: String {
        guard !isEmpty else {
            return ""
        }

        let parts = self.components(separatedBy: "-")

        let first = String(describing: parts.first!).uppercasingFirst
        let rest = parts.dropFirst().map({String($0).uppercasingFirst})

        return ([first] + rest).joined(separator: " ")
    }
}
extension UICollectionView {

    func setEmptyMessage(_ message: String) {
        let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
        messageLabel.text = message
        messageLabel.textColor = UIColor(named: Constants.PokemonTypeDefenses.defaultTitleColort)
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        messageLabel.font = UIFont(name: Constants.Fonts.bold, size: 16)
        messageLabel.sizeToFit()
        self.backgroundView = messageLabel
    }

    func restore() {
        self.backgroundView = nil
    }
}
