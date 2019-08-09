//
//  TipCalculatorTests.swift
//  TipCalculatorTests
//
//  Created by Kelvin Fok on 9/8/19.
//  Copyright © 2019 Kelvin Fok. All rights reserved.
//

import XCTest
@testable import TipCalculator

class TipCalculatorTests: XCTestCase {
    
    var sut: TipViewModel!

    override func setUp() {
        self.sut = TipViewModel()
    }

    override func tearDown() {
        sut = nil
    }

    func testTotalAmountPerPaxExample() {
        let tip = Tip(totalAmount: 10, tipPercentage: 50, numberOfPeople: 1)
        let result = sut.calculate(tip: tip)
        XCTAssertEqual(result.totalAmountPerPax, 15.0)
    }
    
    func testDoubleExtension() {
        var value: Double
        value = 5.0
        let valueString = value.toString
        XCTAssertEqual(valueString, "5.00")
    }
    
    func testStringExtension() {
        let string = "10.0"
        let stringDouble = string.toDouble
        XCTAssertEqual(stringDouble, 10.0)
    }


}
