//
//  StatsView.swift
//  Pokedex
//
//  Created by Victor Arana on 5/17/21.
//

import UIKit

class DetailStatsView: UIView {
    @IBOutlet var contentView: UIView!
    @IBOutlet var baseStatsTitle: UILabel!
    @IBOutlet var typeDefenseTitle: UILabel!
    @IBOutlet var typeDefensesSubTitle: UILabel!
    @IBOutlet var baseStatsCollectionView: UICollectionView!
    @IBOutlet var typeDefensesCollectionView: UICollectionView!
    @IBOutlet weak var scrollView: UIScrollView!
    var pokemonTypeDefenses: [TypeDefense] = zip(Constants.PokemonTypeDefenses.typeNames, Constants.PokemonTypeDefenses.typeIds).map { TypeDefense($0, $1)}
    var pokemonBaseStats: [Stat] = []
    var pokemonTypeColor = Constants.PokemonTypeDefenses.defaultPokemonName
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    private func commonInit() {
        Bundle.main.loadNibNamed(Constants.StoryBoard.statsViewStoryBoardID, owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        contentView.layer.cornerRadius = 30
        self.typeDefensesCollectionView.dataSource = self
        self.typeDefensesCollectionView.delegate = self
        let nib = UINib(nibName: Constants.TypeDefensesCell.nibName, bundle: nil)
        typeDefensesCollectionView.register(nib, forCellWithReuseIdentifier: Constants.TypeDefensesCell.reuseIdentifier)
        if let flowLayout = typeDefensesCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = CGSize(width: 1, height: 1)
        }
        self.baseStatsCollectionView.dataSource = self
        self.baseStatsCollectionView.delegate = self
        let nib2 = UINib(nibName: Constants.BaseStatsCell.nibName, bundle: nil)
        baseStatsCollectionView.register(nib2, forCellWithReuseIdentifier: Constants.BaseStatsCell.reuseIdentifier)
        if let flowLayout = baseStatsCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = CGSize(width: 1, height: 1)
        }
    }
    func configureView(pokemonTypes: [GetPokemonDetailQuery.Data.PokemonV2Pokemonspecy.PokemonV2Pokemon.PokemonV2Pokemontype]?,
                       baseStats: [GetPokemonDetailQuery.Data.PokemonV2Pokemonspecy.PokemonV2Pokemon.PokemonV2Pokemonstat]?,
                       pokemonType: String, name: String) {
        pokemonTypeColor = pokemonType
        baseStatsTitle.textColor = UIColor(named: pokemonType)
        typeDefenseTitle.textColor = UIColor(named: pokemonType)
        typeDefensesSubTitle.text = "\(Constants.PokemonTypeDefenses.subTitle) \(name.uppercasingFirst)."
        pokemonTypeDefenses = zip(Constants.PokemonTypeDefenses.typeNames, Constants.PokemonTypeDefenses.typeIds).map { TypeDefense($0, $1)}
        pokemonBaseStats = []
        buildPokemonStats(baseStats: baseStats)
        calculatePokemonTypeDefenses(pokemonTypes: pokemonTypes)
        baseStatsCollectionView.reloadData()
        typeDefensesCollectionView.reloadData()
    }
    func buildPokemonStats(baseStats: [GetPokemonDetailQuery.Data.PokemonV2Pokemonspecy.PokemonV2Pokemon.PokemonV2Pokemonstat]?) {
        let statsNumber = baseStats?.count ?? 0
        if statsNumber < 1 {
            return
        }
        var totalStatValue = 0
        for index in 0...(statsNumber - 1) {
            let baseStat = baseStats![index]
            pokemonBaseStats.append(Stat(baseStat.statId!, baseStat.baseStat, Constants.PokemonStats.names[index]))
            totalStatValue += baseStat.baseStat
        }
        pokemonBaseStats.append(Stat(7, totalStatValue, Constants.PokemonStats.names[6]))
    }
    func calculatePokemonTypeDefenses(pokemonTypes: [GetPokemonDetailQuery.Data.PokemonV2Pokemonspecy.PokemonV2Pokemon.PokemonV2Pokemontype]?) {
        let typesNumber = pokemonTypes?.count ?? 0
        if typesNumber < 1 {
            return
        }
        for index in 0...(typesNumber - 1) {
            applyDamageRelation(pokemonTypeId: pokemonTypes![index].typeId!)
        }
    }
    func applyDamageRelation(pokemonTypeId: Int) {
        for index in 0...(Constants.PokemonTypeDefenses.typeNames.count - 1) {
            let damageRelation = getDamageRelation(attackerPokemonTypeId: pokemonTypeDefenses[index].id, receiverPokemonTypeId: pokemonTypeId)
            switch damageRelation {
            case Constants.Damage.double:
                pokemonTypeDefenses[index].applyDoubleDamage()
            case Constants.Damage.half:
                pokemonTypeDefenses[index].applyHalfDamage()
            case Constants.Damage.normal:
                pokemonTypeDefenses[index].applyNormalDamage()
            case Constants.Damage.non:
                pokemonTypeDefenses[index].applyNoDamage()
            }
        }
    }
    func getDamageRelation(attackerPokemonTypeId: Int, receiverPokemonTypeId: Int) -> Constants.Damage {
        return Constants.PokemonTypeDefenses.damageRelations[receiverPokemonTypeId - 1][attackerPokemonTypeId - 1]
    }
}

extension DetailStatsView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.typeDefensesCollectionView {
            return pokemonTypeDefenses.count
        } else {
            if pokemonBaseStats.isEmpty {
                baseStatsCollectionView.setEmptyMessage(Constants.PokemonStats.noStatsFound)
            } else {
                baseStatsCollectionView.restore()
            }
            return pokemonBaseStats.count
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.typeDefensesCollectionView {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.TypeDefensesCell.reuseIdentifier, for: indexPath) as? TypeDefensesCustomCell {
                let pokemonTypeDefense = pokemonTypeDefenses[indexPath.row]
                var damageRelation: String
                switch pokemonTypeDefense.damageRelation {
                case 0.25:
                    damageRelation = Constants.PokemonTypeDefenses.labels[0]
                case 0.50:
                    damageRelation = Constants.PokemonTypeDefenses.labels[1]
                case 0.0:
                    damageRelation = Constants.PokemonTypeDefenses.labels[2]
                case 1.0:
                    damageRelation = Constants.PokemonTypeDefenses.labels[3]
                case 2.0:
                    damageRelation = Constants.PokemonTypeDefenses.labels[4]
                case 4.0:
                    damageRelation = Constants.PokemonTypeDefenses.labels[5]
                default:
                    damageRelation = Constants.PokemonTypeDefenses.labels[3]
                }
                cell.configure(pokemonTypeDefense.name, damageRelation)
                return cell
            }
            return UICollectionViewCell()
        } else {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.BaseStatsCell.reuseIdentifier, for: indexPath) as? StatsCustomCell {
                let stat = pokemonBaseStats[indexPath.row]
                cell.configure(stat: stat, typeName: pokemonTypeColor)
                return cell
            }
            return UICollectionViewCell()
        }
    }
}

extension DetailStatsView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.typeDefensesCollectionView {
            return CGSize(width: 25, height: 60)
        } else {
            return CGSize(width: 334, height: 25)
        }
    }
}
