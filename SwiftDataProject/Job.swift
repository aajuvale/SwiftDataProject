//
//  Job.swift
//  SwiftDataProject
//
//  Created by Ahmed Juvale on 8/11/25.
//

import Foundation
import SwiftData

@Model
class Job {
    var name: String = "Name"
    var priority: Int = 1
    var owner: User?

    init(name: String, priority: Int, owner: User? = nil) {
        self.name = name
        self.priority = priority
        self.owner = owner
    }
}
