//
//  SimpleListViewModel.swift
//  project-1
//
//  Created by Kelvin Fok on 9/8/19.
//  Copyright © 2019 Kelvin Fok. All rights reserved.
//

import Foundation

class SimpleListViewModel {
    
    private var simpleModel: [SimpleModel]
    
    var count: Int {
        return simpleModel.count
    }
    
    init() {
        self.simpleModel = [
            SimpleModel(text: "Orange", color: .orange),
            SimpleModel(text: "Blue", color: .blue),
            SimpleModel(text: "Green", color: .green),
            SimpleModel(text: "Purple", color: .purple),
            SimpleModel(text: "Cyan", color: .cyan)
        ]
    }
    
    func getModelAt(_ index: Int) -> SimpleModel {
        return simpleModel[index]
    }
}
