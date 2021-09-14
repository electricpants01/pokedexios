//
//  DetailView.swift
//  Pokedex
//
//  Created by Cristian Misael Almendro Lazarte on 22/4/21.
//  
//

import Foundation
import UIKit

class DetailView: UIViewController {
    // MARK: Properties
    var presenter: DetailPresenterProtocol?
    var pokemonTraining = [GetPokemonDetailQuery.Data.PokemonV2Pokemonspecy.PokemonV2Pokemon.PokemonV2Pokemonstat]()
    @IBOutlet weak var pokeballAbout: UIImageView!
    @IBOutlet weak var pokeballStats: UIImageView!
    @IBOutlet weak var pokeballEvolution: UIImageView!
    @IBOutlet weak var viewPokeballAbout: UIView!
    @IBOutlet weak var viewPokeballStats: UIView!
    @IBOutlet weak var viewPokeballEvolution: UIView!
    @IBOutlet weak var buttonAbout: UIButton!
    @IBOutlet weak var buttonStats: UIButton!
    @IBOutlet weak var buttonEvolution: UIButton!
    @IBOutlet weak var viewEvolution: DetailEvolutionsView!
    @IBOutlet weak var viewStats: DetailStatsView!
    @IBOutlet weak var viewAbout: AboutView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var viewForPokemonData: UIView!
    @IBOutlet var headerDetails: TopPokemonDetail!
    var headerViewTopContraint: NSLayoutConstraint?
    var pokemonType: String!
    // MARK: Lifecycle
    @IBOutlet var headerContainer: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        presenter?.fetchPokemonTraining()
        presenter?.fetchPokemonBreeding()
        presenter?.fetchPokemonLocation()
        presenter?.fetchPokemonData()
        resetButtons()
        loadHeaderDetail()
        showAboutViewFirst()

        viewAbout.scrollView.delegate = self
        viewStats.scrollView.delegate = self
        setUpHeaderView()
    }
    func setUpHeaderView() {
        headerContainer.translatesAutoresizingMaskIntoConstraints = false
        headerViewTopContraint = headerContainer.topAnchor.constraint(equalTo: view.topAnchor)
        NSLayoutConstraint.activate([
            headerViewTopContraint!
        ])
    }
    func loadHeaderDetail() {
        var types:[String] = []
        types.append((presenter?.pokemonType)!)
        let urlImage: URL = presenter!.imageUrl!
        if let safeColor = presenter?.pokemonType, let safeId = presenter?.pokemonId, let safeName = presenter?.getPokemonName() {
            self.headerDetails.initTopPokemonDetail(name: safeName, pokeID: "\(safeId)", urlImage: urlImage, types: types )
            headerContainer.backgroundColor = UIColor(named: "back-\(safeColor)")
        }
    }
    func resetButtons() {
        self.buttonAbout.alpha = 0.5
        self.buttonStats.alpha = 0.5
        self.buttonEvolution.alpha = 0.5
        Helpers.createGradientImage(self.viewPokeballAbout, pokeballAbout, #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), CGFloat(0.0), CGFloat(0.3), CGPoint(x: 1, y: 0), CGPoint(x: 0, y: 0))
        Helpers.createGradientImage(self.viewPokeballStats, pokeballStats, #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), CGFloat(0.0), CGFloat(0.3), CGPoint(x: 1, y: 0), CGPoint(x: 0, y: 0))
        Helpers.createGradientImage(self.viewPokeballEvolution, pokeballEvolution, #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), CGFloat(0.0), CGFloat(0.3), CGPoint(x: 1, y: 0), CGPoint(x: 0, y: 0))
        self.viewAbout.isHidden = true
        self.viewStats.isHidden = true
        self.viewEvolution.isHidden = true
        self.pokeballAbout.isHidden = true
        self.pokeballStats.isHidden = true
        self.pokeballEvolution.isHidden = true
    }
    @IBAction func goBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    func showAboutViewFirst() {
        self.resetButtons()
        self.buttonAbout.alpha = 1.0
        self.pokeballAbout.isHidden = false
        self.viewAbout.isHidden = false
        viewAbout.backgroundColor = UIColor(named: "back-\(presenter?.pokemonType ?? Constants.PokemonTypeDefenses.defaultTitleColort)")
    }
    @IBAction func showAbout(_ sender: UIButton) {
        showAboutViewFirst()
    }
    @IBAction func showStats(_ sender: UIButton) {
        self.resetButtons()
        self.buttonStats.alpha = 1.0
        self.pokeballStats.isHidden = false
        viewForPokemonData.isHidden = true
        viewEvolution.isHidden = true
        viewStats.isHidden = false
        let pokemonTypes = presenter?.getPokemonTypes()
        let stats = presenter?.getPokemonBaseStats()
        let pokemonType = presenter?.getPokemonFirstType()
        viewStats.backgroundColor = UIColor(named: "back-\(pokemonType ?? Constants.PokemonTypeDefenses.defaultTitleColort)")
        let pokemonName = presenter?.getPokemonName()
        viewStats.configureView(pokemonTypes: pokemonTypes, baseStats: stats,pokemonType: pokemonType!, name: pokemonName!)
    }
    @IBAction func showEvolution(_ sender: UIButton) {
        self.resetButtons()
        self.buttonEvolution.alpha = 1.0
        self.pokeballEvolution.isHidden = false
        self.viewEvolution.isHidden = false
        viewForPokemonData.isHidden = true
        viewStats.isHidden = true
        viewEvolution.isHidden = false
        let chainEvolutions = presenter?.getPokemonChainEvolutions()
        let pokemonType = presenter?.getPokemonFirstType()
        viewEvolution.backgroundColor = UIColor(named: "back-\(pokemonType ?? Constants.PokemonTypeDefenses.defaultTitleColort)")
        viewEvolution.configureView(chainEvolutions: chainEvolutions, pokemonType: pokemonType!)
    }
}

extension DetailView: DetailViewProtocol {
    func showPokemonData(pokemonData: GetPokemonDetailQuery.Data) {
        viewAbout.showPokemonData(pokemonData: pokemonData, textColor: presenter?.pokemonType ?? "black")
    }
    func showPokemonDescription(description: String) {
        self.viewAbout.showPokemonDescription(description: description)
    }
    func showPokemonLocation(pokemonLocations: [GetPokemonDetailQuery.Data.PokemonV2Pokemonspecy.PokemonV2Pokemondexnumber]) {
        self.viewAbout.showPokemonLocation(pokemonLocations: pokemonLocations)
    }
    func showFailPokemonLocation() {
        let alert = UIAlertController(title: "Pokemon Location Failed", message: "please, check your internet connection", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
    }
    func showPokemonTraining(evYield: String,
                             catchRate: String,
                             baseFriendship: String,
                             baseExperience: String,
                             growthRate: String) {
        self.viewAbout.showPokemonTraining(evYield: evYield,
                                           catchRate: catchRate,
                                           baseFriendship: baseFriendship,
                                           baseExperience: baseExperience,
                                           growthRate: growthRate,
                                           trainingTextColor: presenter?.pokemonType ?? "black")
    }
    func showFailPokemonTraining() {
        let alert = UIAlertController(title: "Pokemon Training Failed", message: "please, check your internet connection", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
    }
    func showFetchError() {
        print("ERROR FETCH")
    }
    func showPokemonBreeding(genderRate: Int, eggGroups: [GetPokemonDetailQuery.Data.PokemonV2Pokemonspecy.PokemonV2Pokemonegggroup], hatchCounter: Int) {
        self.viewAbout.showPokemonBreeding(genderRate: genderRate, eggGroups: eggGroups, hatchCounter: hatchCounter, titleColor: presenter?.pokemonType ?? "black")
    }
    func showFailPokemonBreeding() {
        print("ERROR FETCH")
    }
}

extension DetailView: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let constantY = scrollView.contentOffset.y
        let swipingDown = constantY <= 0
        let shouldSnap = constantY > 30
        let labelHeight = headerDetails.frame.height - 155
        UIView.animate(withDuration: 0.3) {
            self.headerDetails.alpha = swipingDown ? 1.0 : 0.0
        }
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.3, delay: 0, options: [], animations: {
            self.headerViewTopContraint?.constant = shouldSnap ? -labelHeight : 0
            self.view.layoutIfNeeded()
            self.contentView.layoutIfNeeded()
            self.headerContainer.layoutIfNeeded()
        })
    }
}
