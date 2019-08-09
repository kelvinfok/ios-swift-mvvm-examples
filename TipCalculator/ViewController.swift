//
//  ViewController.swift
//  TipCalculator
//
//  Created by Kelvin Fok on 9/8/19.
//  Copyright © 2019 Kelvin Fok. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var totalAmountTextField: UITextField!
    @IBOutlet weak var tipPercentageSegmentedControl: UISegmentedControl!
    @IBOutlet weak var numberOfPeopleTextField: UITextField!
    @IBOutlet weak var totalAmountLabel: UILabel!
    @IBOutlet weak var tipAmountLabel: UILabel!
    
    var viewModel = TipViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Tip Calculator"
        setupGesture()
    }
    
    private func setupGesture() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapOnScreen))
        view.addGestureRecognizer(gesture)
    }
    
    @objc func didTapOnScreen() {
        
        view.endEditing(true)
        
        let totalAmount = totalAmountTextField.text?.toDouble ?? 0.0
        let selectedIndex = tipPercentageSegmentedControl.selectedSegmentIndex
        let tipPercentage = tipPercentageSegmentedControl.titleForSegment(at: selectedIndex)?.toDouble ?? 0.0
        let numberOfPeople = numberOfPeopleTextField.text?.toDouble ?? 1.0
        
        let tip = Tip(totalAmount: totalAmount,
                      tipPercentage: tipPercentage,
                      numberOfPeople: numberOfPeople)
        
        let result = viewModel.calculate(tip: tip)
        totalAmountLabel.text = "Total Amount Per Pax: $\(result.totalAmountPerPax)"
        tipAmountLabel.text = "Tip Amount Per Pax: $\(result.tipAmountPerPax)"
        
    }


}

