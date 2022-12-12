//
//  CompletedTask+CoreDataProperties.swift
//  demoTodo
//
//  Created by Apeksha Parmar on 2022-12-07.
//
//

import Foundation
import CoreData


extension CompletedTask {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CompletedTask> {
        return NSFetchRequest<CompletedTask>(entityName: "CompletedTask")
    }

    @NSManaged public var name: String?
    @NSManaged public var date: Date?
    @NSManaged public var hasDueDate: Bool
    @NSManaged public var isCompleted: Bool
    @NSManaged public var id: Int32
    @NSManaged public var desc: String?
    @NSManaged public var dueDate: String?

}

extension CompletedTask : Identifiable {

}
