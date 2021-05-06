//
//  ViewController.swift
//  Compositional Layout
//
//  Created by Stuti Dobhal on 08.04.21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Food Delivery"
        collectionView.collectionViewLayout = createLayout()
    }

    private func createLayout() -> UICollectionViewLayout {
        let size = NSCollectionLayoutSize(widthDimension: .absolute(300.0), heightDimension: .absolute(140.0))
        let item = NSCollectionLayoutItem(layoutSize: size)
        item.contentInsets.top = 5
        item.contentInsets.leading = 5
        item.contentInsets.trailing = 1
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: size, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        let compLayout = UICollectionViewCompositionalLayout(section: section)
        return compLayout
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FoodItemCollectionViewCell", for: indexPath) as? FoodItemCollectionViewCell else { return UICollectionViewCell() }
        cell.backgroundColor = .systemPink
        return cell
    }
}
