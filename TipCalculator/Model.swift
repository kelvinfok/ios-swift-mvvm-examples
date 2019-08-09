//
//  Model.swift
//  TipCalculator
//
//  Created by Kelvin Fok on 9/8/19.
//  Copyright © 2019 Kelvin Fok. All rights reserved.
//

import Foundation

struct Tip {
    var totalAmount: Double
    var tipPercentage: Double
    var numberOfPeople: Double
}

class TipViewModel {
    
    func calculate(tip: Tip) -> (tipAmountPerPax: Double, totalAmountPerPax: Double) {
        let tipAmount = (tip.tipPercentage / 100) * tip.totalAmount
        let totalAmount = tip.totalAmount + tipAmount
        let tipAmountPerPax = tipAmount / tip.numberOfPeople
        let totalAmountPerPax = totalAmount / tip.numberOfPeople
        return (tipAmountPerPax, totalAmountPerPax)
    }
}

extension Double {
    var toString: String {
        return String.init(format: "%0.2f", self)
    }
}

extension String {
    var toDouble: Double? {
        return Double(self)
    }
}
