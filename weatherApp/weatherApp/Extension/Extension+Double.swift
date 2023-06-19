//
//  Extension+Double.swift
//  weatherApp
//
//  Created by Kedar Mohile on 6/19/23.
//  Copyright © 2023 Arti Karnik. All rights reserved.
//

import UIKit

extension Double {
    func getDateStringFromUTC() -> String {
        let utcDateFormatter = DateFormatter()
        utcDateFormatter.dateStyle = .medium
        utcDateFormatter.timeStyle = .medium
        utcDateFormatter.timeZone = TimeZone(abbreviation: "UTC")

        let date = Date()
        print(utcDateFormatter.string(from: date))
        return utcDateFormatter.string(from: date)
    }
}
