// RecipeCell.swift
// Created on 1/8/20. 

import UIKit

class RecipeCell: UITableViewCell {

    @IBOutlet weak var imvFood: UIImageView!
    @IBOutlet weak var lblFoodName: UILabel!
    @IBOutlet weak var imvTime: UIImageView!
    @IBOutlet weak var lblRecipeTime: UILabel!
    
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
        imvFood.layer.cornerRadius = 5
        lblFoodName.text = model.foodName
        
        let detail = "\(model.minDeliveryTime)-\(model.maxDeliveryTime) . \(model.numPerson) person"
        lblRecipeTime.text = detail
    }
}
