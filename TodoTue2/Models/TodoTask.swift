//
//  TodoTask.swift
//  TodoTue2
//
//  Created by Shuvam Shrestha on 31/3/2026.
//

import SwiftUI

struct TodoTask: Identifiable {
    var id: UUID = UUID()
    var title: String = "Untitled"
    var description: String = "No Description Provided"
    var isCompleted: Bool = false
    var priority: Priority = .medium
}

enum Priority: String, CaseIterable {
    case low = "Low Priority"
    case medium = "Medium Priority"
    case high = "High Priority"
    
    var color: Color {
        switch self {
        case .low:
            Color.green
        case .medium:
            Color.orange
        case .high:
            Color.red
        }
    }
}
