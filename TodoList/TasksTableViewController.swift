//
//  TasksTableViewController.swift
//  TodoList
//
//  Created by Yasin Shamrat on 26/1/20.
//  Copyright © 2020 Yasin Shamrat. All rights reserved.
//

import UIKit
import RealmSwift

//
//protocol TasksViewControllerDelegate {
//    func catagoryObject(item: Catagory)
//}
class TasksTableViewController: UITableViewController {
    let realm = try! Realm()
    var catagory : Catagory?
    var tasks : List<Task>?
    
//    var catagoryDelegate : TasksViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let task = Task()
//        task.id = 1
//        task.name = "Buy Frootika"
//
//        do {
//            try realm.write {
//                catagory?.tasks.append(task)
//                print("added")
//            }
//        } catch  {
//            print("not added")
//        }
        self.navigationItem.title = catagory?.name
    }

    // MARK: - Table view data source
    override func viewWillAppear(_ animated: Bool) {
        if let all = catagory?.tasks {
            tasks = all
        }
        self.tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath)
        cell.textLabel?.text = tasks![indexPath.row].name
        return cell
    }
    
    @IBAction func onClickAddNewTask(_ sender: Any) {
        let alert = UIAlertController(title: "Add New Task", message: "", preferredStyle: UIAlertController.Style.alert)
        let saveAction = UIAlertAction(title: "Save", style: .default, handler: { (saveBtn) in
            do {
                let task = Task()
                task.id = self.incrementID()
                task.name = alert.textFields![0].text!
                task.isCompleted = false
                try self.realm.write {
                    self.catagory?.tasks.append(task)
                }
                self.tableView.reloadData()
            } catch{
                print("New Task Can't be added.")
            }
        })
        alert.addAction(saveAction)
        alert.actions.first?.isEnabled = false
        alert.addTextField { (textField) in
            NotificationCenter.default.addObserver(forName: UITextField.textDidChangeNotification, object: textField, queue: OperationQueue.main, using: { _ in
                // Being in this block means that something fired the UITextFieldTextDidChange notification.
                
                // Access the textField object from alertController.addTextField(configurationHandler:) above and get the character count of its non whitespace characters
                let textCount = textField.text?.trimmingCharacters(in: .whitespacesAndNewlines).count ?? 0
                // If the text contains non whitespace characters, enable the OK Button
                saveAction.isEnabled = textCount > 0 ? true : false
            })
        }
        
        present(alert,animated: true)
        
    }
    
    func incrementID() -> Int {
        let id = (realm.objects(Task.self).max(ofProperty: "id") as Int? ?? 0) + 1
        return id
    }

    
}
