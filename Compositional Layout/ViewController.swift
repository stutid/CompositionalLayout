//
//  ViewController.swift
//  Compositional Layout
//
//  Created by Stuti Dobhal on 08.04.21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    private let headerKind = "headerKind"

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Food Delivery"
        collectionView.register(HeaderCollectionReusableView.self,
                                forSupplementaryViewOfKind: headerKind,
                                withReuseIdentifier: "HeaderCollectionReusableView")
        collectionView.collectionViewLayout = createLayout()
    }

    private func createLayout() -> UICollectionViewLayout {
        let size = NSCollectionLayoutSize(widthDimension: .absolute(300.0), heightDimension: .absolute(140.0))

        // Item
        let item = NSCollectionLayoutItem(layoutSize: size)
        item.contentInsets.leading = 5
        item.contentInsets.trailing = 1

        // Group
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: size, subitems: [item])

        // Section
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets.top = 5
        section.contentInsets.bottom = 5
        section.orthogonalScrollingBehavior = .continuous
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(40.0))
        section.boundarySupplementaryItems = [.init(layoutSize: headerSize,
                                                    elementKind: headerKind,
                                                    alignment: .topLeading)]

        // Layout
        let compLayout = UICollectionViewCompositionalLayout(section: section)
        return compLayout
    }
}

extension ViewController: UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        3
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FoodItemCollectionViewCell", for: indexPath) as? FoodItemCollectionViewCell else { return UICollectionViewCell() }
        cell.backgroundColor = .systemBlue
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                           withReuseIdentifier: "HeaderCollectionReusableView",
                                                                           for: indexPath) as? HeaderCollectionReusableView else { return UICollectionReusableView() }
        header.backgroundColor = .darkGray
        return header
    }
}
