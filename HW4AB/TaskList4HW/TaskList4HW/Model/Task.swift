//
//  Task.swift
//  TaskList4HW
//
//  Created by sam on 6/24/24.
//

import Foundation

struct Task: Identifiable {
    var id: UUID = UUID()
    var title: String
    var isCompleted: Bool
    var notes: String
}
