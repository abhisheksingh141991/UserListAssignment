//
//  UserTableViewCell.swift
//  UserListAssignment
//
//  Created by Abhishek on 26/04/24.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLable: UILabel!
    
    static var identifire:String{
        return String(describing: self)
    }
    
    func renderCell(vm: UserListElement) {
        titleLable.text = "\(vm.id): \(vm.title)"
    }
}
