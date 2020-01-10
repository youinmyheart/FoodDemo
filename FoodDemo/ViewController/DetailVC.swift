// DetailVC.swift
// Created on 1/9/20. 

import UIKit

class DetailVC: UIViewController {

    let foodDescriptionCellId = "FoodDescriptionCell"
    let nutritionCellId = "NutritionCell"
    let foodQuantityCellId = "FoodQuantityCell"
    let cellId = "Cell"
    
    @IBOutlet weak var m_tableView: UITableView!
    @IBOutlet weak var btnOrder: UIBarButtonItem!
    
    var m_food: Food?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("DetailVC viewDidLoad")
        //m_tableView.rowHeight = UITableView.automaticDimension
        //m_tableView.estimatedRowHeight = 300;
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
        self.tabBarController?.tabBar.isHidden = true
    }
    
    @IBAction func tapOnBtnOrder(_ sender: Any) {
        print("tapOnBtnOrder")
    }
    
    func setColorForText(originalString: String, stringToColor: String, color: UIColor) -> NSMutableAttributedString {
        let range = (originalString as NSString).range(of: stringToColor)
        let attributedString = NSMutableAttributedString(string:originalString)
        attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: color , range: range)
        return attributedString
    }
}

extension DetailVC : FoodQuantityCellDelegate {
    
    func onChangeStepperValue(value: Double, sender: FoodQuantityCell) {
        print("onChangeStepperValue: \(value)")
        sender.configure(with: value)
    }
}

extension DetailVC : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 3
        case 1:
            // add extra food with more money
            return m_food?.foodDetail?.foodExtra?.count ?? 0
        case 2:
            return 1
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let food = m_food else { return UITableViewCell() }
        
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: foodDescriptionCellId, for: indexPath) as! FoodDescriptionCell
                cell.configure(with: food)
                cell.selectionStyle = .none
                return cell
                
            case 1:
                var cell = tableView.dequeueReusableCell(withIdentifier: cellId)
                if cell == nil {
                    cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellId)
                }
                cell!.textLabel?.text = "Ingredients"
                cell!.detailTextLabel?.numberOfLines = 0
                cell!.detailTextLabel?.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.45)
                cell!.detailTextLabel?.text = food.foodDetail?.foodIngredients
                cell!.selectionStyle = .none
                return cell!
                
            case 2:
                let cell = tableView.dequeueReusableCell(withIdentifier: nutritionCellId, for: indexPath) as! NutritionCell
                cell.configure(with: food)
                cell.selectionStyle = .none
                return cell
            default:
                return UITableViewCell()
            }
            
        case 1:
            // add extra food with more money
            if let foodExtra = food.foodDetail?.foodExtra {
                let price = "+$\(foodExtra[indexPath.row].price)"
                let str = "Add \(foodExtra[indexPath.row].name)  \(price)"
                let attributedStr = setColorForText(originalString: str, stringToColor: price, color: UIColor(red: 0, green: 0, blue: 0, alpha: 0.45))
                
                var cell = tableView.dequeueReusableCell(withIdentifier: cellId)
                if cell == nil {
                    cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellId)
                }
                cell!.textLabel?.attributedText = attributedStr
                return cell!
            }
            return UITableViewCell()
            
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: foodQuantityCellId, for: indexPath) as! FoodQuantityCell
            cell.configure(with: cell.stepperPlates.value)
            cell.delegate = self
            cell.selectionStyle = .none
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("tableView didSelectRowAt \(indexPath)")
        if indexPath.section != 1 {
            return
        }
        
        if let cell = tableView.cellForRow(at: indexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
            if cell.accessoryType == .checkmark {
                cell.accessoryType = .none
            } else {
                cell.accessoryType = .checkmark
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        print("tableView didDeselectRowAt \(indexPath)")
        let cell = tableView.cellForRow(at: indexPath)
        cell?.accessoryType = .none
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        switch indexPath.section {
//        case 0:
//            return 75
//        case 1:
//            return 107
//        default:
//            return 44
//        }
//    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 1:
            return "Extras"
        case 2:
            return "Quantity"
        default:
            return nil
        }
    }
}
