// 
// ViewController.swift
// 
// Created on 1/6/20.
// 

import UIKit

class SplashVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("SplashVC viewDidLoad")
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        Thread.sleep(forTimeInterval: 1)
        goToMainVC()
    }

    func goToMainVC() {
        print("goToMainVC")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "MainTabBarController")
        controller.modalPresentationStyle = .fullScreen
        self.present(controller, animated: false, completion: nil)
    }
}

