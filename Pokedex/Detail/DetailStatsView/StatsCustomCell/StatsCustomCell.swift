//
//  StatsCustomCell.swift
//  Pokedex
//
//  Created by Victor Arana on 5/19/21.
//

import UIKit

class StatsCustomCell: UICollectionViewCell {
    @IBOutlet var nameStat: UILabel!
    @IBOutlet var baseValue: UILabel!
    @IBOutlet var progressBar: UIProgressView!
    @IBOutlet var minValue: UILabel!
    @IBOutlet var maxValue: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configure(stat: Stat, typeName: String) {
        if stat.id < PokeStat.other.rawValue {
            nameStat.text = stat.name
            baseValue.text = stat.baseValue
            progressBar.isHidden = false
            progressBar.progress = Float(stat.baseValue)! / Float(stat.maxValue)!
            progressBar.progressTintColor = UIColor(named: typeName)
            progressBar.trackTintColor = UIColor.clear
            minValue.text = stat.minValue
            maxValue.text = stat.maxValue
        } else {
            nameStat.text = stat.name
            baseValue.text = stat.baseValue
            progressBar.isHidden = true
            baseValue.font = UIFont(name: Constants.Fonts.bold, size: 16)
            minValue.text = Constants.PokemonStats.minLevelLabel
            minValue.textColor = UIColor.black
            minValue.font = UIFont(name: Constants.Fonts.regular, size: 12)
            maxValue.text = Constants.PokemonStats.maxLevelLabel
            maxValue.textColor = UIColor.black
            maxValue.font = UIFont(name: Constants.Fonts.regular, size: 12)
        }
    }
}
