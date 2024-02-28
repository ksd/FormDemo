//
//  FormDemoApp.swift
//  FormDemo
//
//  Created by ksd on 28/02/2024.
//

import SwiftUI

@main
struct FormDemoApp: App {
    @State private var userController = UserController()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(userController)
        }
    }
}
