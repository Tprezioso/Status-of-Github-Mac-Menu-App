//
//  HelperMethods.swift
//  Status of Github Menu App
//
//  Created by Thomas Prezioso Jr on 4/1/22.
//

import Foundation

struct HelperMethods {
    func formatDate(date: String) -> String {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        let dateObj: Date? = dateFormatterGet.date(from: date)
        
        return dateFormatter.string(from: dateObj!)
    }
    
}

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }

    func replaceUnderscoreWithSpace() -> String {
        return replacingOccurrences(of: "_", with: " ")
    }
    mutating func replaceUnderscore() {
        self = self.replaceUnderscoreWithSpace()
    }
}
