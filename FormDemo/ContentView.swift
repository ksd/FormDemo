//
//  ContentView.swift
//  FormDemo
//
//  Created by ksd on 28/02/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var showAddForm = false
    @State private var showDeleteAlert = false
    @EnvironmentObject var userController: UserController
    @State private var deletingUser: User?
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(userController.users) { user in
                    HStack{
                        Text(user.firstName)
                        Text(user.lastName)
                    }
                    .swipeActions(allowsFullSwipe: false) {
                        Button(role:.destructive, action: {
                            showDeleteAlert = true
                            deletingUser = user
                        }, label: {
                            Label("Delete", systemImage: "trash")
                        })
                    }
                }
            }
            .overlay {
                if userController.users.isEmpty {
                    ContentUnavailableView(
                        label: { Image("bog").clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)},
                        description: {Text("Klik på knappen herunder for at oprette")},
                        actions: {Button(action: {showAddForm = true}, label: {
                            Text("Opret ny bruger")
                        })}
                    )
                }
            }
            .navigationTitle("🧑🏻‍💻 FormDemo")
            .toolbar{
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        showAddForm.toggle()
                    }, label: {
                        Image(systemName: "person.badge.plus")
                    })
                }
            }
        }
        .sheet(isPresented: $showAddForm) {
            MySettings(showAddForm: $showAddForm)
        }
        .alert(isPresented: $showDeleteAlert) {
            Alert(title: Text("Vil du slette?"),
                  message: Text("Vil du slette \(deletingUser?.firstName ?? "personen")"),
                  primaryButton: .destructive(Text("Slet"), action: {
                if let deletingUser {
                    userController.delete(deletingUser)
                }
                deletingUser = nil
                
            }),
                  secondaryButton: .cancel(Text("Annuller"), action: {}))
        }
    }
}

#Preview {
    ContentView().environmentObject(UserController())
}
