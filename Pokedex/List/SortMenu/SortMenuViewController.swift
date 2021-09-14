//
//  SortMenuViewController.swift
//  Pokedex
//
//  Created by user on 5/3/21.
//

import UIKit
import PullUpController

class SortMenuViewController: PullUpController {
    @IBOutlet var container: UIView!
    @IBOutlet var smallestNSort: UIButton!
    @IBOutlet var highestNSort: UIButton!
    @IBOutlet var azSort: UIButton!
    @IBOutlet var zaSort: UIButton!
    @IBOutlet var scrollItem: UIButton!
    let selectedBG = UIColor(named: "selectedBackground")
    let selectedText = UIColor(named: "selectedText")
    var presenter: SortMenuPresenterProtocol?
    var listView: ListView?
    var initSort: SortMethod?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initSelectedSort()
        container.layer.cornerRadius = 30
        smallestNSort.layer.cornerRadius = 10
        highestNSort.layer.cornerRadius = 10
        azSort.layer.cornerRadius = 10
        zaSort.layer.cornerRadius = 10
        scrollItem.layer.cornerRadius = 2.5
        initSort = listView?.getCurrentSortMethod()
    }
    @IBAction func changeSort(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        self.view = nil
        let selectedSort = SortMethod(rawValue: sender.tag)
        listView?.dismissView(sortMenu: (selectedSort ?? initSort)!)
    }

    func initSelectedSort() {
        switch listView?.getCurrentSortMethod() {
        case .highestnumber:
            selectedSort(buttonSort: highestNSort)
        case .smallestnumberfirst:
            selectedSort(buttonSort: smallestNSort)
        case .alphabeticallyAZ:
            selectedSort(buttonSort: azSort)
        case .alphabeticallyZA:
            selectedSort(buttonSort: zaSort)
        case .none:
            selectedSort(buttonSort: highestNSort)
        }
    }
    func selectedSort(buttonSort:UIButton) {
        buttonSort.backgroundColor = selectedBG
        buttonSort.layer.shadowColor = selectedBG?.cgColor
        buttonSort.setTitleColor(selectedText, for: .normal)
        buttonSort.layer.shadowOffset = CGSize(width: 0, height: 10)
        buttonSort.layer.shadowOpacity = 0.5
        buttonSort.layer.shadowRadius = 15.0
    }
    func setupElementBorderRadius() {
        self.view.layer.cornerRadius = 30
        smallestNSort.layer.cornerRadius = 10
        highestNSort.layer.cornerRadius = 10
        azSort.layer.cornerRadius = 10
        zaSort.layer.cornerRadius = 10
    }

    override var pullUpControllerMiddleStickyPoints: [CGFloat] {
        return [ 400,1000, 1110]
    }
    override func pullUpControllerDidDrag(to point: CGFloat) {
        if point == pullUpControllerMiddleStickyPoints[0] || point < pullUpControllerMiddleStickyPoints[0]{
            self.dismiss(animated: false, completion: nil)
            self.view = nil
            listView?.dismissView(sortMenu: initSort!)
        }
    }
}

extension SortMenuViewController: SortMenuViewProtocol {
}
