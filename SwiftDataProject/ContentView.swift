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

    @State
    private var showingUpcomingOnly = false

    @State
    private var sortOrder = [
        SortDescriptor(\User.name),
        SortDescriptor(\User.joinDate)
    ]

    var body: some View {
        NavigationStack {
            UsersView(minimumJoinDate: showingUpcomingOnly ? .now : .distantPast, sortOrder: sortOrder)
                .navigationTitle("Users")
                .toolbar {
                    Button("Add Samples", systemImage: "plus") {
                        try? modelContext.delete(model: User.self)

                        let first = User(name: "Clark Kent", city: "Metropolis", joinDate: .now.addingTimeInterval(86400 * -10))
                        let second = User(name: "Bruce Wayne", city: "Gotham", joinDate: .now.addingTimeInterval(86400 * -5))
                        let third = User(name: "Diana Prince", city: "Themyscira", joinDate: .now.addingTimeInterval(86400 * 5))
                        let fourth = User(name: "Hal Jordan", city: "Coast City", joinDate: .now.addingTimeInterval(86400 * 10))

                        modelContext.insert(first)
                        modelContext.insert(second)
                        modelContext.insert(third)
                        modelContext.insert(fourth)
                    }

                    Button(showingUpcomingOnly ? "Showing Everyone" : "Show Upcoming") {
                        showingUpcomingOnly.toggle()
                    }

                    Menu("Sort", systemImage: "arrow.up.arrow.down") {
                        Picker("Sort", selection: $sortOrder) {
                            Text("Sort by Name")
                                .tag([
                                    SortDescriptor(\User.name),
                                    SortDescriptor(\User.joinDate)
                                ])
                            
                            Text("Sort by Join Date")
                                .tag([
                                    SortDescriptor(\User.joinDate),
                                    SortDescriptor(\User.name)
                                ])
                        }
                    }
                }
        }
    }
}
