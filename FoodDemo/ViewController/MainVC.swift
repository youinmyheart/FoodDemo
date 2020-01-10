// 
// MainVC.swift
// 
// Created on 1/6/20.
// 

import Foundation
import UIKit

class MainVC: UIViewController {
    
    let listViewCellId = "ListViewCell"
    let gridViewCellId = "GridViewCell"
    let DEFAULT_CATEGORY = "Vegetarian"
    let m_arrCategory = ["All", "Vegetarian", "Healthy", "Salad", "Burgers", "Steak"]
    
    @IBOutlet weak var m_btnSwitchView: UIBarButtonItem!
    @IBOutlet weak var m_collectionView: UICollectionView!
    
    var m_btnNavDropdown: UIButton!
    var m_pickerViewCategory: UIPickerView!
    var m_isGridView: Bool = false
    var m_arrData = [Food]()
    var m_arrDataTotal = [Food]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("MainVC viewDidLoad")
        setUpUI()
        createData()
        navigationItem.title = DEFAULT_CATEGORY
        updateDataInCollectionView(category: navigationItem.title)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("MainVC viewDidLayoutSubviews")
        m_collectionView.collectionViewLayout.invalidateLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("MainVC viewWillAppear")
        navigationController?.navigationBar.isHidden = false
        self.tabBarController?.tabBar.isHidden = false
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("MainVC viewDidAppear")
    }
    
    @IBAction func tapOnBtnSearch(_ sender: Any) {
        print("tapOnBtnSearch")
        goToSearchVC()
    }
    
    @IBAction func tapOnBtnSwitchView(_ sender: Any) {
        print("tapOnBtnSwitchView")
        m_isGridView = !m_isGridView
        let gridIcon = UIImage(named: "grid view")
        let listIcon = UIImage(named: "list view")
        m_btnSwitchView.image = m_isGridView ? gridIcon : listIcon
        m_collectionView.reloadData()
    }
    
    func setUpUI() {
        m_btnNavDropdown =  UIButton(type: .custom)
        m_btnNavDropdown.frame = CGRect(x: 0, y: 0, width: 120, height: 40)
        m_btnNavDropdown.setTitleColor(.blue, for: .normal)
        m_btnNavDropdown.setTitle(DEFAULT_CATEGORY, for: .normal)
        m_btnNavDropdown.setImage(UIImage(named: "dropdown"), for: .normal)
        m_btnNavDropdown.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 8)
        m_btnNavDropdown.addTarget(self, action: #selector(clickOnNavTitle), for: .touchUpInside)
        m_btnNavDropdown.semanticContentAttribute = UIApplication.shared.userInterfaceLayoutDirection == .rightToLeft ? .forceLeftToRight : .forceRightToLeft
        
        navigationItem.titleView = m_btnNavDropdown
    }
    
    @objc func clickOnNavTitle() {
        print("clickOnNavTitle");
        showPickerInActionSheet()
    }
    
    func createData() {
        let creditCardImage = UIImage(named: "credit card")
        let lightningImage = UIImage(named: "lightning")
        let botanicaImage = UIImage(named: "botanica")
        let entreeImage = UIImage(named: "entree")
        let caffeItaliaImage = UIImage(named: "caffe italia")
        let redSteakImage = UIImage(named: "red steak")
        let burgerBrotherImage = UIImage(named: "burger brother")
        let freshSaladImage = UIImage(named: "fresh market salad")
        let pastaAglioImage = UIImage(named: "pasta aglio olio")
        let pizzaMagheritaImage = UIImage(named: "pizza margherita")
        let greecSaladImage = UIImage(named: "Greec salad")
        let figBlueImage = UIImage(named: "fig and blue")
        let caesarImage = UIImage(named: "Caesar")
        let chickenCheddarImage = UIImage(named: "chicken bacon cheddar")
        let pastaMarinaraImage = UIImage(named: "pasta marinara")
        
        let category1 = ["Vegetarian", "Gluten-Free", "Healthy"]
        let category2 = ["Italian", "Pizza", "Pasta", "Ice cream"]
        let category3 = ["Steakhouse", "Dry aged beef"]
        let category4 = ["Burgers", "Steak"]
        let category5 = ["Salad"]
        let category6 = ["Main plates"]
        let category7 = ["Salad", "Healthy"]
        
        let extraImage1 = UIImage(named: "leaf")
        let extraImage2 = UIImage(named: "green_pea_fruit")
        let foodDescription = "Real marinara sauce has the taste and juice of fresh tomato, but also a four different tomato sauces at his restaurant Sauce in the East Village."
        let foodIngredients = "Linguine pasta, olive oil, garlic, red onion, green onions, tomatoes, mussels, shrimps, white wine"
        
        let extra1 = FoodExtra(name: "jumbo shrimp", price: 3.99)
        let extra2 = FoodExtra(name: "cheese", price: 3.99)
        let extra3 = FoodExtra(name: "white anchovies", price: 3.99)
        let foodExtra = [extra1, extra2, extra3]
        
        let foodDetail = FoodDetail(extraImage1: extraImage1, extraImage2: extraImage2, numQuantity: 300, foodDescription: foodDescription, foodIngredients: foodIngredients, numCalories: 470, numProtein: 40, numTotalFat: 25, numTotalCarbs: 12, foodExtra: foodExtra, numPlates: 1)
        
        let food1 = Food(foodImage: botanicaImage, foodName: "Botanica", foodCategory: category1, minDeliveryTime: 30, maxDeliveryTime: 40, numPerson: 2, extraImage: creditCardImage, foodPrice: 12, numStarRate: 4.9, foodType: .Recipe, foodDetail: foodDetail)
        let food2 = Food(foodImage: entreeImage, foodName: "Entrée", foodCategory: category1, minDeliveryTime: 30, maxDeliveryTime: 90, numPerson: 2, extraImage: nil, foodPrice: 25, numStarRate: 4.7, foodType: .Recipe, foodDetail: foodDetail)
        let food3 = Food(foodImage: caffeItaliaImage, foodName: "Caffe Italia", foodCategory: category2, minDeliveryTime: 30, maxDeliveryTime: 90, numPerson: 2, extraImage: lightningImage, foodPrice: 25, numStarRate: 4.3, foodType: .Recipe, foodDetail: foodDetail)
        let food4 = Food(foodImage: redSteakImage, foodName: "Red Steak", foodCategory: category3, minDeliveryTime: 30, maxDeliveryTime: 40, numPerson: 2, extraImage: creditCardImage, foodPrice: 12, numStarRate: 3.9, foodType: .Recipe, foodDetail: foodDetail)
        let food5 = Food(foodImage: burgerBrotherImage, foodName: "Burger Brothers", foodCategory: category4, minDeliveryTime: 30, maxDeliveryTime: 40, numPerson: 2, extraImage: nil, foodPrice: 12, numStarRate: 4.0, foodType: .Recipe, foodDetail: foodDetail)
        
        let food6 = Food(foodImage: freshSaladImage, foodName: "Fresh Market Salad", foodCategory: category5, minDeliveryTime: 45, maxDeliveryTime: 60, numPerson: 4, extraImage: nil, foodPrice: 12, numStarRate: 4.9, foodType: .Recipe, foodDetail: foodDetail)
        let food7 = Food(foodImage: pastaAglioImage, foodName: "Pasta Aglio Olio", foodCategory: category6, minDeliveryTime: 45, maxDeliveryTime: 60, numPerson: 4, extraImage: nil, foodPrice: 25, numStarRate: 4.7, foodType: .Recipe, foodDetail: foodDetail)
        let food8 = Food(foodImage: pizzaMagheritaImage, foodName: "Pizza Magherita", foodCategory: category5, minDeliveryTime: 45, maxDeliveryTime: 60, numPerson: 4, extraImage: nil, foodPrice: 35, numStarRate: 4.3, foodType: .Recipe, foodDetail: foodDetail)
        let food9 = Food(foodImage: greecSaladImage, foodName: "Classic Greec Salad", foodCategory: category5, minDeliveryTime: 45, maxDeliveryTime: 60, numPerson: 2, extraImage: creditCardImage, foodPrice: 12, numStarRate: 3.9, foodType: .Recipe, foodDetail: foodDetail)
        let food10 = Food(foodImage: figBlueImage, foodName: "Fig and Blue", foodCategory: category5, minDeliveryTime: 45, maxDeliveryTime: 60, numPerson: 2, extraImage: nil, foodPrice: 12, numStarRate: 4.0, foodType: .Recipe, foodDetail: foodDetail)
        
        let food11 = Food(foodImage: caesarImage, foodName: "Caesar", foodCategory: category5, minDeliveryTime: 45, maxDeliveryTime: 60, numPerson: 2, extraImage: nil, foodPrice: 12, numStarRate: 4.0, foodType: .Recipe, foodDetail: foodDetail)
        let food12 = Food(foodImage: chickenCheddarImage, foodName: "Chicken Bacon Cheddar", foodCategory: category7, minDeliveryTime: 45, maxDeliveryTime: 60, numPerson: 2, extraImage: nil, foodPrice: 12, numStarRate: 4.0, foodType: .VideoRecipe, foodDetail: foodDetail)
        let food13 = Food(foodImage: freshSaladImage, foodName: "Fresh Market Salad 2", foodCategory: category5, minDeliveryTime: 45, maxDeliveryTime: 60, numPerson: 2, extraImage: nil, foodPrice: 12, numStarRate: 4.0, foodType: .VideoRecipe, foodDetail: foodDetail)
        let food14 = Food(foodImage: pastaAglioImage, foodName: "Pasta Aglio Olio 2", foodCategory: category4, minDeliveryTime: 45, maxDeliveryTime: 60, numPerson: 2, extraImage: nil, foodPrice: 12, numStarRate: 4.0, foodType: .VideoRecipe, foodDetail: foodDetail)
        let food15 = Food(foodImage: pastaMarinaraImage, foodName: "Pasta Marinara", foodCategory: category6, minDeliveryTime: 45, maxDeliveryTime: 60, numPerson: 2, extraImage: nil, foodPrice: 10, numStarRate: 4.0, foodType: .Recipe, foodDetail: foodDetail)
        
        m_arrDataTotal.append(food1)
        m_arrDataTotal.append(food2)
        m_arrDataTotal.append(food3)
        m_arrDataTotal.append(food4)
        m_arrDataTotal.append(food5)
        m_arrDataTotal.append(food6)
        m_arrDataTotal.append(food7)
        m_arrDataTotal.append(food8)
        m_arrDataTotal.append(food9)
        m_arrDataTotal.append(food10)
        m_arrDataTotal.append(food11)
        m_arrDataTotal.append(food12)
        m_arrDataTotal.append(food13)
        m_arrDataTotal.append(food14)
        m_arrDataTotal.append(food15)
        
        m_arrData = m_arrDataTotal
    }
    
    func showPickerInActionSheet() {
        let title = ""
        let message = "\n\n\n\n\n\n\n\n\n\n";
        let alert = UIAlertController(title: title, message: message, preferredStyle: .actionSheet);
        alert.isModalInPopover = true;
        
        let alertWidth = alert.view.frame.width
        let pickerWidth: CGFloat = 270
        let centerX = alertWidth / 2
        let pickerX = centerX - (pickerWidth / 2)
        let pickerFrame: CGRect = CGRect(x: pickerX - 10, y: 52, width: pickerWidth, height: 100);
        m_pickerViewCategory = UIPickerView(frame: pickerFrame);
        m_pickerViewCategory.delegate = self;
        m_pickerViewCategory.dataSource = self;

        alert.view.addSubview(m_pickerViewCategory);

        //Create the toolbar view - the view hold our 2 buttons
        let toolFrame = CGRect(x: 17, y: 5, width: alert.view.frame.width, height: 45);
        let toolView: UIView = UIView(frame: toolFrame);

        let btnWidth: CGFloat = 100
        let buttonCancelFrame: CGRect = CGRect(x: 0, y: 7, width: btnWidth, height: 30);
        let buttonCancel: UIButton = UIButton(frame: buttonCancelFrame);
        buttonCancel.setTitle("Cancel", for: .normal);
        buttonCancel.setTitleColor(UIColor.blue, for: .normal);
        buttonCancel.addTarget(self, action: #selector(cancelSelection(sender:)), for: .touchDown)

        let buttonOkPosX = alertWidth - btnWidth - (btnWidth/2)
        let buttonOkFrame: CGRect = CGRect(x: buttonOkPosX, y: 7, width: 100, height: 30);
        let buttonOk: UIButton = UIButton(frame: buttonOkFrame);
        buttonOk.setTitle("Select", for: .normal);
        buttonOk.setTitleColor(UIColor.blue, for: .normal);
        buttonOk.addTarget(self, action: #selector(selectCategory(sender:)), for: .touchDown);
        
        toolView.addSubview(buttonCancel);
        toolView.addSubview(buttonOk);
        alert.view.addSubview(toolView);

        self.present(alert, animated: true, completion: nil);
    }

    @objc func selectCategory(sender: UIButton){
        print("selectCategory");
        let category = m_arrCategory[m_pickerViewCategory.selectedRow(inComponent: 0)]
        m_btnNavDropdown.setTitle(category, for: .normal)
        
        updateDataInCollectionView(category: category)
        
        self.dismiss(animated: true, completion: nil);
    }

    @objc func cancelSelection(sender: UIButton){
        print("cancelSelection");
        self.dismiss(animated: true, completion: nil);
    }
    
    func updateDataInCollectionView(category: String?) {
        guard let category = category else {
            return
        }
        if "All" == category {
            m_arrData = m_arrDataTotal
        } else {
            m_arrData = m_arrDataTotal.filter { $0.foodCategory.contains(category) }
        }
        m_collectionView.reloadData()
    }
    
    func goToSearchVC() {
        print("goToSearchVC")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "SearchVC") as! SearchVC
        controller.m_arrRecipeTotal = m_arrDataTotal.filter { $0.foodType == .Recipe }
        controller.m_arrVideoRecipeTotal = m_arrDataTotal.filter { $0.foodType == .VideoRecipe }
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    func goToDetailVC(index: Int) {
        print("goToDetailVC")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "DetailVC") as! DetailVC
        controller.m_food = m_arrDataTotal[index]
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationController?.pushViewController(controller, animated: true)
    }
}

extension MainVC : UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("collectionView numberOfItemsInSection")
        return m_arrData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print("collectionView cellForItemAtIndexPath")
        let food = m_arrData[indexPath.row]
        if m_isGridView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: gridViewCellId, for: indexPath) as! GridViewCell
            cell.configure(with: food)
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: listViewCellId, for: indexPath) as! ListViewCell
            cell.configure(with: food)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        print("collectionView sizeForItemAtIndexPath")
        let width = view.bounds.size.width
        print("view width = \(width)")
        if let cell = collectionView.cellForItem(at: indexPath) {
            print("cell.frame: \(cell.frame)")
        }
        if m_isGridView {
            return CGSize(width: (width - 15)/2, height: 228)
        } else {
            return CGSize(width: width, height: 100)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        print("collectionView minimumLineSpacingForSectionAtIndexPath")
        return 5
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        print("collectionView minimumInteritemSpacingForSectionAtIndexPath")
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("collectionView didSelectItemAt \(indexPath)")
        collectionView.deselectItem(at: indexPath, animated: true)
        goToDetailVC(index: indexPath.row)
    }
    
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        print("collectionView didHighlightItemAt \(indexPath)")
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
    }
    
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        print("collectionView didUnhighlightItemAt \(indexPath)")
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.backgroundColor = .clear
    }
}

extension MainVC : UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return m_arrCategory.count;
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return m_arrCategory[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("pickerView didSelectRow \(row)")
    }
}
