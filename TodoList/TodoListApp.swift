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
                .preferredColorScheme(.light)
                .environment(\.managedObjectContext, CoreDataManager.shared.viewContext)
        }
    }
}
