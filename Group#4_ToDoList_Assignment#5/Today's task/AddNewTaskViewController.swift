//
//  AddNewTaskViewController.swift
//  Group#4_ToDoList_Assignment#5
//
//  Created by Apeksha Parmar on 2022-11-27.
//

import UIKit

class AddNewTaskViewController: UIViewController {

    
    @IBOutlet weak var taskName: UITextField!
    
    
    @IBOutlet weak var taskDesc: UITextField!
    
    
    @IBOutlet weak var taskDate: UITextField!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveTask(_ sender: Any) {
        DBManager.shared.addNewToDoWithName(name: taskName.text!, desc: taskDesc.text!)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelTask(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

}
