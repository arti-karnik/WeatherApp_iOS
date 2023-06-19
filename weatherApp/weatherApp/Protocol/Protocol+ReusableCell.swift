//
//  Protocol+ReusableCell.swift
//  weatherApp
//
//  Created by Kedar Mohile on 6/19/23.
//  Copyright © 2023 Arti Karnik. All rights reserved.
//

import UIKit

protocol ReusableCell {
    static var reuseIdentifier: String { get }
}

extension ReusableCell {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
