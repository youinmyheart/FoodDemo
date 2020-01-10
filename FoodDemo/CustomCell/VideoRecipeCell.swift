// VideoRecipeCell.swift
// Created on 1/8/20. 

import UIKit

class VideoRecipeCell: UITableViewCell {

    @IBOutlet weak var imvFood: UIImageView!
    @IBOutlet weak var imvPlayVideo: UIImageView!
    @IBOutlet weak var lblFoodName: UILabel!
    @IBOutlet weak var lblFoodCategory: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    public func configure(with model: Food) {
        imvFood.image = model.foodImage
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
    }
}
