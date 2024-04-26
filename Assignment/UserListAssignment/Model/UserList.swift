//
//  UserList.swift
//  UserListAssignment
//
//  Created by Abhishek on 26/04/24.
//

import Foundation

struct UserListElement: Codable {
    let userID, id: Int
    let title, body: String

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}

typealias UserList = [UserListElement]
