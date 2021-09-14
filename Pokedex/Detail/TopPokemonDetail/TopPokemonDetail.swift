//
//  TopPokemonDetail.swift
//  Pokemon Detail Gradient
//
//  Created by user on 5/13/21.
//

import UIKit

class TopPokemonDetail: UIView {
    @IBOutlet var contentView: UIView?
    @IBOutlet var pointsImage: UIImageView!
    @IBOutlet var pointsContainer: UIView!
    @IBOutlet var labelContainer: UIView!
    @IBOutlet var labelText: UILabel!
    @IBOutlet var circleContainer: UIView!
    @IBOutlet var circleImg: UIImageView!
    @IBOutlet var pokemonImage: UIImageView!
    var colorsP:UIColor!
    @IBOutlet var idPoke: UILabel!
    @IBOutlet var lowerNamePokemon: UILabel!
    @IBOutlet var labelTypePokemon: UILabel!
    @IBOutlet var labelSecondType: UILabel!
    @IBOutlet var imgType: UIImageView!
    @IBOutlet var imgSecondType: UIImageView!
    @IBOutlet var containerFirstType: UIStackView!
    @IBOutlet var containerSecondType: UIStackView!
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initSubviews()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubviews()
    }

    func initSubviews() {
        Bundle.main.loadNibNamed(Constants.TopPokemonDetail.nibName, owner: self, options: nil)
         guard let content = contentView else { return }
         content.frame = self.bounds
         content.autoresizingMask = [.flexibleHeight, .flexibleWidth]
         self.addSubview(content)
        self.idPoke.textColor = UIColor(named: Constants.PokemonColor.textColorId)
    }
    func applyColor(color:UIColor) {
        Helpers.createGradientImage(pointsContainer, pointsImage, color, color, 0.5, 0.8, CGPoint(x: 0, y: 0), CGPoint(x: 0, y: 1))
        Helpers.createGradientImage(circleContainer, circleImg, color, color, 0.3, 0.9, CGPoint(x: 1, y: 1), CGPoint(x: 0.5, y: 0.3))
        Helpers.createGradientText(labelContainer, labelText, UIColor.white, color, 0.3, 0.7, CGPoint(x: 0, y: 0), CGPoint(x: 0, y: 0.93))
    }
    func initTopPokemonDetail(name: String,  pokeID: String, urlImage: URL, types: [String]) {
        let colorString = "back-\(types[0])"
        self.labelText.text = name.uppercased()
        self.lowerNamePokemon.text = name.capitalized
        self.applyColor(color: UIColor(named: colorString)!)
        self.idPoke.text =  Helpers.getIdFormatted(id: pokeID)
        self.colorsP = UIColor(named: colorString)
        self.contentView?.backgroundColor = UIColor(named: colorString)
        self.pokemonImage.kf.setImage(with: urlImage)
        self.labelTypePokemon.text = types[0]
        if types.count>1 {
            self.labelSecondType.text = types[1]
            self.imgSecondType.image = UIImage(named: types[1])
            self.containerSecondType.customize(backgroundColor: UIColor(named: types[1])!, radiusSize: 5.0)
        }
        self.imgType.image = UIImage(named: types[0])
        self.containerFirstType.customize(backgroundColor: UIColor(named: types[0])!, radiusSize: 5.0)
    }

}
extension UIStackView {
    func customize(backgroundColor: UIColor = .clear, radiusSize: CGFloat = 0) {
        let subView = UIView(frame: bounds)
        subView.backgroundColor = backgroundColor
        subView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        insertSubview(subView, at: 0)

        subView.layer.cornerRadius = radiusSize
        subView.layer.masksToBounds = true
        subView.clipsToBounds = true
    }
}
