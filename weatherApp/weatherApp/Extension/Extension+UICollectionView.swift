//
//  Extension+UICollectionView.swift
//  weatherApp
//
//  Created by Kedar Mohile on 6/19/23.
//  Copyright © 2023 Arti Karnik. All rights reserved.
//

import UIKit

// MARK: Extension+UICollectionView
extension UICollectionViewCell {
    
    func configure() {
        contentView.layer.cornerRadius = 20
        contentView.layer.borderWidth = 1.0
        contentView.layer.borderColor = UIColor.clear.cgColor
        contentView.layer.masksToBounds = true
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2.0)
        layer.shadowRadius = 2.0
        layer.shadowOpacity = 0.5
        layer.masksToBounds = false
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: contentView.layer.cornerRadius).cgPath
    }
}

// MARK: Extension+UICollectionViewCell
extension UICollectionViewCell: ReusableCell {}
