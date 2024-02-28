//
//  User.swift
//  FormDemo
//
//  Created by ksd on 28/02/2024.
//

import Foundation

struct User: Identifiable {
    var id = UUID().uuidString
    
    let firstName: String
    let lastName: String
    let nickName: String
    let birthDate: Date
    let interest: Interests
    let playNotification: Bool
    
    enum Interests: String, CaseIterable, Identifiable {
        case gaming = "Gaming"
        case mma = "MMA"
        case tennis = "Tennis"
        
        var id: Self {self}
    }
    
}
