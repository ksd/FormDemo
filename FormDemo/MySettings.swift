//
//  MySettings.swift
//  FormDemo
//
//  Created by ksd on 28/02/2024.
//

import SwiftUI

struct MySettings: View {
    
    @Binding var showAddForm: Bool
    @EnvironmentObject var userController: UserController
    
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var nickName = ""
    @State private var birthDate = Date()
    @State private var interests = User.Interests.mma
    @State private var playNotification = false
    
    var body: some View {
        Form {
            Section("User Details") {
                TextField("First Name", text: $firstName)
                TextField("Last Name", text: $lastName)
                TextField("Nickname", text: $nickName)
            }
            Section("Personal Information") {
                DatePicker("Birthdate", selection: $birthDate, displayedComponents: [.date])
                Picker("Interest", selection: $interests){
                    ForEach(User.Interests.allCases){interest in
                        Text(interest.rawValue).tag(interest)
                    }
                }
                Toggle("Play notification Sound", isOn: $playNotification)
            }
            Button(action: {
                let user = User(firstName: firstName,
                                lastName: lastName,
                                nickName: nickName,
                                birthDate:  birthDate,
                                interest: interests,
                                playNotification: playNotification)
                userController.add(user)
                showAddForm = false
            }, label: {
                Text("Opret")
            })
        }
    }
}

#Preview {
    MySettings(showAddForm: .constant(true)).environmentObject(UserController())
}
