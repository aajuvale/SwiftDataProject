//
//  SwiftDataProjectApp.swift
//  SwiftDataProject
//
//  Created by Ahmed Juvale on 8/9/25.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataProjectApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
