//
//  TodoListViewModel.swift
//  TodoList
//
//  Created by Hieu Le on 2/26/24.
//

import SwiftUI
import CoreData

class TodoListViewModel: ObservableObject {
    @Published var todos = [Todo]()
    
    init() {
        getAllTodos()
    }

}

extension TodoListViewModel {
    func getAllTodos() {
        todos = CoreDataManager.shared.getAllTodos().sorted(by: { lhs, rhs in
            lhs.date ?? Date.now < rhs.date ?? Date.now
        })
    }
    
    func updateTodoList() {
        CoreDataManager.shared.saveContext()
        getAllTodos()
    }
    
    func addTodo(name: String, date: Date) {
        var newTodo = Todo(context: CoreDataManager.shared.viewContext)
        
        newTodo.id = UUID()
        newTodo.name = name
        newTodo.date = date
        newTodo.isDone = false
        
        CoreDataManager.shared.saveContext()
        getAllTodos()
    }
    
    func deleteTodo(todo: Todo) {
        CoreDataManager.shared.deleteTodo(todo: todo)
        getAllTodos()
    }
    
    func deleteAllTodos() {
        for todo in todos {
            CoreDataManager.shared.deleteTodo(todo: todo)
        }
        updateTodoList()
    }
}

