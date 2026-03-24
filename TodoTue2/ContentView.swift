//
//  ContentView.swift
//  TodoTue2
//
//  Created by Shuvam Shrestha on 17/3/2026.
//

import SwiftUI

// Model

struct TodoTask: Identifiable {
    var id: UUID = UUID()
    
    var title: String
    var description: String
    var isComplete: Bool = false
    var priority: Priority = .medium
}

enum Priority: String, CaseIterable {
    case low = "Low Priority"
    case medium = "Medium Priority"
    case high = "High Priority"
    case urgent = "Urgent Priority"
}

// Home Page

struct ContentView: View {
    
    @State private var tasks: [TodoTask] = [
        TodoTask(title: "My First Task", description: "Some Description About First Task"),
        TodoTask(title: "My Second Task", description: "Some Description About Second Task"),
        TodoTask(title: "My Third Task", description: "Some Description About Third Task", isComplete: true),
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ForEach(tasks) { task in
                    TaskItemView(task: task)
                }
            }
            .navigationTitle("Things To-Do")
            .navigationBarTitleDisplayMode(.inline)
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




// Component


struct TaskItemView: View {
    
    var task: TodoTask
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 4) {
                Button(task.priority.rawValue) {
                    
                }
                    .buttonStyle(.borderedProminent)
                    .controlSize(.mini)
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

// New Task Page

struct NewTaskView: View {
    
    @Binding var tasks: [TodoTask]
    
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var priority: Priority = .medium
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        Form {
            TextField("Enter Title", text: $title)
            TextEditor(text: $description)
            Picker("Select Priority", selection: $priority) {
                ForEach(Priority.allCases, id: \.self) { priority in
                    Text(priority.rawValue)
                        .tag(priority)
                }
            }
        
        }
        .navigationTitle("New Task Form")
        .navigationBarTitleDisplayMode(.inline)
   
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    addNewTask()
                    dismiss()
                } label: {
                    Label("Save", systemImage: "checkmark")
                }
                .buttonStyle(.borderedProminent)
                .disabled(!isFieldValid)
            }
        }
        
    }
    
    private func addNewTask() {
        let newTask: TodoTask = TodoTask(title: title, description: description, priority: priority)
        
        tasks.append(newTask)
    }
    
    var isFieldValid: Bool {
        if title.isEmpty {
            return false
        } else {
            return true
        }
    }
}



#Preview {
    ContentView()
}
