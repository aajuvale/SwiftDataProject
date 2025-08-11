//
//  UsersView.swift
//  SwiftDataProject
//
//  Created by Ahmed Juvale on 8/11/25.
//

import SwiftUI
import SwiftData

struct UsersView: View {
    @Query
    var users: [User]

    var body: some View {
        List(users) { user in
            Text(user.name)
        }
    }

    init(minimumJoinDate: Date, sortOrder: [SortDescriptor<User>]) {
        _users = Query(filter: #Predicate<User> { user in
            user.joinDate >= minimumJoinDate
        }, sort: sortOrder)
    }
}
