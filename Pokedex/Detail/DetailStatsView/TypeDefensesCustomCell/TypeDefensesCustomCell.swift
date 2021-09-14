//
//  TypeDefensesCustomCell.swift
//  Pokedex
//
//  Created by Victor Arana on 5/12/21.
//

import UIKit

class TypeDefensesCustomCell: UICollectionViewCell {
    @IBOutlet var imageBackgroundView: UIView!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var valueLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configure(_ name: String, _ damageRelation: String) {
        imageView.image = #imageLiteral(resourceName: name)
        imageView.tintColor = .white
        imageBackgroundView.layer.cornerRadius = 3
        imageBackgroundView.backgroundColor = UIColor(named: name)
        valueLabel.text = damageRelation
    }
}
