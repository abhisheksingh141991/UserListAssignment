//
//  ViewController.swift
//  UserListAssignment
//
//  Created by Abhishek on 26/04/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel = UserListViewModel()

    var userList: UserList = []
    var currentPage = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchUserList()
    }
    
    private func fetchUserList() {
        viewModel.fetchUserList(page: currentPage)
        viewModel.delegate = self
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UserTableViewCell.identifire, for: indexPath) as! UserTableViewCell
        cell.renderCell(vm: userList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let view = storyboard?.instantiateViewController(withIdentifier: UserDetailViewController.identifire) as! UserDetailViewController
        view.userDetails = userList[indexPath.row]
        self.navigationController?.pushViewController(view, animated: true)
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height

        if offsetY > contentHeight - scrollView.frame.size.height {
            currentPage += 1
            fetchUserList()
        }
    }
}

extension ViewController: UserListViewModelDelegate {
    func didReceive(vm: UserList?) {
        if let vm = vm {
            userList.append(contentsOf: vm)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}

