//
//  AllTasksTableTableViewController.swift
//  FileName: ToDoListApp
//  Group#04 - MAPD714 iOS Development
//  Students Name: Ajay Shrivastav (301284668), Apeksha Parmar (301205325), Brijen Jayeshbhai Shah (301271637)
//
//  ToDoList app to display task details, and add task details.
//
//  Created by Apeksha Parmar on 2022-11-13.
//

import UIKit

class AllTasksTableTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var tasks: [String] = ["Task1", "Task2", "Task3", "Task4"]
    
    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel?.text = tasks[indexPath.row]

        let switchView = UISwitch(frame: .zero)
        switchView.setOn(false, animated: true)
        switchView.tag = indexPath.row
        switchView.addTarget(self, action: #selector(self.switchDidChange(_:)), for: .valueChanged)
        cell.accessoryView = switchView
        
    
        return cell
    }
    
    
    @objc func switchDidChange(_ sender: UISwitch){
        print("sender is \(sender.tag)")
    }
}
