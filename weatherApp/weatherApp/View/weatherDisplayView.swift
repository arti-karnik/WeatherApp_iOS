//
//  weatherDisplayView.swift
//  weatherApp
//
//  Created by Arti Karnik on 6/18/23.
//  Copyright © 2023 Arti Karnik. All rights reserved.
//

import UIKit

class weatherDisplayView: UIView, UISearchBarDelegate {

    @IBOutlet weak var lblCityName: UILabel!
    @IBOutlet weak var lbldesc: UILabel!
    @IBOutlet weak var lbldt: UILabel!
    @IBOutlet weak var lblWind: UILabel!
    @IBOutlet weak var lblmaxTemp: UILabel!
    @IBOutlet weak var lblminTemp: UILabel!
    @IBOutlet weak var lblHumidity: UILabel!
    @IBOutlet weak var lblTemp: UILabel!
    @IBOutlet weak var imgViewIcon: UIImageView!

    func setUI(weatherInfo: WeatherInfo) {
        lblCityName.text = weatherInfo.cityName
        lblTemp.text = weatherInfo.temp
        lbldt.text = Double(weatherInfo.dt)?.getDateStringFromUTC()
        lbldesc.text = weatherInfo.description
        lblWind.text = "Wind: " + weatherInfo.wind
        lblmaxTemp.text = "Max Temp: " + weatherInfo.maxTemp
        lblminTemp.text = "Min Temp: " + weatherInfo.minTemp
        lblHumidity.text = "Humidity: " +  weatherInfo.humidity
        lbldesc.text = weatherInfo.description
        let iconURL = imgViewIcon.getIconURL(url: weatherInfo.icon)
        imgViewIcon.load(url: iconURL)
    }
}



