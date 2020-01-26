//
//  Task.swift
//  TodoList
//
//  Created by Yasin Shamrat on 26/1/20.
//  Copyright © 2020 Yasin Shamrat. All rights reserved.
//

import Foundation
import RealmSwift

class Task : Object {
    @objc dynamic var id = Int()
    @objc dynamic var name = String()
    @objc dynamic var isCompleted = Bool()
    let catagory = LinkingObjects(fromType: Catagory.self, property: "tasks")
}
