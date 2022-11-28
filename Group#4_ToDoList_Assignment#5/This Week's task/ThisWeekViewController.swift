//
//  ThisWeekViewController.swift
//  Group#4_ToDoList_Assignment#5
//
//  Created by Apeksha Parmar on 2022-11-27.
//

import UIKit

class ThisWeekViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
        
        
        @IBOutlet weak var table: UITableView!
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            let count = DBManager.shared.count
            print("TodoCount: \(count)")
            
            let t = DBManager.shared.todoAtIndex(index: 0)
            print("First ToDo: \(t.name)")
        }
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
        }
        
        override func viewWillAppear(_ animated: Bool) {
            table.reloadData()
        }
        
        func setCheckMarkForCell(cell: UITableViewCell, completed: Bool) {
            if completed {
                cell.accessoryType = .checkmark
            } else {
                cell.accessoryType = .none
            }
        }


        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return DBManager.shared.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = table.dequeueReusableCell(withIdentifier: "cell")!
            
            let todo = DBManager.shared.todoAtIndex(index: indexPath.row)
            cell.textLabel?.text = todo.name
            
            
            setCheckMarkForCell(cell: cell, completed: todo.completed)
            
            return cell
            
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let todo = DBManager.shared.todoAtIndex(index: indexPath.row)
            todo.completed = !todo.completed
            
            let cell = table.cellForRow(at: indexPath)!
            setCheckMarkForCell(cell: cell, completed: todo.completed)
        }
        
        

}
