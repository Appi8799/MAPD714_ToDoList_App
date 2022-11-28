//
//  DBManager.swift
//  Group#4_ToDoList_Assignment#5
//
//  Created by Apeksha Parmar on 2022-11-27.
//

import UIKit

class DBManager {
    
    static let shared = DBManager()
    
    
    var todos = [Todo]()
    
    var count: Int {
        get {
            return todos.count
        }
    }
    
    func todoAtIndex(index: Int) -> Todo {
        return todos[index]
    }
    func addNewToDoWithName(name: String, desc: String) {
        let todo = Todo(name: name, desc: desc)
        todos.append(todo)
    }
    
    
    private init() {
        todos.append(Todo(name: "Call Supervisors", desc: "Call for meeting and remind file checking"))
        todos.append(Todo(name: "Go to gym", desc: "Gym workouts"))
        todos.append(Todo(name: "College assignments", desc: "Complete milestones of all subjects"))
        todos.append(Todo(name: "Groceries", desc: "Buy groceries"))
    }
    
}
