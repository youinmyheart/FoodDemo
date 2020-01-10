// FoodDetail.swift
// Created on 1/9/20. 

import UIKit

class FoodDetail: NSObject {

    var extraImage1: UIImage?
    var extraImage2: UIImage?
    var numQuantity = 0
    var foodDescription = ""
    var foodIngredients = ""
    var numCalories = 0
    var numProtein = 0
    var numTotalFat = 0
    var numTotalCarbs = 0
    var foodExtra: [FoodExtra]?
    var numPlates = 0
    
    init(extraImage1: UIImage?, extraImage2: UIImage?, numQuantity: Int, foodDescription: String, foodIngredients: String, numCalories: Int, numProtein: Int, numTotalFat: Int, numTotalCarbs: Int, foodExtra: [FoodExtra]?, numPlates: Int) {
        super.init()
        self.extraImage1 = extraImage1
        self.extraImage2 = extraImage2
        self.numQuantity = numQuantity
        self.foodDescription = foodDescription
        self.foodIngredients = foodIngredients
        self.numCalories = numCalories
        self.numProtein = numProtein
        self.numTotalFat = numTotalFat
        self.numTotalCarbs = numTotalCarbs
        self.foodExtra = foodExtra
        self.numPlates = numPlates
    }
}
