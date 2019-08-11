//
//  TasksTest.swift
//  TasksTest
//
//  Created by Kelvin Fok on 11/8/19.
//  Copyright © 2019 Kelvin Fok. All rights reserved.
//

import XCTest
@testable import ToDoList

class TasksTest: XCTestCase {
    
    var sut: TasksViewModel!
    
    var tasks: [Task] = [
        Task(title: "Task 1", isCompleted: false, notes: "Notes 1"),
        Task(title: "Task 2", isCompleted: false, notes: "Notes 2"),
        Task(title: "Task 3", isCompleted: true, notes: "Notes 3"),
        Task(title: "Task 4", isCompleted: true, notes: "Notes 4")
    ]

    override func setUp() {
        super.setUp()
        sut = TasksViewModel()
    }

    override func tearDown() {
        super.tearDown()
        sut = nil
    }

    func test_addTasks_checkCount() {
        sut = TasksViewModel(tasks: tasks)
        XCTAssertEqual(sut.count, tasks.count)
    }
    
    func test_addNewTest_checkCount() {
        let newTask = Task(title: "New Task", isCompleted: true, notes: "Notes")
        sut.addNew(task: newTask)
        let count = sut.count
        let latestTask = sut.itemAtIndex(count - 1)
        XCTAssertEqual(latestTask, newTask)
    }
    
    func test_updatedCompletedState() {
        let newTask = Task(title: "New Task", isCompleted: false, notes: "Notes")
        sut.addNew(task: newTask)
        XCTAssertEqual(sut.itemAtIndex(0).isCompleted, false)
        sut.updateCompletedState(index: 0, value: true)
        let firstTask = sut.itemAtIndex(0)
        XCTAssertEqual(firstTask.isCompleted, true)
    }
    
    func test_addTask() {
        XCTAssertEqual(sut.count, 0)
        sut.addDummyDataIfNeeded()
        XCTAssertEqual(sut.count > 0, true)

    }


}
