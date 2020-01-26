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
    var tasks : Results<Task>?
    
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
        
    }

    // MARK: - Table view data source
    override func viewWillAppear(_ animated: Bool) {
        
    }
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    
}
