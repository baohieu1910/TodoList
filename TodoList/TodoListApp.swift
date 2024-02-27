//
//  TodoListApp.swift
//  TodoList
//
//  Created by Hieu Le on 2/26/24.
//

import SwiftUI

@main
struct TodoListApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(ColorSchemeManager.shared.isLightMode ? .light : .dark)
                .environment(\.managedObjectContext, CoreDataManager.shared.viewContext)
        }
    }
}
