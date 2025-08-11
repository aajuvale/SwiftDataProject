//
//  ContentView.swift
//  SwiftDataProject
//
//  Created by Ahmed Juvale on 8/9/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext)
    var modelContext

    @Query(filter: #Predicate<User> { user in
        if user.name.localizedStandardContains("r") {
            if user.city == "Metropolis" {
                return true
            }
            else {
                return false
            }
        }
        else {
            return false
        }
    }, sort: \User.name)
    var users: [User]

    var body: some View {
        NavigationStack {
            List(users) { user in
                Text(user.name)
            }
            .navigationTitle("Users")
            .toolbar {
                Button("Add Samples", systemImage: "plus") {
                    try? modelContext.delete(model: User.self)

                    let first = User(name: "Clark Kent", city: "Metropolis", joinDate: .now.addingTimeInterval(86400 * -10))
                    let second = User(name: "Bruce Wayne", city: "Gotham", joinDate: .now.addingTimeInterval(86400 * 5))
                    let third = User(name: "Diana Prince", city: "Themyscira", joinDate: .now.addingTimeInterval(86400 * 5))
                    let fourth = User(name: "Hal Jordan", city: "Coast City", joinDate: .now.addingTimeInterval(86400 * 10))

                    modelContext.insert(first)
                    modelContext.insert(second)
                    modelContext.insert(third)
                    modelContext.insert(fourth)
                }
            }
        }
    }
}
