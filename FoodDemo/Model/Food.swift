// Food.swift
// Created on 1/7/20. 

import UIKit

class Food: NSObject {

    enum FoodType {
        case Recipe
        case VideoRecipe
    }
    
    var foodImage: UIImage?
    var foodName = ""
    var foodCategory = [String]()
    var minDeliveryTime = 0
    var maxDeliveryTime = 0
    var numPerson = 0
    
    var extraImage: UIImage?
    var foodPrice = 0
    var numStarRate = 0.0
    
    var foodType = FoodType.Recipe
    var foodDetail: FoodDetail?
    
    init(foodImage: UIImage?, foodName: String, foodCategory: [String],
         minDeliveryTime: Int, maxDeliveryTime: Int, numPerson: Int,
         extraImage: UIImage?, foodPrice: Int, numStarRate: Double) {
        super.init()
        self.foodImage = foodImage
        self.foodName = foodName
        self.foodCategory = foodCategory
        self.minDeliveryTime = minDeliveryTime
        self.maxDeliveryTime = maxDeliveryTime
        self.numPerson = numPerson
        self.extraImage = extraImage
        self.foodPrice = foodPrice
        self.numStarRate = numStarRate
    }
    
    init(foodImage: UIImage?, foodName: String, foodCategory: [String],
         minDeliveryTime: Int, maxDeliveryTime: Int, numPerson: Int,
         extraImage: UIImage?, foodPrice: Int, numStarRate: Double, foodType: FoodType,
         foodDetail: FoodDetail) {
        super.init()
        self.foodImage = foodImage
        self.foodName = foodName
        self.foodCategory = foodCategory
        self.minDeliveryTime = minDeliveryTime
        self.maxDeliveryTime = maxDeliveryTime
        self.numPerson = numPerson
        self.extraImage = extraImage
        self.foodPrice = foodPrice
        self.numStarRate = numStarRate
        self.foodType = foodType
        self.foodDetail = foodDetail
    }
}
