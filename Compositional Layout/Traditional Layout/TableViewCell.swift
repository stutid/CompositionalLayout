//
//  TableViewCell.swift
//  Compositional Layout
//
//  Created by Stuti Dobhal on 03.06.21.
//

import UIKit

class TableViewCell: UITableViewCell {

    // MARK: Outlets
    @IBOutlet weak var collectionView: UICollectionView!

    // MARK: Methods
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

// MARK: Collection view data source and delegate
extension TableViewCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        8
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as? CollectionViewCell
        else { return UICollectionViewCell() }

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 250, height: 150)
    }
}
