//
//  CompositionalVC.swift
//  Compositional Layout
//
//  Created by Stuti Dobhal on 03.06.21.
//

import UIKit

class CompositionalVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    private let headerKind = "headerKind"
    private let headerReuseIdentifier = "HeaderCollectionReusableView"
    private let cellReuseIdentifier = "FoodItemCollectionViewCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UICollectionReusableView.self,
                                forSupplementaryViewOfKind: headerKind,
                                withReuseIdentifier: headerReuseIdentifier)
        collectionView.collectionViewLayout = createLayout()
    }

    private func randomColor() -> UIColor {
        UIColor(red: .random(in: 0...1),
                green: .random(in: 0...1),
                blue: .random(in: 0...1),
                alpha: 1.0)
    }

    private func createLayout() -> UICollectionViewLayout {
        let size = NSCollectionLayoutSize(widthDimension: .absolute(250.0), heightDimension: .estimated(150.0))

        // Item
        let item = NSCollectionLayoutItem(layoutSize: size)
        item.contentInsets.trailing = 3

        // Group
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: size, subitems: [item])

        // Section
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets.leading = 5
        section.contentInsets.top = 5
        section.contentInsets.bottom = 5
        section.orthogonalScrollingBehavior = .continuous

        // Header in section
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.99), heightDimension: .absolute(40.0))
        section.boundarySupplementaryItems = [.init(layoutSize: headerSize,
                                                    elementKind: headerKind,
                                                    alignment: .topLeading)]

        // Layout
        let compLayout = UICollectionViewCompositionalLayout(section: section)
        return compLayout
    }

}

extension CompositionalVC: UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        5
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        8
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath)
        cell.backgroundColor = randomColor()
        cell.layer.cornerRadius = 5.0
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                     withReuseIdentifier: headerReuseIdentifier,
                                                                     for: indexPath)
        header.backgroundColor = .darkGray
        header.layer.cornerRadius = 5.0
        return header
    }
}
