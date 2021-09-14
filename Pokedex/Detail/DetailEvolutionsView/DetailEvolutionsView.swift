//
//  EvolutionsView.swift
//  Pokedex
//
//  Created by Victor Arana on 5/17/21.
//

import UIKit

class DetailEvolutionsView: UIView {
    @IBOutlet var contentView: UIView!
    @IBOutlet var title: UILabel!
    @IBOutlet var evolutionsCollectionView: UICollectionView!
    var pokemonChainEvolutions: [ChainEvolution] = []
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    private func commonInit() {
        Bundle.main.loadNibNamed(Constants.StoryBoard.evolutionsViewStoryBoardID, owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        contentView.layer.cornerRadius = 30
        self.evolutionsCollectionView.dataSource = self
        self.evolutionsCollectionView.delegate = self
        self.evolutionsCollectionView.showsVerticalScrollIndicator = false
        let nib = UINib(nibName: Constants.ChainEvolutionsCell.nibName, bundle: nil)
        evolutionsCollectionView.register(nib, forCellWithReuseIdentifier: Constants.ChainEvolutionsCell.reuseIdentifier)
        if let flowLayout = evolutionsCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = CGSize(width: 1, height: 1)
        }

    }
    func configureView(chainEvolutions: GetPokemonDetailQuery.Data.PokemonV2Pokemonspecy.PokemonV2Evolutionchain?, pokemonType: String) {
        title.textColor = UIColor(named: pokemonType)
        pokemonChainEvolutions = []
        buildPokemonChainEvolutions(chainEvolutions: chainEvolutions)
        evolutionsCollectionView.reloadData()
    }
    func buildPokemonChainEvolutions(chainEvolutions: GetPokemonDetailQuery.Data.PokemonV2Pokemonspecy.PokemonV2Evolutionchain?) {
        let typesNumber = chainEvolutions?.pokemonV2Pokemonspecies.count ?? 0
        if typesNumber < 2 {
            return
        }
        let firstPokemonId: Int = chainEvolutions!.pokemonV2Pokemonspecies[0].id
        let isSpecialChain = Constants.EvolutionChart.specialChainEvolution.firstIndex(of: firstPokemonId)
        for index in 0...(typesNumber - 2) {
            var chainEvolution: ChainEvolution
            if (isSpecialChain != nil) {
                chainEvolution = buildChainEvolution(chainEvolutions: chainEvolutions, indexCurrentPokemon: 0, indexEvolutedPokemon: index + 1)
            } else {
                chainEvolution = buildChainEvolution(chainEvolutions: chainEvolutions, indexCurrentPokemon: index, indexEvolutedPokemon: index + 1)
            }
            pokemonChainEvolutions.append(chainEvolution)
        }
    }
    func buildChainEvolution(chainEvolutions: GetPokemonDetailQuery.Data.PokemonV2Pokemonspecy.PokemonV2Evolutionchain?, indexCurrentPokemon: Int, indexEvolutedPokemon: Int) -> ChainEvolution {
        let currentPokemonSpecies = chainEvolutions!.pokemonV2Pokemonspecies[indexCurrentPokemon]
        let evolutedPokemonSpecies = chainEvolutions!.pokemonV2Pokemonspecies[indexEvolutedPokemon]
        let currentPokemon = PokemonChainEvolution(imageUrl: currentPokemonSpecies.getImageUrl(), id: Helpers.getIdFormatted(id: String(currentPokemonSpecies.id)),
            name: currentPokemonSpecies.name.uppercasingFirst)
        let evolutedPokemon = PokemonChainEvolution(imageUrl: evolutedPokemonSpecies.getImageUrl(), id: Helpers.getIdFormatted(id: String(evolutedPokemonSpecies.id)),
            name: evolutedPokemonSpecies.name.uppercasingFirst)
        let trigger = getPokemonEvolutionTrigger(chainEvolutions: chainEvolutions, indexEvoluted:  indexEvolutedPokemon)
        let chainEvolution = ChainEvolution(current: currentPokemon, evoluted: evolutedPokemon, trigger: trigger)
        return chainEvolution
    }
    func getPokemonEvolutionTrigger(chainEvolutions: GetPokemonDetailQuery.Data.PokemonV2Pokemonspecy.PokemonV2Evolutionchain?, indexEvoluted: Int) -> EvolutionTrigger {
        let evolutedPokemonSpecies = chainEvolutions!.pokemonV2Pokemonspecies[indexEvoluted]
        let lastPokemonEvolutionIndex = evolutedPokemonSpecies.pokemonV2Pokemonevolutions.count
        var evolutionTrigger: EvolutionTrigger
        if let triggerId = evolutedPokemonSpecies.pokemonV2Pokemonevolutions[lastPokemonEvolutionIndex - 1].pokemonV2Evolutiontrigger?.id {
            switch triggerId {
            case Trigger.levelUp.rawValue:
                if let minLevel = (evolutedPokemonSpecies.pokemonV2Pokemonevolutions[lastPokemonEvolutionIndex - 1].minLevel) {
                    evolutionTrigger = EvolutionTrigger(imagePath: Constants.EvolutionChart.defaultTriggerImage, description: "(\(Constants.EvolutionChart.levelLabel) \(minLevel))", trigger: Trigger.levelUp)
                } else {
                    let minHappiness = evolutedPokemonSpecies.pokemonV2Pokemonevolutions[lastPokemonEvolutionIndex - 1].minHappiness ?? 0
                    let minAffection = evolutedPokemonSpecies.pokemonV2Pokemonevolutions[lastPokemonEvolutionIndex - 1].minAffection ?? 0
                    let timeOfDay = evolutedPokemonSpecies.pokemonV2Pokemonevolutions[lastPokemonEvolutionIndex - 1].timeOfDay ?? ""
                    if minHappiness > 0 {
                        evolutionTrigger = EvolutionTrigger(imagePath: Constants.EvolutionChart.defaultTriggerImage,
                                            description: "(\(Constants.EvolutionChart.minHappiness) \(minHappiness))", trigger: Trigger.levelUp)
                        if minAffection > 0 {
                            evolutionTrigger.descriptionComplement = "(\(Constants.EvolutionChart.minAffection) \(minHappiness))"
                            if timeOfDay != "" {
                                evolutionTrigger.descriptionSecondComplement = "(\(Constants.EvolutionChart.timeOfDay) \(timeOfDay))"
                            }
                        } else {
                            if timeOfDay != "" {
                                evolutionTrigger.descriptionComplement = "(\(Constants.EvolutionChart.timeOfDay) \(timeOfDay))"
                            }
                        }
                    } else if minAffection > 0 {
                        evolutionTrigger = EvolutionTrigger(imagePath: Constants.EvolutionChart.defaultTriggerImage,
                                            description: "(\(Constants.EvolutionChart.minAffection) \(minAffection))", trigger: Trigger.levelUp)
                        if timeOfDay != "" {
                            evolutionTrigger.descriptionComplement = "(\(Constants.EvolutionChart.timeOfDay) \(timeOfDay))"
                        }
                    } else if timeOfDay != "" {
                        evolutionTrigger = EvolutionTrigger(imagePath: Constants.EvolutionChart.defaultTriggerImage,
                                            description: "(\(Constants.EvolutionChart.timeOfDay) \(timeOfDay))", trigger: Trigger.levelUp)
                    } else {
                        evolutionTrigger = EvolutionTrigger(imagePath: Constants.EvolutionChart.defaultTriggerImage, description: "\(Constants.EvolutionChart.noMinLevel)", trigger: Trigger.levelUp)
                    }
                }
            case Trigger.trade.rawValue:
                evolutionTrigger = EvolutionTrigger(imagePath: Constants.EvolutionChart.defaultTriggerImage, description: "\(Constants.EvolutionChart.trade)", trigger: Trigger.trade)
            case Trigger.useItem.rawValue:
                if let itemName = evolutedPokemonSpecies.pokemonV2Pokemonevolutions[lastPokemonEvolutionIndex - 1].pokemonV2Item?.name {
                    let itemImageUrl = "\(Constants.PokeApi.officialItemImageURL)\(itemName).png"
                    evolutionTrigger = EvolutionTrigger(imagePath: itemImageUrl, description: "(\(itemName.uppercasingFirst.replacingOccurrences(of: "-", with: " ")))", trigger: Trigger.useItem)
                } else {
                    evolutionTrigger = EvolutionTrigger(imagePath: Constants.EvolutionChart.defaultTriggerImage, description: "\(Constants.EvolutionChart.useItem)", trigger: Trigger.useItem)
                }
            case Trigger.shed.rawValue:
                evolutionTrigger = EvolutionTrigger(imagePath: Constants.EvolutionChart.defaultTriggerImage, description: "\(Constants.EvolutionChart.shed)", trigger: Trigger.shed)
            default:
                evolutionTrigger = EvolutionTrigger(imagePath: Constants.EvolutionChart.defaultTriggerImage, description: "\(Constants.EvolutionChart.other)", trigger: Trigger.other)
            }
        } else {
            evolutionTrigger =  EvolutionTrigger(imagePath: Constants.EvolutionChart.defaultTriggerImage, description: "\(Constants.EvolutionChart.other)", trigger: Trigger.levelUp)
        }
        return evolutionTrigger
    }
}

extension DetailEvolutionsView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if pokemonChainEvolutions.isEmpty {
            evolutionsCollectionView.setEmptyMessage(Constants.EvolutionChart.noEvolutionsFound)
        } else {
            evolutionsCollectionView.restore()
        }
        return pokemonChainEvolutions.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.ChainEvolutionsCell.reuseIdentifier, for: indexPath) as? ChainEvolutionCustomCell {
            let safeChainEvolution = pokemonChainEvolutions[indexPath.row]
            cell.configure(evolutionChain: safeChainEvolution)
            return cell
        }
        return UICollectionViewCell()
    }
}

extension DetailEvolutionsView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 334, height: 150)
    }
}
