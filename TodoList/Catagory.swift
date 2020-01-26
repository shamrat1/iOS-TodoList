//
//  Catagory.swift
//  TodoList
//
//  Created by Yasin Shamrat on 26/1/20.
//  Copyright © 2020 Yasin Shamrat. All rights reserved.
//

import Foundation
import RealmSwift

class Catagory : Object{
    @objc dynamic var id = Int()
    @objc dynamic var name = String()
    
    let tasks = List<Task>()
}
