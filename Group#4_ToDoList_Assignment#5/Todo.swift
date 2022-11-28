//
//  Todo.swift
//  Group#4_ToDoList_Assignment#5
//
//  Created by Apeksha Parmar on 2022-11-27.
//

import UIKit

class Todo {
    
    var name: String
    var completed = false
    var desc: String
    
    init(name: String, desc: String) {
        self.name = name
        self.desc = desc
    }
    
}
