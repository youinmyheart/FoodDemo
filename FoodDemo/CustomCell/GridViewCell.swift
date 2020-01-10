// GridViewCell.swift
// Created on 1/7/20. 

import UIKit

class GridViewCell: UICollectionViewCell {
    
    @IBOutlet weak var m_imageFood: UIImageView!
    @IBOutlet weak var m_lblFoodCategory: UILabel!
    @IBOutlet weak var m_lblFoodName: UILabel!
    @IBOutlet weak var m_lblFoodDetail: UILabel!
    @IBOutlet weak var m_imageTime: UIImageView!
    
    public func configure(with model: Food) {
        m_imageFood.image = model.foodImage
        m_imageFood.layer.cornerRadius = 5
        
        let category = model.foodCategory.first
        if let category = category {
            m_lblFoodCategory.text = "\(category) >"
        }
        
        m_lblFoodName.text = model.foodName
        
        let detail = "\(model.minDeliveryTime)-\(model.maxDeliveryTime) . \(model.numPerson) person"
        m_lblFoodDetail.text = detail
    }
}
