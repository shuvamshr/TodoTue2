//
//  TaskItemView.swift
//  TodoTue2
//
//  Created by Shuvam Shrestha on 31/3/2026.
//

import SwiftUI

struct TaskItemView: View {
    
    var task: TodoTask
    
    @Binding var tasks: [TodoTask]

    var body: some View {
        
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 4) {
                Text(task.priority.rawValue)
                    .font(.caption2)
                    .fontWeight(.heavy)
                    .foregroundStyle(task.priority.color)
                Text(task.title)
                    .font(.headline)
                    .foregroundStyle(Color.primary)
                Text(task.description)
                    .font(.subheadline)
                    .foregroundStyle(Color.secondary)
            }
            
            Spacer()
            
            Button {
                toggleTaskCompletion()
            } label: {
                if task.isCompleted {
                    Image(systemName: "checkmark.circle.fill")
                        .font(.title)
                        .foregroundStyle(Color.green)
                } else {
                    Image(systemName: "circle")
                        .font(.title)
                        .foregroundStyle(Color.secondary.opacity(0.5))
                }
            }
            
            
        }
        .padding(.vertical, 4)
    }
    
    private func toggleTaskCompletion() {
        if let index = tasks.firstIndex(where: { iTask in
            iTask.id == task.id
        }) {
            tasks[index].isCompleted.toggle()
        }
    }
}
