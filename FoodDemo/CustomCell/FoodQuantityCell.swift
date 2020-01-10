// FoodQuantityCell.swift
// Created on 1/9/20. 

import UIKit

protocol FoodQuantityCellDelegate : class {
    func onChangeStepperValue(value: Double, sender: FoodQuantityCell)
}
class FoodQuantityCell: UITableViewCell {

    @IBOutlet weak var lblNumPlates: UILabel!
    @IBOutlet weak var stepperPlates: UIStepper!
    
    weak var delegate: FoodQuantityCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func onChangeStepperValue(_ sender: Any) {
        delegate?.onChangeStepperValue(value: stepperPlates.value, sender: self)
    }
    
    public func configure(with value: Double?) {
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 2
        let numStr = formatter.string(from: NSNumber(value: value ?? 0))
        lblNumPlates.text = "\(numStr ?? "0") plates"
    }
}
