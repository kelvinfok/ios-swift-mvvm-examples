//
//  ViewController.swift
//  project-1
//
//  Created by Kelvin Fok on 9/8/19.
//  Copyright © 2019 Kelvin Fok. All rights reserved.
//

import UIKit

class SimpleMVVMVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var viewModel = SimpleListViewModel()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        let data = viewModel.getModelAt(indexPath.item)
        cell.backgroundColor = data.color
        cell.textLabel?.text = data.text
        return cell
    }
    

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Simple MVVM"
    }


}

