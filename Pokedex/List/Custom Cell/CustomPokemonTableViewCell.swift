// created by: Christian Torrico Avila

import UIKit

class CustomPokemonTableViewCell: UITableViewCell {

    @IBOutlet weak var patterBackground: UIImageView!
    @IBOutlet weak var patternPoints: UIImageView!
    @IBOutlet weak var idPokemon: UILabel!
    @IBOutlet weak var namePokemon: UILabel!
    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var backgroundType1: UIImageView!
    @IBOutlet weak var typeImage1: UIImageView!
    @IBOutlet weak var pokemonType1: UILabel!
    @IBOutlet weak var backgroundType2: UIImageView!
    @IBOutlet weak var typeImage2: UIImageView!
    @IBOutlet weak var gradientView: UIView!
    @IBOutlet weak var pokemonType2: UILabel!
    @IBOutlet weak var widthType2: NSLayoutConstraint!
    @IBOutlet weak var widthType1: NSLayoutConstraint!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.idPokemon.textColor = UIColor(named: Constants.PokemonColor.textColorId)
        namePokemon.textColor = UIColor(named: Constants.PokemonColor.backgroundPattern)
        self.patterBackground.tintColor = UIColor(named: Constants.PokemonColor.backgroundPattern)
        self.patternPoints.tintColor = UIColor(named: Constants.PokemonColor.backgroundPattern)
        cellView.layer.cornerRadius = 10
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func updateContent(pokemonId: String, pokemonName: String, types: [String]) {
        self.idPokemon.text = Helpers.getIdFormatted(id: pokemonId)
        self.namePokemon.text = pokemonName.uppercasingFirst
        updateTypeContent(types: types)
        changeBackground(pokemonType: types[0])
        let endColor = UIColor(named: "back-\(types[0])")
        Helpers.createGradientImage(gradientView, patternPoints, UIColor.white, endColor ?? UIColor.white, 1, 0.2, CGPoint(x: 0, y: 0), CGPoint(x: 0, y: 1))
    }
    func changeBackground(pokemonType: String) {
        self.cellView.backgroundColor = UIColor(named: "back-\(pokemonType)")
    }
    func updateTypeContent(types: [String]) {
        backgroundType1.backgroundColor = UIColor(named: types[0])
        backgroundType1.layer.cornerRadius = 7
        typeImage1.image = UIImage(named: types[0])
        pokemonType1.text = types[0].uppercasingFirst
        pokemonType1.sizeToFit()
        widthType1.constant = pokemonType1.frame.width + 30
        if types.count > 1 {
            backgroundType2.isHidden = false
            typeImage2.isHidden = false
            pokemonType2.isHidden = false
            pokemonType2.isHidden = false
            backgroundType2.backgroundColor = UIColor(named: types[1])
            backgroundType2.layer.cornerRadius = 7
            typeImage2.image = UIImage(named: types[1])
            pokemonType2.text = types[1].uppercasingFirst
            pokemonType2.sizeToFit()
            widthType2.constant = pokemonType2.frame.width + 30
        } else {
            backgroundType2.isHidden = true
            typeImage2.isHidden = true
            pokemonType2.isHidden = true
            pokemonType2.isHidden = true
        }
    }
}
