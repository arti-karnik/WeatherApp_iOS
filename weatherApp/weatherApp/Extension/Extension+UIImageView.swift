//
//  Extension+UIImageView.swift
//  weatherApp
//
//  Created by Kedar Mohile on 6/19/23.
//  Copyright © 2023 Arti Karnik. All rights reserved.
//

import UIKit

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
    
    func getIconURL(url: String) -> URL {
           let iconURL = (URL(string: weatherIconURL + url + ".png") ?? URL(string: ""))!
           return iconURL
       }
}
