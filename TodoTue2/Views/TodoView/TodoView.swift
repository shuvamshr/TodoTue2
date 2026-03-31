//
//  TodoView.swift
//  TodoTue2
//
//  Created by Shuvam Shrestha on 17/3/2026.
//

import SwiftUI

struct TodoView: View {
    
    @State private var tasks: [TodoTask] = [
        TodoTask(
            title: "Organise workspace",
            description: "Clean desk and arrange files for better focus",
            isCompleted: true,
            priority: .low,
           
        ),
        TodoTask(
            title: "Prepare presentation slides",
            description: "Finalize content and visuals for tomorrow's meeting",
            priority: .medium
        ),
        TodoTask(
            title: "Submit assignment",
            description: "Complete and upload before the deadline",
            isCompleted: true,
            priority: .high
        ),
        TodoTask(
            title: "Read a few pages",
            description: "Spend 15 minutes reading a book before bed",
            priority: .low
        )
    ]
    
    var body: some View {

        NavigationStack {
            List {
                ForEach(tasks) { task in
                    TaskItemView(task: task, tasks: $tasks)
                        .swipeActions(edge: .trailing) {
                            NavigationLink {
                                EditTaskView(task: task, tasks: $tasks)
                            } label: {
                                Label("Edit", systemImage: "pencil")
                            }
                            .tint(Color.accentColor)
                            Button("Delete", systemImage: "trash.fill") {
                                // Delete
                            }
                            .tint(Color.red)
                        }
                }
            }
            .listStyle(.plain)
            .navigationTitle("Things To-Do")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
                        NewTaskView(tasks: $tasks)
                    } label: {
                        Label("Add New Task", systemImage: "plus")
                    }
                    .buttonStyle(.borderedProminent)
                }
            }
        }
    }
}





#Preview {
    TodoView()
}
