//
//  AddCatagoryViewController.swift
//  TodoList
//
//  Created by Yasin Shamrat on 25/1/20.
//  Copyright © 2020 Yasin Shamrat. All rights reserved.
//

import UIKit
import RealmSwift

class AddCatagoryViewController: UITableViewController {
    let realm = try! Realm()
    @IBOutlet weak var catagoryTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        print(realm.configuration.fileURL!)
    }
    @IBAction func Done(_ sender: UIBarButtonItem) {
        print(catagoryTextField.text!)
        
        let catagory = Catagory()
        catagory.id = incrementID()
        catagory.name = catagoryTextField.text!
        
        do {
            try self.realm.write {
                self.realm.add(catagory)
                print("Saved \(catagory)")
            }
        } catch {
            print("New Catagory not saved.")
        }
        
    navigationController?.popViewController(animated: true)
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    
    func incrementID() -> Int {
        let id = (realm.objects(Task.self).max(ofProperty: "id") as Int? ?? 0) + 1
        return id
    }
   
}
