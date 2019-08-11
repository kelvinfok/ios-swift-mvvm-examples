//
//  DataSourceTest.swift
//  TasksTest
//
//  Created by Kelvin Fok on 11/8/19.
//  Copyright © 2019 Kelvin Fok. All rights reserved.
//

import XCTest
@testable import ToDoList

class DataSourceTest: XCTestCase {
    
    var sut: TaskDataSourceDelegate!
    
    let tasks: [Task] = [
        Task(title: "Task 1", isCompleted: false, notes: "Notes 1"),
        Task(title: "Task 2", isCompleted: false, notes: "Notes 2"),
        Task(title: "Task 3", isCompleted: true, notes: "Notes 3"),
        Task(title: "Task 4", isCompleted: true, notes: "Notes 4")
    ]

    override func setUp() {
        let tasksViewModel = TasksViewModel(tasks: tasks)
        sut = TaskDataSourceDelegate(viewModel: tasksViewModel)
    }

    override func tearDown() {
        super.tearDown()
        sut = nil
    }

    func test_DataSourceCount_EqualsTasksViewModelCount() {
        XCTAssertEqual(sut.viewModel.count, tasks.count)
    }
    
    func test_RowCount_EqualsTasksViewModelCount() {
        let tableView = UITableView()
        let count = sut.tableView(tableView, numberOfRowsInSection: 0)
        let taskCount = tasks.count
        XCTAssertEqual(count, taskCount)
        let newTask = Task(title: "Task", isCompleted: true, notes: "")
        sut.viewModel.addNew(task: newTask)
        let newCount = sut.tableView(tableView, numberOfRowsInSection: 0)
        XCTAssertEqual(newCount, taskCount + 1)
    }
    
    func test_cellAccessoryType() {
        let tableView = UITableView()
        let firstIndexPath = IndexPath(row: 0, section: 0)
        let lastIndexPath = IndexPath(row: tasks.count - 1, section: 0)
        let firstCell = sut.tableView(tableView, cellForRowAt: firstIndexPath)
        XCTAssertEqual(firstCell.accessoryType, .none)
        let lastCell = sut.tableView(tableView, cellForRowAt: lastIndexPath)
        XCTAssertEqual(lastCell.accessoryType, .checkmark)

    }

}
