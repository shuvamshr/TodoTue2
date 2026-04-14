//
//  TodoView.swift
//  TodoTue2
//
//  Created by Shuvam Shrestha on 17/3/2026.
//

import SwiftUI

struct TodoView: View {
    
    @StateObject private var todoTaskViewModel = TodoTaskViewModel()
    
    @State private var tasks: [TodoTask] = [
        
    ]
    
    var body: some View {

        NavigationStack {
            List {
                ForEach(todoTaskViewModel.tasks) { task in
                    TaskItemView(task: task, tasks: $tasks)
                        .swipeActions(edge: .trailing) {
                            NavigationLink {
                                EditTaskView(task: task, todoTaskViewModel: todoTaskViewModel)
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
                        NewTaskView(todoTaskViewModel: todoTaskViewModel)
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
