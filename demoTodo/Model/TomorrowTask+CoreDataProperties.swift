//
//  TomorrowTask+CoreDataProperties.swift
//  demoTodo
//
//  Created by Apeksha Parmar on 2022-12-07.
//
//

import Foundation
import CoreData


extension TomorrowTask {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TomorrowTask> {
        return NSFetchRequest<TomorrowTask>(entityName: "TomorrowTask")
    }

    @NSManaged public var name: String?
    @NSManaged public var date: Date?
    @NSManaged public var id: Int32
    @NSManaged public var desc: String?
    @NSManaged public var dueDate: String?
    @NSManaged public var hasDueDate: Bool
    @NSManaged public var isCompleted: Bool

}

extension TomorrowTask : Identifiable {

}
