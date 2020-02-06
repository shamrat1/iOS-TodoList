//
//  AddCatagoryViewController.swift
//  TodoList
//
//  Created by Yasin Shamrat on 25/1/20.
//  Copyright © 2020 Yasin Shamrat. All rights reserved.
//

import UIKit
import RealmSwift

class AddCatagoryViewController: UITableViewController, UITextFieldDelegate, IconPickerViewDelegate {
    
    
    let realm = try! Realm()
    var iconName = "folder"
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var doneButtonOutlet: UIBarButtonItem!
    @IBOutlet weak var catagoryTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        iconView.image = UIImage(named: iconName)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
//        self.navigationController?.navigationBar.prefersLargeTitles = true
//        print(Realm.Configuration.defaultConfiguration.fileURL as? String)
    }
    
    
    // MARK:- Text Field Delegate Start
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        let oldText = catagoryTextField.text!
        let stringRange = Range(range, in:oldText)!
        let newText = oldText.replacingCharacters(in: stringRange, with: string)

            if newText.isEmpty {
            doneButtonOutlet.isEnabled = false
            } else {
            doneButtonOutlet.isEnabled = true
            }
        return true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        doneButtonOutlet.isEnabled = false
        return true
    }
    // MARK:- Text Field Delegate End
    
    // MARK:- icon picker view Delegate
    func iconPicker(_ picker: IconTableViewController, didPick iconName: String) {
        iconView.image = UIImage(named: iconName)
        self.iconName = iconName
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        catagoryTextField.becomeFirstResponder()
    }
    @IBAction func Done(_ sender: Any) {
        let catagory = Catagory()
        catagory.id = incrementID()
        catagory.name = catagoryTextField.text!
        catagory.icon = iconName
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
        return indexPath.section == 1 ? indexPath : nil
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            performSegue(withIdentifier: "catToIcon", sender: self)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "catToIcon"{
            let vc = segue.destination as! IconTableViewController
            vc.delegate = self
        }
    }
    
    func incrementID() -> Int {
        let id = (realm.objects(Catagory.self).max(ofProperty: "id") as Int? ?? 0) + 1
        return id
    }
   
}
