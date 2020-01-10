// FoodExtra.swift
// Created on 1/9/20. 

import UIKit

class FoodExtra: NSObject {

    var name = ""
    var price = 0.0
    
    init(name: String, price: Double) {
        super.init()
        self.name = name
        self.price = price
    }
}
