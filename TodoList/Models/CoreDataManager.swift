//
//  CoreDataManager.swift
//  TodoList
//
//  Created by Hieu Le on 2/26/24.
//

import Foundation
import CoreData

class CoreDataManager {
    static var shared = CoreDataManager()
    
    let persistentContainer: NSPersistentContainer
    
    var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    private init() {
        persistentContainer = NSPersistentContainer(name: "TodoList")
        persistentContainer.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Unable to initialize Core Data \(error)")
            }
        }
    }
}

extension CoreDataManager {
    func saveContext() {
        if viewContext.hasChanges {
            do {
                try viewContext.save()
            }
            catch {
                print("ERROR: \(error.localizedDescription)")
            }
        }
    }
    
    func getAllTodos() -> [Todo]{
        let request = NSFetchRequest<Todo>(entityName: "Todo")
        
        do {
            return try viewContext.fetch(request)
        } catch {
            return []
        }
    }
    
    func deleteTodo(todo: Todo) {
        viewContext.delete(todo)

        do {
            try viewContext.save()
        } catch {
            print(error.localizedDescription)
        }
    }
}
