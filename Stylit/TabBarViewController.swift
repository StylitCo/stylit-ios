//
//  TabBarViewController.swift
//  Stylit
//
//  Created by Lucas Wotton on 2/18/19.
//  Copyright © 2019 Lucas Wotton. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        tabBar.isTranslucent = false
        tabBar.alpha = 0.95
        tabBar.backgroundColor = UIColor.white
    }
    
    func initializeTabViewControllers() {
        let feedController = FeedViewController()
        let feedNavController = UINavigationController(rootViewController: feedController)
        feedNavController.title = "Fashion Feed"
        feedNavController.isNavigationBarHidden = true
        feedNavController.tabBarItem = UITabBarItem(title: "Fashion Feed", image: UIImage(named: "Hanger"), tag: 0)
        
        let tabBarItems = [feedNavController]

        self.viewControllers = tabBarItems
    }
}
