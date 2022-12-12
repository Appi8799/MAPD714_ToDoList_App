//
//  AddTaskViewController.swift
//  demoTodo
//
//  Group#04 - MAPD714 iOS Development
//  Students Name: Ajay Shrivastav (301284668),
//                 Apeksha Parmar (301205325),
//                 Brijen Jayeshbhai Shah (301271637)
//  Created by Apeksha Parmar on 2022-12-06.
//

import UIKit

class AddTaskViewController: UIViewController {
    
    @IBOutlet weak var taskName: UITextField!
    @IBOutlet weak var taskDesc: UITextField!
    @IBOutlet weak var dueDate: UISwitch!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var completedTask: UISwitch!
    

    @IBOutlet weak var horizontalTaskName: UITextField!
    @IBOutlet weak var horizontalTaskDesc: UITextField!
    @IBOutlet weak var horizontalDueDate: UISwitch!
    @IBOutlet weak var horizontalCompletedTask: UISwitch!
    @IBOutlet weak var horizontalDatePicker: UIDatePicker!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        datePicker.isHidden = true
        dueDate.isOn = false
    }
    
    @IBAction func saveBtn(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Action Required", message: "Do you want to save changes?", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: {action in}))
        
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: {action in
            
            let formatter = DateFormatter()
            formatter.dateFormat = "MMM d yyyy, h:mm a"
            
            let task = Tasks(context: self.context)
            task.id = Int32(truncating: 0 as NSNumber)
            task.name = self.taskName.text
            task.desc = self.taskDesc.text
            task.isCompleted = self.completedTask.isOn
            task.hasDueDate = self.dueDate.isOn
            
            if(self.dueDate.isOn){
                task.dueDate = formatter.string(from: self.datePicker.date)
                task.date = self.datePicker.date
            }
            self.saveData()
            _ = self.navigationController?.popToRootViewController(animated: true)
        }))
        present(alert, animated: true)
    }
    
    
    @IBAction func horizontalSaveBtn(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Action Required", message: "Do you want to save changes?", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: {action in}))
        
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: {action in
            
            let formatter = DateFormatter()
            formatter.dateFormat = "MMM d yyyy, h:mm a"
            
            let task = Tasks(context: self.context)
            task.id = Int32(truncating: 0 as NSNumber)
            task.name = self.horizontalTaskName.text
            task.desc = self.horizontalTaskDesc.text
            task.isCompleted = self.horizontalCompletedTask.isOn
            task.hasDueDate = self.horizontalDueDate.isOn
            
            if(self.horizontalDueDate.isOn){
                task.dueDate = formatter.string(from: self.datePicker.date)
                task.date = self.horizontalDatePicker.date
            }
            self.saveData()
            _ = self.navigationController?.popToRootViewController(animated: true)
        }))
        present(alert, animated: true)
        
    }
    
    @IBAction func cancelBtn(_ sender: UIButton) {
        taskName.text = ""
        taskDesc.text = ""
        dueDate.isOn = false
        completedTask.isOn = false
        datePicker.isHidden = true
    }
    
    
    @IBAction func horizontalCancelBtn(_ sender: UIButton) {
        horizontalTaskName.text = ""
        horizontalTaskDesc.text = ""
        horizontalDueDate.isOn = false
        horizontalCompletedTask.isOn = false
        horizontalDatePicker.isHidden = true
    }
    
    func saveData() {
        do {
            try self.context.save()
            let _ = try self.context.fetch(Tasks.fetchRequest())
        }
        catch{
            print("Error")
        }
    }
    
    @IBAction func dueDateSwitch(_ sender: UISwitch) {
        if(sender.isOn){
            datePicker.isHidden = false
            dueDate.isOn = true
        }else {
            datePicker.isHidden = true
            dueDate.isOn = false
        }
    }
    
    @IBAction func horizontalDueDateSwitch(_ sender: UISwitch) {
        if(sender.isOn){
            horizontalDatePicker.isHidden = false
            horizontalDueDate.isOn = true
        }else {
            horizontalDatePicker.isHidden = true
            horizontalDueDate.isOn = false
        }
    }
}
