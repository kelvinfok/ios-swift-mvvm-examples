//
//  TaskDataSourceDelegate.swift
//  ToDoList
//
//  Created by Kelvin Fok on 9/8/19.
//  Copyright © 2019 Kelvin Fok. All rights reserved.
//

import UIKit

protocol TaskTappedDelegate: class {
    func setCompletedState(index: Int, completion: @escaping () -> Void)
}

class TaskDataSourceDelegate: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    var viewModel: TasksViewModel!
    weak var delegate: TaskTappedDelegate?
    
    init(viewModel: TasksViewModel) {
        self.viewModel = viewModel
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        let task = self.viewModel.itemAtIndex(indexPath.item)
        cell.textLabel?.text = task.title
        cell.detailTextLabel?.text = task.notes
        cell.textLabel?.textColor = task.isCompleted ? .gray : .black
        cell.detailTextLabel?.textColor = task.isCompleted ? .gray : .black
        cell.accessoryType = task.isCompleted ? .checkmark : .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.setCompletedState(index: indexPath.item, completion: {
            tableView.reloadRows(at: [indexPath], with: .automatic)
        })
        tableView.deselectRow(at: indexPath, animated: true)
    }    
}
