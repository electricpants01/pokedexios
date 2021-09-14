//
//  PokemonTypeCollectionViewCell.swift
//  Pokedex
//
//  Created by Cristian Misael Almendro Lazarte on 14/5/21.
//

import UIKit

class PokemonTypeCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var typePokemonImage: UIImageView!
    @IBOutlet weak var damageLabel: UILabel!
    @IBOutlet weak var backgroundColorView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.configureView()
    }

    func buildCell(image: UIImage, damage: Double, backgroundColor: UIColor) {
        self.typePokemonImage.image = image
        self.damageLabel.text = String(damage)
        self.backgroundColorView.backgroundColor = backgroundColor
    }

    func configureView() {
        self.backgroundColorView.layer.cornerRadius = 3
    }
}
