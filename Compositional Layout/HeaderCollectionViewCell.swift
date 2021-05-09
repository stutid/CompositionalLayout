//
//  HeaderCollectionViewCell.swift
//  Compositional Layout
//
//  Created by Stuti Dobhal on 06.05.21.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {
    
    private let labelHeader = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        labelHeader.text = "Topic"
        addSubview(labelHeader)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        labelHeader.frame = CGRect(x: 15, y: 15, width: 300, height: 40)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
