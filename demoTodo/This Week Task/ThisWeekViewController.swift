//
//  ThisWeekViewController.swift
//  demoTodo
//
//  Group#04 - MAPD714 iOS Development
//  Students Name: Ajay Shrivastav (301284668),
//                 Apeksha Parmar (301205325),
//                 Brijen Jayeshbhai Shah (301271637)
//  Created by Apeksha Parmar on 2022-12-06.
//

import UIKit
import CoreData

class ThisWeekViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {

    @IBOutlet weak var table: UITableView!

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var DBManager = [ThisWeekTask]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        table.dataSource = self
        table.delegate = self
        table.separatorInset = table.layoutMargins
       
        fetchData()
    }
 
    func fetchData() {
        do {
            self.DBManager = try context.fetch(ThisWeekTask.fetchRequest())
            DispatchQueue.main.async {
                self.table.reloadData()
            }
        }catch{
            
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DBManager.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let date = Date()
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCellTableViewCell
        
        let thisTask: ThisWeekTask!
        
        
        thisTask = DBManager[indexPath.row]
        cell.titleLabel.text = thisTask.name
        cell.descLabel.text = thisTask.desc
        cell.descLabel.text = "Due: " + (thisTask.dueDate ?? "No due date")
        
        
        if(thisTask.isCompleted) {
            cell.titleLabel.attributedText = addStrikeThrough(string: cell.titleLabel.text!)
            cell.descLabel.attributedText = addStrikeThrough(string: cell.descLabel.text!)
        }else {
            cell.titleLabel.attributedText = removeStrikeThough(string: cell.titleLabel.text!)
            cell.descLabel.attributedText = removeStrikeThough(string: cell.descLabel.text!)
        }
        
        if thisTask.date?.compare(date) == .orderedAscending {
            cell.dateLabel.textColor = UIColor.red
        }else {
            cell.dateLabel.textColor = UIColor.black
        }
        
        return cell
    }
    

    @objc func subscribeTapped(_ sender: UIButton){
    }
    
    
    func addStrikeThrough (string : String) -> NSMutableAttributedString{
        //adding a strikethrough
        let stringAttribute: NSMutableAttributedString =  NSMutableAttributedString(string: string)
        stringAttribute.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSMakeRange(0, stringAttribute.length))
        return stringAttribute
    }
    
    func removeStrikeThough(string : String) -> NSMutableAttributedString{
        //removing a strikethrough
        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: string)
        attributeString.removeAttribute(NSAttributedString.Key.strikethroughStyle, range: NSMakeRange(0, attributeString.length))
        return attributeString
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let edit = UIContextualAction(style: .normal, title: "Edit", handler: { (context, view, actionPerformed: (Bool) -> ()) in

            self.performSegue(withIdentifier: "editThisWeekViewController", sender: nil)
            actionPerformed(true)
        })

        edit.backgroundColor = .blue
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [edit])
        return swipeConfiguration

    }

    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive, title: "Delete") { _, _, _ in
            
            self.context.delete(self.DBManager[indexPath.row])
            self.table.reloadData()
            self.DBManager.remove(at: indexPath.row)
            
            do{
                try self.context.save()
            }catch _ {}
            
            self.table.deleteRows(at: [indexPath], with: .fade)
            self.table.reloadData()
        }
        
        let done = UIContextualAction(style: .normal, title: "Done") { _, _, _ in
            //let indexPath = IndexPath(item: <#T##Int#>, section: 0)
            
        }
        
        done.backgroundColor = .systemYellow
        
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [delete, done])
        return swipeConfiguration
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //runs when the view appears
        fetchData()
    }

}
