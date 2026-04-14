//
//  TodoTaskViewModel.swift
//  TodoTue2
//
//  Created by Shuvam Shrestha on 14/4/2026.
//

import Foundation
import Combine


class TodoTaskViewModel: ObservableObject {
    // tasks
    @Published var tasks: [TodoTask] = []
    
    init() {
        let sampleTasks: [TodoTask] = [
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
        
        self.tasks = sampleTasks
    }
    
    // func add task
    
    func addTask(_ task: TodoTask) {
        tasks.append(task)
    }
    
    // func update task
    
    func updateTask(id: UUID, updatedTask: TodoTask) {
        if let index = tasks.firstIndex(where: { iTask in
            iTask.id == id
        }) {
            tasks[index].title = updatedTask.title
            tasks[index].description = updatedTask.description
            tasks[index].priority = updatedTask.priority
            
        }
    }
    
    // func delete task
}
