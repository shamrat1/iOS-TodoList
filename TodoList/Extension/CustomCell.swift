//
//  CustomCell.swift
//  TodoList
//
//  Created by Mac on 2/3/20.
//  Copyright © 2020 Yasin Shamrat. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.imageView?.frame = CGRect(x: 8, y: 8, width: 36, height: 36)
    }
}
