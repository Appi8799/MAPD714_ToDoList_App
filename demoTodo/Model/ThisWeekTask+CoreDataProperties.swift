//
//  ThisWeekTask+CoreDataProperties.swift
//  demoTodo
//
//  Created by Apeksha Parmar on 2022-12-07.
//
//

import Foundation
import CoreData


extension ThisWeekTask {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ThisWeekTask> {
        return NSFetchRequest<ThisWeekTask>(entityName: "ThisWeekTask")
    }

    @NSManaged public var name: String?
    @NSManaged public var date: Date?
    @NSManaged public var id: Int32
    @NSManaged public var dueDate: String?
    @NSManaged public var hasDueDate: Bool
    @NSManaged public var isCompleted: Bool
    @NSManaged public var desc: String?

}

extension ThisWeekTask : Identifiable {

}
