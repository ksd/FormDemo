//
//  UserController.swift
//  FormDemo
//
//  Created by ksd on 28/02/2024.
//

import Foundation

class UserController: ObservableObject {
    @Published var users = [User]()
    
    func add(_ user: User) {
        users.append(user)
    }
    
    func delete(_ user: User) {
        users.removeAll {$0.id == user.id}
    }
}
