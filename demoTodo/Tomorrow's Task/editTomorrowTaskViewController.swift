//
//  editTomorrowTaskViewController.swift
//  demoTodo
//
//  Group#04 - MAPD714 iOS Development
//  Students Name: Ajay Shrivastav (301284668),
//                 Apeksha Parmar (301205325),
//                 Brijen Jayeshbhai Shah (301271637)
//  Created by Apeksha Parmar on 2022-12-06.
//

import UIKit

class editTomorrowTaskViewController: UIViewController {

    var DBManager : TomorrowTask!
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet weak var titleLabel: UITextField!
    @IBOutlet weak var descriptionLabel: UITextField!
    @IBOutlet weak var hasDueDate: UISwitch!
    @IBOutlet weak var isCompleted: UISwitch!
    @IBOutlet weak var dueTime: UIDatePicker!
    
    @IBOutlet weak var horizontalTitleLabel: UITextField!
    @IBOutlet weak var horizontalDescriptionLabel: UITextField!
    @IBOutlet weak var horizontalDueDate: UISwitch!
    @IBOutlet weak var horizontalCompletedTask: UISwitch!
    @IBOutlet weak var horizontalDatePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        titleLabel.text = DBManager.name ?? ""
//        descriptionLabel.text = DBManager.desc
//        hasDueDate.isOn = DBManager.hasDueDate
//        isCompleted.isOn = DBManager.isCompleted
//        dueTime.date = DBManager.date ?? Date.now
        

    }
    
    @IBAction func updateBtn(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Action Required", message: "Do you want to update the data?", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: {action in}))
        
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: {action in
            
            let formatter = DateFormatter()
            formatter.dateFormat = "MMM d yyyy, h:mm a"
            
            self.DBManager.name = self.titleLabel.text
            self.DBManager.desc = self.descriptionLabel.text
            self.DBManager.hasDueDate = self.hasDueDate.isOn
            self.DBManager.isCompleted = self.isCompleted.isOn
            
            if(!self.hasDueDate.isOn){
                self.DBManager.dueDate = nil
                self.DBManager.date = nil
            }else {
                self.DBManager.dueDate = formatter.string(from: self.dueTime.date)
                self.DBManager.date = self.dueTime.date
            }
            
            self.updateData()
            
        }))
        
        present(alert, animated: true)
        
    }
    
    @IBAction func horizontalUpdateBtn(_ sender: UIButton) {
        let alert = UIAlertController(title: "Action Required", message: "Do you want to update the data?", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: {action in}))
        
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: {action in
            
            let formatter = DateFormatter()
            formatter.dateFormat = "MMM d yyyy, h:mm a"
            
            self.DBManager.name = self.horizontalTitleLabel.text
            self.DBManager.desc = self.horizontalDescriptionLabel.text
            self.DBManager.hasDueDate = self.horizontalDueDate.isOn
            self.DBManager.isCompleted = self.horizontalCompletedTask.isOn
            
            if(!self.horizontalDueDate.isOn){
                self.DBManager.dueDate = nil
                self.DBManager.date = nil
            }else {
                self.DBManager.dueDate = formatter.string(from: self.horizontalDatePicker.date)
                self.DBManager.date = self.horizontalDatePicker.date
            }
            
            self.updateData()
            
        }))
        
        present(alert, animated: true)
    }
    
    @IBAction func deleteBtn(_ sender: UIButton) {
        let alert = UIAlertController(title: "Action Required", message: "Do you want to delete the task?", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: {action in}))
        
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: {action in
            self.deleteData()
            
        }))
        present(alert, animated: true)
    }
    
    @IBAction func horizontalDeleteBtn(_ sender: UIButton) {
        let alert = UIAlertController(title: "Action Required", message: "Do you want to delete the task?", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: {action in}))
        
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: {action in
            self.deleteData()
            
        }))
        present(alert, animated: true)
    }
    
    func deleteData() {
        self.context.delete(DBManager)
        do{
            try self.context.save()
            _ = navigationController?.popToRootViewController(animated: true)
        }catch{
            print("Error")
        }
    }
    
    func updateData(){
        do{
            try self.context.save()
            _ = self.navigationController?.popToRootViewController(animated: true)
        }catch{}
    }
    
    
    @IBAction func cancelBtn(_ sender: UIButton) {
        cancelAction()
    }
    
    @IBAction func horizontalCancelBtn(_ sender: UIButton) {
        cancelAction()
    }
    
    func cancelAction() {
        let alert = UIAlertController(title: "Action Required", message: "Do you want to discard changes?", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: {action in}))
        
        alert.addAction(UIAlertAction(title: "Yes", style: .destructive, handler: {action in
            _ = self.navigationController?.popToRootViewController(animated: true)
        }))
        present(alert, animated: true)
    }
}
