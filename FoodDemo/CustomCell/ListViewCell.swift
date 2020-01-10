// ListViewCell.swift
// Created on 1/7/20. 

import UIKit

class ListViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageFood: UIImageView!
    @IBOutlet weak var lblFoodName: UILabel!
    @IBOutlet weak var lblFoodCategory: UILabel!
    @IBOutlet weak var lblFoodDelivery: UILabel!
    @IBOutlet weak var imageStar: UIImageView!
    @IBOutlet weak var lblFoodRate: UILabel!
    @IBOutlet weak var extraImage: UIImageView!
    
    override var isSelected: Bool {
        didSet {
            self.backgroundColor = isSelected ? .gray : .white
        }
    }
    
    public func configure(with model: Food) {
        imageFood.image = model.foodImage
        imageFood.layer.cornerRadius = 5
        extraImage.image = model.extraImage
        lblFoodName.text = model.foodName
        
        var category = ""
        for (index, item) in model.foodCategory.enumerated() {
            if index == 0 {
                category = "\(item)"
            } else {
                category = "\(category), \(item)"
            }
        }
        lblFoodCategory.text = category
        
        let delivery = "Order from $\(model.foodPrice) . \(model.maxDeliveryTime) min delivery"
        lblFoodDelivery.text = delivery
        
        lblFoodRate.text = "\(model.numStarRate)"
    }
}
