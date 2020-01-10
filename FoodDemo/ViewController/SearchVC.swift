// SearchVC.swift
// Created on 1/8/20. 

import UIKit

class SearchVC: UIViewController {

    let recipeCellId = "RecipeCell"
    let videoRecipeCellId = "VideoRecipeCell"
    
    @IBOutlet weak var m_searchBar: UISearchBar!
    @IBOutlet weak var m_tableView: UITableView!
    
    var m_arrRecipeTotal = [Food]()
    var m_arrVideoRecipeTotal = [Food]()
    
    var m_arrRecipe = [Food]()
    var m_arrVideoRecipe = [Food]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("SearchVC viewDidLoad")
        m_arrRecipe = m_arrRecipeTotal
        m_arrVideoRecipe = m_arrVideoRecipeTotal
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("SearchVC viewWillAppear")
        navigationController?.navigationBar.isHidden = true
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("SearchVC viewDidAppear")
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func updateDataTableView(searchText: String?) {
        self.m_arrRecipe = self.m_arrRecipeTotal.filter {(recipe) in
            guard let searchText = searchText?.lowercased() else {
                return true
            }
            if searchText.isEmpty {
                return true
            }
            
            let hasFoodName = recipe.foodName.lowercased().contains(searchText)
            let hasFoodCategory = recipe.foodCategory.contains(where: {$0.caseInsensitiveCompare(searchText) == .orderedSame})
            return hasFoodName || hasFoodCategory
        }
        self.m_arrVideoRecipe = self.m_arrVideoRecipeTotal.filter {(recipe) in
            guard let searchText = searchText?.lowercased() else {
                return true
            }
            if searchText.isEmpty {
                return true
            }
            
            let hasFoodName = recipe.foodName.lowercased().contains(searchText)
            let hasFoodCategory = recipe.foodCategory.contains(where: {$0.caseInsensitiveCompare(searchText) == .orderedSame})
            return hasFoodName || hasFoodCategory
        }
        self.m_tableView.reloadData()
    }
    
    func goToDetailVC(index: Int, arrData: [Food]) {
        print("goToDetailVC")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "DetailVC") as! DetailVC
        controller.m_food = arrData[index]
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationController?.pushViewController(controller, animated: true)
    }
}

extension SearchVC : UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0, execute: {
            self.updateDataTableView(searchText: searchBar.text)
        })
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("searchBarSearchButtonClicked")
        self.view.endEditing(true)
        self.updateDataTableView(searchText: searchBar.text)
    }
}

extension SearchVC : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return m_arrRecipe.count
        case 1:
            return m_arrVideoRecipe.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let food = m_arrRecipe[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: recipeCellId, for: indexPath) as! RecipeCell
            cell.configure(with: food)
            return cell
            
        case 1:
            let food = m_arrVideoRecipe[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: videoRecipeCellId, for: indexPath) as! VideoRecipeCell
            cell.configure(with: food)
            return cell
            
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.view.endEditing(true)
        switch indexPath.section {
        case 0:
            goToDetailVC(index: indexPath.row, arrData: m_arrRecipe)
        default:
            goToDetailVC(index: indexPath.row, arrData: m_arrVideoRecipe)
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 75
        case 1:
            return 107
        default:
            return 44
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Recipes"
        case 1:
            return "Video Recipes"
        default:
            return nil
        }
    }
}
