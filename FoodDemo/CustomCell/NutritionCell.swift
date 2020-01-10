// NutritionCell.swift
// Created on 1/9/20. 

import UIKit

class NutritionCell: UITableViewCell {

    @IBOutlet weak var lblNutrition: UILabel!
    @IBOutlet weak var lblNumCalories: UILabel!
    @IBOutlet weak var lblNumProtein: UILabel!
    @IBOutlet weak var lblNumTotalFat: UILabel!
    @IBOutlet weak var lblNumTotalCarbs: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    public func configure(with model: Food) {
        if let calories = model.foodDetail?.numCalories {
            lblNumCalories.text = "\(calories)"
        } else {
            lblNumCalories.text = ""
        }
        
        if let protein = model.foodDetail?.numProtein {
            lblNumProtein.text = "\(protein)g"
        } else {
            lblNumProtein.text = ""
        }
        
        if let totalFat = model.foodDetail?.numTotalFat {
            lblNumTotalFat.text = "\(totalFat)g"
        } else {
            lblNumTotalFat.text = ""
        }
        
        if let totalCarbs = model.foodDetail?.numTotalCarbs {
            lblNumTotalCarbs.text = "\(totalCarbs)g"
        } else {
            lblNumTotalCarbs.text = ""
        }
    }
}
