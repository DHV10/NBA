//
//  DateHelpers.swift
//  NBA2
//
//  Created by DHV on 04/08/2021.
//

import Foundation

enum DateCategory {
    
    case yesterday
    case today
    case tommorrow
    
}

extension Date {
    
    var dayAfter:Date {
        return Calendar.current.date(byAdding: .day, value: 1, to: self)!
    }
    
    var dayBefore: Date {
        return Calendar.current.date(byAdding: .day, value: -1, to: self)!
    }
    
}

class DateHelper {
    
    static var months = ["JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL", "AUG", "SEP", "OCT", "NOV", "DEC"]
    
    static func getDateString(day: DateCategory) -> String {
        
        let date:Date
        
        if day == DateCategory.today {
            date = Date()
        } else if day == DateCategory.yesterday {
            date = Date().dayBefore
        } else if day == DateCategory.tommorrow {
            date = Date().dayAfter
        } else {
            return ""
        }
        
        let calender = Calendar.current
        let year = calender.component(.year, from: date)
        let month = months[calender.component(.month, from: date) - 1]
        let day = calender.component(.day, from: date)
        
        return "\(year)-\(month)-\(day)"
    }
    
    static func getTimeString(time: String) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        
        let datetime = dateFormatter.date(from: time)
        
        dateFormatter.dateStyle = .none
        dateFormatter.timeStyle = .short
        
        return dateFormatter.string(from: datetime!)
        
    }
    
}
