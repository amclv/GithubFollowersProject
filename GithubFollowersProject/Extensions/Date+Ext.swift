//
//  Date+Ext.swift
//  GithubFollowersProject
//
//  Created by Aaron Cleveland on 5/4/21.
//

import Foundation

extension Date {
    
    func converToMonthYearFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM yyyy"
        return dateFormatter.string(from: self)
    }
}
