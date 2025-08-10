//
//  EditUserView.swift
//  SwiftDataProject
//
//  Created by Ahmed Juvale on 8/10/25.
//

import SwiftUI

struct EditUserView: View {
    @Bindable
    var user: User

    var body: some View {
        Form {
            TextField("Name", text: $user.name)
            TextField("City", text: $user.city)
            DatePicker("Join Date", selection: $user.joinDate)
        }
        .navigationTitle("Edit User")
        .navigationBarTitleDisplayMode(.inline)
    }
}

