//
//  ListView.swift
//  Pokedex
//
//  Created by Cristian Misael Almendro Lazarte on 22/4/21.
//
//

import Foundation
import UIKit
import PullUpController
import Apollo
import Kingfisher

protocol ListViewFiltersDelegate {
    func applyFilters(listViewFilter: ListViewFilter)
}
class ListView: UIViewController {
    // MARK: Properties
    var presenter: ListPresenterProtocol?
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var searchBar: UISearchBar!
    var data: [GraphQLSelectionSet] = []
    var filtersMenu: FiltersMenuView?
    var generationMenu: GenerationsView?
    var sortMenu: SortMenuViewController?
    var fetchMore = false
    var pokemonResultType = PokemonListResultType.normal
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.startfetchingPokemonList()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        setStyleSearchBar()
        self.filtersMenu = FiltersMenuWireFrame.createFiltersMenuModule() as? FiltersMenuView
        self.generationMenu = GenerationsWireFrame.createGenerationsModule() as? GenerationsView
        self.sortMenu = SortMenuWireFrame.createSortMenuModule() as? SortMenuViewController
        self.filtersMenu?.listView = self
        self.generationMenu?.listView = self
        self.sortMenu?.listView = self
        tableView.separatorStyle = .none
        register()
    }
    func register() {
        tableView.register(UINib(nibName: Constants.PokemonCell.cellIdentifier, bundle: nil), forCellReuseIdentifier: Constants.PokemonCell.cellIdentifier)
    }
    func setStyleSearchBar() {
        let placeholderColor: UIColor = UIColor.init(named: Constants.SearchbarColors.placeholderColor)!
        let background: UIColor = UIColor.init(named: Constants.SearchbarColors.backgroundColor)!
        let placeholderText: String = "What Pokémon are you looking for?"
        self.searchBar.backgroundColor = background
        self.searchBar.searchTextField.attributedPlaceholder = NSAttributedString(string: placeholderText, attributes: [NSAttributedString.Key.foregroundColor : placeholderColor])
        self.searchBar.setPositionAdjustment(UIOffset(horizontal: 12, vertical: 0), for: .search)
        self.searchBar.searchTextPositionAdjustment = UIOffset(horizontal: 12, vertical: 0)
        self.searchBar.setSearchFieldBackgroundImage(UIImage(), for: .normal)
        self.searchBar.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
        self.searchBar.layer.cornerRadius = 10
        self.searchBar.clipsToBounds = true
        self.searchBar.searchTextField.leftView?.tintColor = placeholderColor
    }
    @IBAction func onGenerationsButtonTapped(_ sender: Any) {
        addPullUpController(self.generationMenu!, initialStickyPointOffset: CGFloat(1000), animated: true)
    }
    @IBAction func sortMenu(_ sender: UIButton) {
        addPullUpController(self.sortMenu!, initialStickyPointOffset: CGFloat(1050), animated: true)
    }
    @IBAction func onFilterButtonTapped(_ sender: Any) {
        addPullUpController(self.filtersMenu!, initialStickyPointOffset: CGFloat(1000), animated: true)
    }
}

extension ListView: ListViewProtocol {
    func showPokemonList(list: [GraphQLSelectionSet], type: PokemonListResultType) {
        self.fetchMore = false
        switch type {
        case .normal:
            self.data = list as! [GetAllPokemonsWithLimitQuery.Data.Pokemon]
            pokemonResultType = PokemonListResultType.normal
        case .filter:
            self.data = list as! [GetPokemonsApplyingFiltersQuery.Data.Pokemon]
            pokemonResultType = PokemonListResultType.filter
        case .filterWithType:
            self.data = list as! [GetPokemonsApplyingFiltersWithTypeQuery.Data.Pokemon]
            pokemonResultType = PokemonListResultType.filterWithType
        }
        self.tableView.reloadData()
    }
    func showError() {
    }
    func dismissView(sortMenu:SortMethod) {
        self.view.backgroundColor = UIColor.white
    }
    func getCurrentSortMethod() -> SortMethod {
        return .smallestnumberfirst
    }
}
extension ListView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.PokemonCell.cellIdentifier, for: indexPath) as! CustomPokemonTableViewCell
        cell.selectionStyle = .none
        switch self.pokemonResultType {
        case .normal:
            let pokeee = data[indexPath.row] as! GetAllPokemonsWithLimitQuery.Data.Pokemon
            cell.pokemonImage.kf.setImage(with: pokeee.getImageUrl()) { _ in
                cell.setNeedsLayout()
            }
            cell.updateContent(pokemonId: String(pokeee.id), pokemonName: pokeee.name, types: pokeee.getTypesList())
        case .filter:
            let pokeee = data[indexPath.row] as! GetPokemonsApplyingFiltersQuery.Data.Pokemon
            cell.pokemonImage.kf.setImage(with: pokeee.getImageUrl()) { _ in
                cell.setNeedsLayout()
            }
            cell.updateContent(pokemonId: String(pokeee.id), pokemonName: pokeee.name, types: pokeee.getTypesList())
        case .filterWithType:
            let pokeee = data[indexPath.row] as! GetPokemonsApplyingFiltersWithTypeQuery.Data.Pokemon
            cell.pokemonImage.kf.setImage(with: pokeee.getImageUrl()) { _ in
                cell.setNeedsLayout()
            }
            cell.updateContent(pokemonId: String(pokeee.id), pokemonName: pokeee.name, types: pokeee.getTypesList())
        }
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        if offsetY > contentHeight - scrollView.frame.height {
            if !fetchMore {
                self.fetchMore = true
                self.presenter?.fetchMorePokemons()
            }
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetail", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let selectedPath = tableView.indexPathForSelectedRow else { return }
        if segue.destination is DetailView {
            if let safeDetailView = segue.destination as? DetailView {
                switch self.pokemonResultType {
                case .normal:
                    let pokeee = self.data[selectedPath.row] as! GetAllPokemonsWithLimitQuery.Data.Pokemon
                    presenter?.showDetailView(detailView: safeDetailView, pokemonId: pokeee.id, imageUrl: pokeee.getImageUrl()!, pokemonType: pokeee.types[0].pokemonV2Type!.name)
                case .filter:
                    let pokeee = self.data[selectedPath.row] as! GetPokemonsApplyingFiltersQuery.Data.Pokemon
                    presenter?.showDetailView(detailView: safeDetailView, pokemonId: pokeee.id, imageUrl: pokeee.getImageUrl()!, pokemonType: pokeee.types[0].pokemonV2Type!.name)
                case .filterWithType:
                    let pokeee = self.data[selectedPath.row] as! GetPokemonsApplyingFiltersWithTypeQuery.Data.Pokemon
                    presenter?.showDetailView(detailView: safeDetailView, pokemonId: pokeee.id, imageUrl: pokeee.getImageUrl()!, pokemonType: pokeee.types[0].pokemonV2Type!.name)
                }
            }
        }
    }
}

extension ListView: ListViewFiltersDelegate {
    func applyFilters(listViewFilter: ListViewFilter) {
        presenter?.fetchPokemonWithFilters(listViewFilter: listViewFilter)
    }
}

