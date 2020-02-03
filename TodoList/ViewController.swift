//
//  ViewController.swift
//  TodoList
//
//  Created by Yasin Shamrat on 24/1/20.
//  Copyright © 2020 Yasin Shamrat. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UITableViewController {
    let realm = try! Realm()
    var catagories : Results<Catagory>? = nil
    var index : Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    override func viewWillAppear(_ animated: Bool) {
        catagories = realm.objects(Catagory.self)
        self.tableView.reloadData()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (catagories?.count)!
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "catagoryCell", for: indexPath)
        cell.imageView?.frame = CGRect(x: 8, y: 8, width: 36, height: 36)
        cell.imageView?.image = UIImage(named: catagories![indexPath.row].icon)
        
        cell.textLabel?.text = catagories![indexPath.row].name
        return cell
        
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.index = indexPath.row
        performSegue(withIdentifier: "catagoryCellToTasks", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "catagoryCellToTasks"{
            let taskVC = segue.destination as! TasksTableViewController
            taskVC.catagory = catagories![index!]
        }
    }


}

