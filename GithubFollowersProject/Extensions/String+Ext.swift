//
//  String+Ext.swift
//  GithubFollowersProject
//
//  Created by Aaron Cleveland on 4/28/21.
//

import Foundation
import UIKit

extension String {

    func converToDate() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = .current
        return dateFormatter.date(from: self)
    }
    
    func convertToDisplayFormat() -> String {
        guard let date = self.converToDate() else { return "N/A" }
        return date.converToMonthYearFormat()
    }
}
