//
//  Tasks+CoreDataProperties.swift
//  demoTodo
//
//  Created by Apeksha Parmar on 2022-12-07.
//
//

import Foundation
import CoreData


extension Tasks {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Tasks> {
        return NSFetchRequest<Tasks>(entityName: "Tasks")
    }

    @NSManaged public var name: String?
    @NSManaged public var isCompleted: Bool
    @NSManaged public var id: Int32
    @NSManaged public var hasDueDate: Bool
    @NSManaged public var dueDate: String?
    @NSManaged public var desc: String?
    @NSManaged public var date: Date?

}

extension Tasks : Identifiable {

}
