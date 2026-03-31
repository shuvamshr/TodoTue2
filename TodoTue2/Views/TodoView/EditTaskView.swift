//
//  EditTaskView.swift
//  TodoTue2
//
//  Created by Shuvam Shrestha on 31/3/2026.
//

import SwiftUI

struct EditTaskView: View {
    
    var task: TodoTask
    @Binding var tasks: [TodoTask]
    
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var priority: Priority = .medium
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        Form {
            Section {
                TextField("Task Title", text: $title)
                    .bold()
                TextEditor(text: $description)
            } header: {
                Text("Task Details")
            }
            Picker("Select Prioirity", selection: $priority) {
                ForEach(Priority.allCases, id: \.self) { priority in
                    Text(priority.rawValue)
                        .tag(priority)
                }
            }
        }
        .navigationTitle("Edit Task")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    updateTask()
                    dismiss()
                } label: {
                    Label("Save", systemImage: "checkmark")
                }
                .buttonStyle(.borderedProminent)
                .disabled(!isValidForm)
            }
        }
        .onAppear {
            title = task.title
            description = task.description
            priority = task.priority
        }
    }
    
    
    private var isValidForm: Bool {
        if title.isEmpty {
            return false
        } else {
            return true
        }
    }
    
    private func updateTask() {
        if let index = tasks.firstIndex(where: { iTask in
            iTask.id == task.id
        }) {
            tasks[index].title = title
            tasks[index].description = description
            tasks[index].priority = priority
            
        }
    }
}
