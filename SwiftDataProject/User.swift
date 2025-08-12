//
//  User.swift
//  SwiftDataProject
//
//  Created by Ahmed Juvale on 8/10/25.
//

import Foundation
import SwiftData

@Model
class User {
    var name: String
    var city: String
    var joinDate: Date

    @Relationship(deleteRule: .cascade)
    var jobs = [Job]()

    init(name: String, city: String, joinDate: Date) {
        self.name = name
        self.city = city
        self.joinDate = joinDate
    }
}
