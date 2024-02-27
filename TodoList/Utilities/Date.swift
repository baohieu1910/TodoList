//
//  Date.swift
//  TodoList
//
//  Created by Hieu Le on 2/27/24.
//

import Foundation
import SwiftUI

extension Date {
    func timeZoneVN() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss, dd/MM/yyyy"
        formatter.timeZone = TimeZone(identifier: "VN")
        return formatter.string(from: self)
    }
    
    func getTime() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss"
        formatter.timeZone = TimeZone(identifier: "VN")
        return formatter.string(from: self)
    }
    
    func getDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        formatter.timeZone = TimeZone(identifier: "VN")
        return formatter.string(from: self)
    }
}
