//
//  CustomExtensions.swift
//  SpaceXDemoApp
//
//  Created by Jan Kučera on 21.10.2021.
//

import Foundation


extension String {
    
    /// Converts string of ISO8601 date to formatted string
    /// - Parameters:
    ///   - dateFormat: DateStyle enum
    ///   - timeFormat: TimeStyle enum
    /// - Returns: Date as formatted string
    func formatted(dateFormat: Date.FormatStyle.DateStyle = .abbreviated, timeFormat: Date.FormatStyle.TimeStyle = .omitted) -> String {
        let formatter = ISO8601DateFormatter()
        guard let date = formatter.date(from: self) else { return "n/a" }
        
        return date.formatted(date: dateFormat, time: timeFormat)
    }
    
}
