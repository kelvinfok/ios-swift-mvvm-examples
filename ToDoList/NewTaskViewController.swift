//
//  NewTaskViewController.swift
//  ToDoList
//
//  Created by Kelvin Fok on 9/8/19.
//  Copyright © 2019 Kelvin Fok. All rights reserved.
//

import UIKit

protocol AddNewTaskProtocol: class {
    func didAddTask(taskViewModel: NewTaskViewModel)
}

class NewTaskViewController: UIViewController {
    
    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var memoTextField: UITextField!
    
    var newTaskViewModel = NewTaskViewModel()
    weak var delegate: AddNewTaskProtocol?
    
    @IBAction func didTapDoneButton(_ sender: UIBarButtonItem) {
        let title = taskNameTextField.text ?? "Untitled"
        let notes = memoTextField.text ?? "No notes"
        let task = Task(title: title, isCompleted: false, notes: notes)
        self.newTaskViewModel.task = task
        self.delegate?.didAddTask(taskViewModel: newTaskViewModel)
        self.navigationController?.popViewController(animated: true)
    }
    
}
