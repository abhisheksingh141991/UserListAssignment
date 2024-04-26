//
//  UserListViewModel.swift
//  UserListAssignment
//
//  Created by Abhishek on 26/04/24.
//

import Foundation
protocol UserListViewModelDelegate {
    func didReceive(vm: UserList?)
}

class UserListViewModel {
    var delegate: UserListViewModelDelegate?
    var resource = Resource()
    
    func fetchUserList(page: Int) {
        resource.getUserList(page: page) { response in
            self.delegate?.didReceive(vm: response)
        }
    }
}
