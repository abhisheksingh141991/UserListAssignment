//
//  Resource.swift
//  UserListAssignment
//
//  Created by Abhishek on 26/04/24.
//

import Foundation
struct Resource {
    let httpUtility = HttpUtility()
    let baseUrl = "https://jsonplaceholder.typicode.com"

    func getUserList(page: Int, completion : @escaping (_ result: UserList?) -> Void) {
        let requestUrl = URL(string: "\(baseUrl)/posts?page=\(page)")
        do {
            httpUtility.getData(requestUrl: requestUrl, resultType: UserList.self) { (result) in
                _ = completion(result)
            }
        }
    }
}
