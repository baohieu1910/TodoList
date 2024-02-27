//
//  ColorSchemeManager.swift
//  TodoList
//
//  Created by Hieu Le on 2/27/24.
//

import Foundation
import SwiftUI

class ColorSchemeManager: ObservableObject {
    static var shared = ColorSchemeManager()
    
    @Published var isLightMode: Bool
    
    private init() {
        isLightMode = true
    }
}

extension ColorSchemeManager {
    func changeColorScheme() {
        isLightMode.toggle()
    }
}
