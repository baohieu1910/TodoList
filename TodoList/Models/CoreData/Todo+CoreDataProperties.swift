//
//  Todo+CoreDataProperties.swift
//  TodoList
//
//  Created by Hieu Le on 2/27/24.
//
//

import Foundation
import CoreData


extension Todo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Todo> {
        return NSFetchRequest<Todo>(entityName: "Todo")
    }

    @NSManaged public var name: String?
    @NSManaged public var isDone: Bool
    @NSManaged public var date: Date?
    @NSManaged public var id: UUID?

}

extension Todo : Identifiable {
    func makeItDone() {
        isDone = true
    }
}
