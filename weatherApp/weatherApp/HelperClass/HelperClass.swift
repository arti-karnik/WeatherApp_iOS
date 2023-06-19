//
//  HelperClass.swift
//  weatherApp
//
//  Created by Kedar Mohile on 6/19/23.
//  Copyright © 2023 Arti Karnik. All rights reserved.
//

import UIKit

class HelperClass: NSObject {
    
    func getSavedCityName() -> String {
        return UserDefaults.standard.string(forKey: "cityName") ?? ""
    }
    
    func saveCityNameinUserDefault(_str: String) {
        UserDefaults.standard.set(_str, forKey: "cityName")
    }
}
