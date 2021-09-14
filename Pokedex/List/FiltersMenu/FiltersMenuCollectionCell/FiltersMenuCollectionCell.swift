//
//  FilterMenuTypeCell.swift
//  Pokedex
//
//  Created by Victor Arana on 4/28/21.
//

import UIKit

class FiltersMenuCollectionCell: UICollectionViewCell {
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var imageViewBackground: UIImageView!
    var name: String = ""
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    func configure(_ name: String) {
        self.name = name
        imageView.image = #imageLiteral(resourceName: name)
        imageView.tintColor = UIColor(named: name)
        imageViewBackground.tintColor = .white
    }
    func invertColours() {
        if isSelected {
            imageView.tintColor = .white
            imageViewBackground.tintColor = UIColor(named: name)
        } else {
            imageView.tintColor = UIColor(named: name)
            imageViewBackground.tintColor = .white
        }
    }
    override var isSelected: Bool {
        didSet {
            invertColours()
        }
    }
}
