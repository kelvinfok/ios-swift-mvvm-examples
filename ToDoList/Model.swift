//
//  Model.swift
//  ToDoList
//
//  Created by Kelvin Fok on 9/8/19.
//  Copyright © 2019 Kelvin Fok. All rights reserved.
//

import Foundation

struct Task: Equatable {
    let title: String
    var isCompleted: Bool
    let notes: String
}

class TasksViewModel {
    
    private var tasks: [Task]
    
    var count: Int {
        return tasks.count
    }
    
    init(tasks: [Task] = []) {
        self.tasks = tasks
        // addDummyDataIfNeeded()
    }
    
    func addDummyDataIfNeeded() {
        guard self.tasks.isEmpty == true else { return }
        for i in 0..<10 {
            let task = Task(title: "Task \(i)", isCompleted: false, notes: "This is a sample task.")
            tasks.append(task)
        }
    }
    
    func itemAtIndex(_ index: Int) -> Task {
        return self.tasks[index]
    }
    
    func updateCompletedState(index: Int, value: Bool) {
        self.tasks[index].isCompleted = value
    }
    
    func addNew(task: Task) {
        self.tasks.append(task)
    }
    
}

class NewTaskViewModel {
    
    private var _task: Task?
    
    var task: Task? {
        get {
            return _task
        }
        set {
            _task = newValue
        }
    }

    
}
