//
//  ViewController.swift
//  TodoList
//
//  Created by Yasin Shamrat on 24/1/20.
//  Copyright © 2020 Yasin Shamrat. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "catagoryCell", for: indexPath)
        cell.textLabel?.text = "Cell at section \(indexPath.section) : row \(indexPath.row)"
        return cell
        
    }


}

