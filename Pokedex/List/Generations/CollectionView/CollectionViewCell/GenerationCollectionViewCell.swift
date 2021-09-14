//
//  GenerationCollectionViewCell.swift
//  Pokedex
//
//  Created by Cristian Misael Almendro Lazarte on 29/4/21.
//

import UIKit

class GenerationCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var labelGeneration: UILabel!
    @IBOutlet weak var imageDots: UIImageView!
    @IBOutlet weak var viewImageDots: UIView!
    @IBOutlet weak var imagePokeball: UIImageView!
    @IBOutlet weak var viewImagePokeball: UIView!
    @IBOutlet weak var imageFirstPokemon: UIImageView!
    @IBOutlet weak var imageSecondPokemon: UIImageView!
    @IBOutlet weak var imageThirdPokemon: UIImageView!

    override class func awakeFromNib() {
        super.awakeFromNib()
    }

    func setlabel(name: String?) {
        if  var safeName = name {
            safeName = safeName.replacingOccurrences(of: "-", with: " ")
            labelGeneration.text = safeName.camelized
        }
    }

    func setImages(firstImage: UIImage,secondImage: UIImage,thirdImage: UIImage) {
        self.imageFirstPokemon.image = firstImage
        self.imageSecondPokemon.image = secondImage
        self.imageThirdPokemon.image = thirdImage
    }

    func setSelectedCell(isSelected: Bool) {
        let dotsImageStartColor = UIColor(named: Constants.GenerationColors.dotsImageStartColor)!
        let dotsImageEndColor = UIColor(named: Constants.GenerationColors.dotsImageEndColor)!
        let pokeballImageStartColor = UIColor(named: Constants.GenerationColors.pokeballImageStartColor)!
        let pokeballImageEndColor = UIColor(named: Constants.GenerationColors.pokeballImageEndColor)!
        if isSelected {
            self.contentView.backgroundColor = UIColor(named: Constants.GenerationColors.backgroundSelected)
            self.labelGeneration.textColor = .white
            Helpers.createGradientImage(viewImageDots, imageDots, dotsImageStartColor, dotsImageEndColor,1, 0,CGPoint(x: 0.0, y: 0.0),CGPoint(x: 1.0,y: 0))
            Helpers.createGradientImage(viewImagePokeball, imagePokeball, pokeballImageStartColor, pokeballImageEndColor,0.1, 0,CGPoint(x: 0.0, y: 0.0),CGPoint(x: 0.0,y: 1.0))
        } else {
            self.contentView.backgroundColor = UIColor(named: Constants.GenerationColors.background)
            self.labelGeneration.textColor = UIColor(named: Constants.GenerationColors.textColor)
            Helpers.createGradientImage(viewImageDots, imageDots, dotsImageStartColor, dotsImageEndColor,1, 0,CGPoint(x: 0.0, y: 0.0),CGPoint(x: 1.0,y: 0))
            Helpers.createGradientImage(viewImagePokeball, imagePokeball, pokeballImageStartColor, pokeballImageEndColor,0.1, 0,CGPoint(x: 0.0, y: 0.0),CGPoint(x: 0.0,y: 1.0))
            self.labelGeneration.textColor = UIColor(named: Constants.GenerationColors.textColor)
        }
        self.contentView.layer.cornerRadius = 10
    }

}
