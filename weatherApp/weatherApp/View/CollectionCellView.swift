//
//  CollectionCellView.swift
//  weatherApp
//
//  Created by Arti Karnik on 6/18/23.
//  Copyright © 2023 Arti Karnik. All rights reserved.
//

import UIKit

class CollectionCellView: UICollectionViewCell {

    @IBOutlet weak var lbldt: UILabel!
    @IBOutlet weak var lblTemp: UILabel!
    @IBOutlet weak var imgViewIcon: UIImageView!
    
    func setUI(forecastInfo: WeatherForecast, _row: Int) {
        lbldt.text = getDate(_current: _row)
        lblTemp.text = forecastInfo.temp
        let iconURL = imgViewIcon.getIconURL(url: forecastInfo.icon)
        imgViewIcon.load(url: iconURL)
    }
    
    func getDate(_current: Int) -> String {
        let today = Date()
        print(today)
        let modifiedDate = Calendar.current.date(byAdding: .day, value: _current, to: today)!
        print(modifiedDate)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        dateFormatter.string(from: modifiedDate)
        return dateFormatter.string(from: modifiedDate)
    }
}
