//
//  ViewController.swift
//  ToDoList
//
//  Created by Kelvin Fok on 9/8/19.
//  Copyright © 2019 Kelvin Fok. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var tasksViewModel: TasksViewModel!
    var dataSource: TaskDataSourceDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tasksViewModel = TasksViewModel()
        self.dataSource = TaskDataSourceDelegate(viewModel: self.tasksViewModel)
        self.dataSource.delegate = self
        self.tableView.delegate = dataSource
        self.tableView.dataSource = dataSource
        self.tableView.estimatedRowHeight = 100
        self.tableView.rowHeight = UITableView.automaticDimension
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! NewTaskViewController
        destination.delegate = self
    }
}

extension TableViewController: AddNewTaskProtocol {
    
    func didAddTask(taskViewModel: NewTaskViewModel) {
        if let task = taskViewModel.task {
            tasksViewModel.addNew(task: task)
        }
    }    
}

extension TableViewController: TaskTappedDelegate {
    
    func setCompletedState(index: Int, completion: @escaping () -> Void) {
        let alertVC = UIAlertController(title: "Mark completed?", message: nil, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.tasksViewModel.updateCompletedState(index: index, value: true)
            completion()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertVC.addAction(okAction)
        alertVC.addAction(cancelAction)
        self.present(alertVC, animated: true, completion: nil)
    }
}
