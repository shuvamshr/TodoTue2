//
//  ContentView.swift
//  TodoTue2
//
//  Created by Shuvam Shrestha on 17/3/2026.
//

import SwiftUI


struct TodoTask: Identifiable {
    var id: UUID = UUID()
    
    var title: String
    var description: String
    var isComplete: Bool = false
}

struct ContentView: View {
    
    var tasks: [TodoTask] = [
        TodoTask(title: "My First Task", description: "Some Description About First Task"),
        TodoTask(title: "My Second Task", description: "Some Description About Second Task"),
        TodoTask(title: "My Third Task", description: "Some Description About Third Task", isComplete: true),
    ]
    
    var body: some View {
        ScrollView {
            ForEach(tasks) { task in
                TaskItemView(task: task)
            }
        }
    }
}

struct TaskItemView: View {
    
    var task: TodoTask
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 4) {
                Text(task.title)
                    .font(.headline)
                    .foregroundStyle(Color.primary)
                   
                Text(task.description)
                    .font(.subheadline)
                    .foregroundStyle(Color.secondary)
                    
            }
            
            Spacer()
            
            if task.isComplete {
                Image(systemName: "checkmark.circle.fill")
                    .font(.title)
                    .foregroundStyle(Color.green)
            } else {
                Image(systemName: "circle")
                    .font(.title)
                    .foregroundStyle(Color.secondary)
            }
            
            
        }
        .padding()
    }
}


#Preview {
    ContentView()
}
