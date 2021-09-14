//
//  FiltersMenuView.swift
//  Pokedex
//
//  Created by Victor Arana on 4/29/21.
//  
//

import Foundation
import UIKit
import PullUpController
import RangeSeekSlider

class FiltersMenuView: PullUpController {

    // MARK: Properties
    var presenter: FiltersMenuPresenterProtocol?
    @IBOutlet var scrollItem: UIButton!
    @IBOutlet var filterView: UIView!
    @IBOutlet var typeCollection: UICollectionView!
    @IBOutlet var weaknessCollection: UICollectionView!
    @IBOutlet var heightFilterCollection: UICollectionView!
    @IBOutlet var weightFilterCollection: UICollectionView!
    @IBOutlet var resetButton: UIButton!
    @IBOutlet var applyButton: UIButton!
    @IBOutlet weak var numberRangeSlider: RangeSeekSlider!
    var listView: ListViewFiltersDelegate?
    var listViewFilter = ListViewFilter()
    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupElementBorderRadius()
        setupFilterCollection(collectionViewFilter: typeCollection)
        setupFilterCollection(collectionViewFilter: weaknessCollection)
        setupFilterCollection(collectionViewFilter: heightFilterCollection)
        setupFilterCollection(collectionViewFilter: weightFilterCollection)
        setupNumberRange()
    }
    func setupElementBorderRadius() {
        self.view.layer.cornerRadius = 30
        filterView.layer.cornerRadius = 30
        resetButton.layer.cornerRadius = 10
        applyButton.layer.cornerRadius = 10
        scrollItem.layer.cornerRadius = 2.5
    }
    func setupNumberRange() {
        numberRangeSlider.minValue = 1
        numberRangeSlider.maxValue = 1118
        numberRangeSlider.selectedMinValue = 1
        numberRangeSlider.selectedMaxValue = 1118
    }
    func setupFilterCollection(collectionViewFilter: UICollectionView) {
        collectionViewFilter.dataSource = self
        collectionViewFilter.delegate = self
        collectionViewFilter.showsHorizontalScrollIndicator = false
        registerNib(collectionViewFilter: collectionViewFilter)
    }
    func registerNib(collectionViewFilter: UICollectionView) {
        let nib = UINib(nibName: Constants.FiltersMenuCell.nibName, bundle: nil)
        collectionViewFilter.register(nib, forCellWithReuseIdentifier: Constants.FiltersMenuCell.reuseIdentifier)
        if let flowLayout = collectionViewFilter.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = CGSize(width: 1, height: 1)
        }
    }
    override var pullUpControllerMiddleStickyPoints: [CGFloat] {
        return [600, 1000, 1440]
    }
    override func pullUpControllerDidDrag(to point: CGFloat) {
        if point == pullUpControllerMiddleStickyPoints[0] || point < pullUpControllerMiddleStickyPoints[0] {
            self.dismiss(animated: false, completion: nil)
            self.view = nil
        }
    }
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        resetFields()
    }
    @IBAction func applyButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: false, completion: nil)
        self.view = nil
        self.listViewFilter.minPokemonId = Int(numberRangeSlider.selectedMinValue)
        self.listViewFilter.maxPokemonId = Int(numberRangeSlider.selectedMaxValue)
        resetFields()
        listView?.applyFilters(listViewFilter: self.listViewFilter)
        listViewFilter = ListViewFilter()
    }
    func resetFields() {
        presenter?.resetFilters()
        typeCollection.reloadData()
        weaknessCollection.reloadData()
        heightFilterCollection.reloadData()
        weightFilterCollection.reloadData()
        setupNumberRange()
    }
}

extension FiltersMenuView:  UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.typeCollection {
            return presenter?.getPokemonFilterListLength(collectionFilterId : CollectionFilter.type) ?? 0
        } else if collectionView == self.weaknessCollection {
            return presenter?.getPokemonFilterListLength(collectionFilterId : CollectionFilter.weakness) ?? 0
        } else if collectionView == self.heightFilterCollection {
            return presenter?.getPokemonFilterListLength(collectionFilterId : CollectionFilter.height) ?? 0
        } else {
            return presenter?.getPokemonFilterListLength(collectionFilterId : CollectionFilter.weight) ?? 0
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.FiltersMenuCell.reuseIdentifier, for: indexPath) as? FiltersMenuCollectionCell {
            var type: Filter?
            var isCellSelected: Bool = false
            if collectionView == self.typeCollection {
                type = (presenter?.getPokemonFilterByIndex(index: indexPath.row, collectionFilterId: CollectionFilter.type))!
                isCellSelected =  listViewFilter.typeId == indexPath.row
            } else if collectionView == self.weaknessCollection {
                type = (presenter?.getPokemonFilterByIndex(index: indexPath.row, collectionFilterId: CollectionFilter.weakness))!
                isCellSelected =  listViewFilter.weaknessTypeId == indexPath.row
            } else if collectionView == self.heightFilterCollection {
                type = (presenter?.getPokemonFilterByIndex(index: indexPath.row, collectionFilterId : CollectionFilter.height))!
                isCellSelected =  listViewFilter.heightId == indexPath.row
            } else {
                type = (presenter?.getPokemonFilterByIndex(index: indexPath.row, collectionFilterId : CollectionFilter.weight))!
                isCellSelected =  listViewFilter.weightId == indexPath.row
            }
            if let safeType = type {
                cell.configure(safeType.name)
                cell.isSelected = isCellSelected
                return cell
            }
        }
        return UICollectionViewCell()
    }
}

extension FiltersMenuView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 55, height: 60)
    }
}

extension FiltersMenuView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        var type: Filter?
        if collectionView == self.typeCollection {
            listViewFilter.typeId = indexPath.row
            type = (presenter?.getPokemonFilterByIndex(index: indexPath.row, collectionFilterId : CollectionFilter.type))!
            presenter?.markPokemonFilterByIndex(index: indexPath.row, collectionFilterId : CollectionFilter.type)
        } else if collectionView == self.weaknessCollection {
            listViewFilter.weaknessTypeId = indexPath.row
            type = (presenter?.getPokemonFilterByIndex(index: indexPath.row, collectionFilterId : CollectionFilter.weakness))!
            presenter?.markPokemonFilterByIndex(index: indexPath.row, collectionFilterId : CollectionFilter.weakness)
        } else if collectionView == self.heightFilterCollection {
            listViewFilter.heightId = indexPath.row
            type = (presenter?.getPokemonFilterByIndex(index: indexPath.row, collectionFilterId : CollectionFilter.height))!
            presenter?.markPokemonFilterByIndex(index: indexPath.row, collectionFilterId : CollectionFilter.height)
        } else {
            listViewFilter.weightId = indexPath.row
            type = (presenter?.getPokemonFilterByIndex(index: indexPath.row, collectionFilterId : CollectionFilter.weight))!
            presenter?.markPokemonFilterByIndex(index: indexPath.row, collectionFilterId : CollectionFilter.weight)
        }
        if let safeType = type {
            cell?.isSelected = safeType.isSelected
        }
    }
}

extension FiltersMenuView: FiltersMenuViewProtocol {
}
