// FoodDescriptionCell.swift
// Created on 1/9/20. 

import UIKit

class FoodDescriptionCell: UITableViewCell {

    @IBOutlet weak var imvFood: UIImageView!
    @IBOutlet weak var lblFoodName: UILabel!
    @IBOutlet weak var lblFoodPrice: UILabel!
    @IBOutlet weak var lblFoodQuantity: UILabel!
    @IBOutlet weak var imvExtra1: UIImageView!
    @IBOutlet weak var imvExtra2: UIImageView!
    @IBOutlet weak var lblFoodDescription: UILabel!
    
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
        lblFoodPrice.text = "$\(model.foodPrice)"
        if let quantity = model.foodDetail?.numQuantity {
            lblFoodQuantity.text = "\(quantity)g"
        } else {
            lblFoodQuantity.text = ""
        }
        imvExtra1.image = model.foodDetail?.extraImage1
        imvExtra2.image = model.foodDetail?.extraImage2
        lblFoodDescription.text = model.foodDetail?.foodDescription
    }
}
