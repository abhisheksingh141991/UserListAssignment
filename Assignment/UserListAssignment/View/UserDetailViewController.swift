//
//  UserDetailViewController.swift
//  UserListAssignment
//
//  Created by Abhishek on 26/04/24.
//

import UIKit

class UserDetailViewController: UIViewController {
    
    @IBOutlet weak var userTitleLabel: UILabel!
    @IBOutlet weak var userDetailsLabel: UILabel!

    static var identifire:String{
        return String(describing: self)
    }
    
    var userDetails: UserListElement?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        renderView()
    }
    
    private func renderView() {
        guard let vm = userDetails else { return }
        
        userTitleLabel.text = "\(vm.userID): \(vm.title)"
        userDetailsLabel.text = vm.body
    }
}
