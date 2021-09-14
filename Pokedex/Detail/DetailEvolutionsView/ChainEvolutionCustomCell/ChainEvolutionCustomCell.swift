//
//  ChainEvolutionCustomCell.swift
//  Pokedex
//
//  Created by Victor Arana on 5/17/21.
//

import UIKit

class ChainEvolutionCustomCell: UICollectionViewCell {
    @IBOutlet var currentGradientView: UIView!
    @IBOutlet var currentImageView: UIImageView!
    @IBOutlet var currentPokemonImageView: UIImageView!
    @IBOutlet var currentPokemonNumberLabel: UILabel!
    @IBOutlet var currentPokemonNameLabel: UILabel!
    @IBOutlet var evolutedGradientView: UIView!
    @IBOutlet var evolutedImageView: UIImageView!
    @IBOutlet var evolutedPokemonImageView: UIImageView!
    @IBOutlet var evolutedPokemonNumberLabel: UILabel!
    @IBOutlet var evolutedPokemonNameLabel: UILabel!
    @IBOutlet var triggerLabelOne: UILabel!
    @IBOutlet var triggerLabelTwo: UILabel!
    @IBOutlet var triggerLabelThree: UILabel!
    @IBOutlet var triggerImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configure(evolutionChain: ChainEvolution) {
        Helpers.createGradientImage(currentGradientView, currentImageView, UIColor(named: Constants.PokemonColor.backgroundEvolution)!, UIColor.white, 1, 0.9, CGPoint(x: 1, y: 0), CGPoint(x: 1, y: 2))
        currentPokemonImageView.kf.setImage(with: URL(string: evolutionChain.currentPokemon.imageUrl))
        currentPokemonNumberLabel.text = evolutionChain.currentPokemon.id
        currentPokemonNameLabel.text = evolutionChain.currentPokemon.name
        Helpers.createGradientImage(evolutedGradientView, evolutedImageView, UIColor(named: Constants.PokemonColor.backgroundEvolution)!, UIColor.white, 1, 0.9, CGPoint(x: 1, y: 0), CGPoint(x: 1, y: 2))
        evolutedPokemonImageView.kf.setImage(with: URL(string: evolutionChain.evolutedPokemon.imageUrl))
        evolutedPokemonNumberLabel.text = evolutionChain.evolutedPokemon.id
        evolutedPokemonNameLabel.text = evolutionChain.evolutedPokemon.name
        triggerLabelOne.text = evolutionChain.evolutionTrigger.description
        triggerLabelTwo.text = evolutionChain.evolutionTrigger.descriptionComplement
        triggerLabelThree.text = evolutionChain.evolutionTrigger.descriptionSecondComplement
        if evolutionChain.evolutionTrigger.trigger == Trigger.useItem {
            triggerImage.kf.setImage(with: URL(string: evolutionChain.evolutionTrigger.imagePath))
        } else {
            triggerImage.image = UIImage(systemName: "")
        }
    }

}
