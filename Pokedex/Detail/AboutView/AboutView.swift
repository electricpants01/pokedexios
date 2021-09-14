//
//  About.swift
//  Pokedex
//
//  Created by Cristian Misael Almendro Lazarte on 17/5/21.
//

import UIKit

class AboutView: UIView {
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var evYieldLabel: UILabel!
    @IBOutlet weak var catchRateLabel: UILabel!
    @IBOutlet weak var baseFriendhipLabel: UILabel!
    @IBOutlet weak var baseExperienceLabel: UILabel!
    @IBOutlet weak var trainingLabel: UILabel!
    @IBOutlet weak var growthRateLabel: UILabel!
    @IBOutlet weak var locationStackView: UIStackView!
    @IBOutlet weak var locationTitleLabel: UILabel!
    @IBOutlet var genderMale: UILabel!
    @IBOutlet var genderFemale: UILabel!
    @IBOutlet var cycles: UILabel!
    @IBOutlet var eggGroups: UILabel!
    @IBOutlet var cyclesSteps: UILabel!
    @IBOutlet var breedingTitle: UILabel!
    @IBOutlet weak var speciesLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var abilityLabel: UILabel!
    @IBOutlet weak var hiddenAbilityLabel: UILabel!
    @IBOutlet weak var pokedexDataTitle: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pokemonDescription: UILabel!
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initSubviews()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubviews()
    }
    func initSubviews() {
        Bundle.main.loadNibNamed(Constants.DetailViewContent.aboutView, owner: self, options: nil)
        guard let content = contentView else { return }
        content.frame = self.bounds
        content.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        contentView.layer.cornerRadius = 30
        self.addSubview(content)
    }
    func showPokemonTraining(evYield: String, catchRate: String, baseFriendship: String, baseExperience: String, growthRate: String, trainingTextColor: String) {
        self.trainingLabel.textColor = UIColor(named: trainingTextColor)
        self.locationTitleLabel.textColor = UIColor(named: trainingTextColor)
        let formatEvYield = evYield.camelizedDash
        self.evYieldLabel.text = formatEvYield.camelized
        self.catchRateLabel.text = catchRate
        self.baseFriendhipLabel.text = baseFriendship
        self.baseExperienceLabel.text = baseExperience
        self.growthRateLabel.text = growthRate.camelizedDash
    }
    func showPokemonBreeding(genderRate: Int, eggGroups: [GetPokemonDetailQuery.Data.PokemonV2Pokemonspecy.PokemonV2Pokemonegggroup], hatchCounter: Int, titleColor: String) {
        let male = Double(genderRate)/8 * 100
        let female = 100 - male
        let leftSteps = hatchCounter * 255
        let rightSteps = hatchCounter * 257
       var egg = eggGroups[0].pokemonV2Egggroup?.name.capitalized ?? ""
        if eggGroups.count>1 {
            egg = "\(egg), \(eggGroups[1].pokemonV2Egggroup?.name ?? "")"
        }
        self.genderFemale.text = "♀\(female) %"
        self.genderMale.text = "♂\(male) %"
        self.eggGroups.text = egg
        self.cycles.text = "\(hatchCounter)"
        self.cyclesSteps.text = "(\(leftSteps) - \(rightSteps) steps)"
        self.genderFemale.textColor = UIColor(named: Constants.GenderColors.femaleColor)
        self.genderMale.textColor = UIColor(named: Constants.GenderColors.maleColor)
        self.eggGroups.textStyleSubtitle()
        self.cycles.textStyleSubtitle()
        self.cyclesSteps.textStyleSubtitle(size: 12)
        self.genderMale.font = UIFont(name: Constants.FontTypes.displayRegular, size: 16)
        self.breedingTitle.textColor = UIColor(named: titleColor)
    }
    func showPokemonLocation(pokemonLocations: [GetPokemonDetailQuery.Data.PokemonV2Pokemonspecy.PokemonV2Pokemondexnumber]) {
        let sizeLocation = pokemonLocations.count
        for index in 0..<sizeLocation {
            let locationID = pokemonLocations[index].pokedexNumber
            let locationDescription = pokemonLocations[index].pokemonV2Pokedex?.pokemonV2Pokedexdescriptions[0].description
            if let safeDescription = locationDescription {
                if !safeDescription.isEmpty {
                    self.addNewData(id: String(locationID), location: safeDescription)
                }
            }
        }
    }
    func addNewData(id: String, location: String) {
        // El eje Y siempre va ser el que cambia
        let newView = UIView()
        let idLabel = UILabel()
        let locationLabel = UILabel()
        locationStackView.addArrangedSubview(newView)
        newView.addSubview(idLabel)
        newView.addSubview(locationLabel)
        // adding constraints
        idLabel.translatesAutoresizingMaskIntoConstraints = false
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        var locationId = Helpers.getIdFormatted(id: id)
        locationId.removeFirst()
        idLabel.text = locationId
        idLabel.font = UIFont(name: Constants.Fonts.regular, size: 12)
        locationLabel.numberOfLines = 0
        locationLabel.font = UIFont(name: Constants.Fonts.regular, size: 16)
        locationLabel.textColor = UIColor(named: Constants.GenerationColors.textColor)
        locationLabel.text = "(\(location))"
        let idLabelTopConstraint = NSLayoutConstraint(item: idLabel, attribute: .top, relatedBy: .equal, toItem: newView, attribute: .top, multiplier: 1, constant: 2.5)
        newView.addConstraint(idLabelTopConstraint)
        locationConstraints(locationLabel: locationLabel, newView: newView)
    }
    func locationConstraints(locationLabel: UILabel, newView: UIView) {
        let leadingLocation = NSLayoutConstraint(item: locationLabel, attribute: .leading, relatedBy: .equal, toItem: newView, attribute: .leading, multiplier: 1, constant: 110)
        let topLocation = NSLayoutConstraint(item: locationLabel, attribute: .top, relatedBy: .equal, toItem: newView, attribute: .top, multiplier: 1, constant: 0)
        let trailingLocation = NSLayoutConstraint(item: locationLabel, attribute: .trailing, relatedBy: .equal, toItem: newView, attribute: .trailing, multiplier: 1, constant: 0)
        let bottomLocation = NSLayoutConstraint(item: locationLabel, attribute: .bottom, relatedBy: .equal, toItem: newView, attribute: .bottom, multiplier: 1, constant: 10)
        newView.addConstraint(leadingLocation)
        newView.addConstraint(topLocation)
        newView.addConstraint(trailingLocation)
        newView.addConstraint(bottomLocation)
    }
    func showPokemonDescription(description: String?)  {
        self.pokemonDescription.text = description
    }
}

extension UILabel {
    func textStyleSubtitle(color: UIColor = UIColor(named: Constants.GenerationColors.textColor)!, size: CGFloat = 16) {
        self.textColor = color
        self.font = UIFont(name: Constants.FontTypes.displayRegular, size: size)
    }
}
extension AboutView {
    func showPokemonData(pokemonData: GetPokemonDetailQuery.Data, textColor: String) {
        let data = pokemonData.pokemonV2Pokemonspecies[0].pokemonV2Pokemons[0]
        let height = data.height!
        let weight = data.weight!
        let species = pokemonData.pokemonV2Pokemonspecies[0].pokemonV2Pokemonspeciesnames[0].genus
        let abilities = data.pokemonV2Pokemonabilities
        print(textColor)
        self.pokedexDataTitle.textColor = UIColor(named: textColor)
        self.speciesLabel.font = UIFont(name: Constants.Fonts.regular, size: 16)
        self.heightLabel.font = UIFont(name: Constants.Fonts.regular, size: 16)
        self.weightLabel.font = UIFont(name: Constants.Fonts.regular, size: 16)
        self.abilityLabel.font = UIFont(name: Constants.Fonts.regular, size: 16)
        self.hiddenAbilityLabel.font = UIFont(name: Constants.Fonts.regular, size: 16)
        setHeight(heightData: height)
        setWeight(weightData: weight)
        setSpecies(speciesData: species)
        setAbilities(abilitiesData: abilities)
    }
    func setHeight(heightData: Int) {
        let floatHeight = Float(heightData) / 10
        let inchHeight = floatHeight * 39.37
        let height = "\(floatHeight)m (\(Int(inchHeight))\")"
        self.heightLabel.text = height
    }
    func setWeight(weightData: Int) {
        let lbsWeight = Float(weightData) * 2.205
        let weight = "\(weightData)Kg (\(Int(lbsWeight)) lbs)"
        self.weightLabel.text = weight
    }
    func setSpecies(speciesData: String) {
        self.speciesLabel.text = speciesData
    }
    func setAbilities(abilitiesData: [GetPokemonDetailQuery.Data.PokemonV2Pokemonspecy.PokemonV2Pokemon.PokemonV2Pokemonability]) {
        var abilities = ""
        var hiddenAbilities = ""
        var count = 1
        for ability in abilitiesData {
            if let abilityName = ability.pokemonV2Ability?.name.uppercasingFirst {
                if ability.isHidden {
                    let hiddenAbility = "\(abilityName) (hidden ability) "
                    if abilitiesData.count > 2 {
                        hiddenAbilities.append("\(hiddenAbility) \n")
                    } else {
                        hiddenAbilities.append(hiddenAbility)
                    }
                } else {
                    let abilityStr = "\(count). \(abilityName) "
                    count+=1
                    if abilitiesData.count > 2 {
                        abilities.append("\(abilityStr) \n")
                    } else {
                        abilities.append(abilityStr)
                    }
                }
            }
        }
        self.abilityLabel.text = abilities
        self.hiddenAbilityLabel.text = hiddenAbilities
    }
}
