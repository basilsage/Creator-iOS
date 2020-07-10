//
//  MainTabBarController.swift
//  Creator
//
//  Created by DJ Satoda on 4/25/20.
//  Copyright © 2020 DJ Satoda. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class MainTabBarController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        
        if Auth.auth().currentUser == nil {
            DispatchQueue.main.async {
                let loginController = LoginController()
                let navController = UINavigationController(rootViewController: loginController)
                navController.modalPresentationStyle = .fullScreen
                self.present(navController, animated: true, completion: nil)
            }
            
            return
        }
        
        setupViewControllers()
        
        tabBar.tintColor = .black

    }
    
    func setupViewControllers() {
        let homeNavController = templateNavController(unselectedImage: #imageLiteral(resourceName: "homeUnfilled"), selectedImage: #imageLiteral(resourceName: "homeFilled"), rootViewController: HomeFeedController())
        
        //search
        let discoverNavController = templateNavController(unselectedImage: #imageLiteral(resourceName: "globeUnfilled"), selectedImage: #imageLiteral(resourceName: "globeFilled"), rootViewController: DiscoverController(collectionViewLayout: UICollectionViewFlowLayout()))

        let profileNavController = templateNavController(unselectedImage: #imageLiteral(resourceName: "profileUnfilled"), selectedImage: #imageLiteral(resourceName: "profileFilled"), rootViewController: UserProfileController())
        
        viewControllers = [homeNavController, discoverNavController, profileNavController]
        
        //modify tab bar item insets
        guard let items = tabBar.items else { return }
        
        for item in items {
            item.imageInsets = UIEdgeInsets(top: 4, left: 0, bottom: -4, right: 0)
            
        }
    }
    
    fileprivate func templateNavController(unselectedImage: UIImage, selectedImage: UIImage, rootViewController: UIViewController = UIViewController()) -> UINavigationController {
        let viewController = rootViewController
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.image = unselectedImage
        navController.tabBarItem.selectedImage = selectedImage
        return navController
    }
    
}
