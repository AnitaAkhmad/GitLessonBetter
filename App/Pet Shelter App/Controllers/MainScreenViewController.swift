//
//  MainScreenViewController.swift
//  Pet Shelter App
//
//  Created by macbook on 21.01.2025.
//

import UIKit


class MainScreenViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        

        view.backgroundColor = .white
        
        // Переход к MainTabBarController
        openMainTabBar()
    
    }

    private func openMainTabBar() {
        let mainTabBarController = MainTabBarController()
        
 
        if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let window = scene.windows.first {
            window.rootViewController = mainTabBarController
            window.makeKeyAndVisible()
        }
    }

}
//
//import UIKit
//
//class MainScreenViewController: UIViewController {
//    
//    private let navigationView = NavigationView()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        view.backgroundColor = .white
//        
//        // Setup and add NavigationView
//        setupNavigationView()
//        
//        // Переход к MainTabBarController
//        openMainTabBar()
//    }
//    
//    private func setupNavigationView() {
//        navigationView.parentViewController = self
//        view.addSubview(navigationView)
//        
//        // Set navigation view frame directly (optional, depends on layout approach)
//        navigationView.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            navigationView.topAnchor.constraint(equalTo: view.topAnchor),
//            navigationView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            navigationView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            navigationView.heightAnchor.constraint(equalToConstant: 60)  // Height of the Navigation View
//        ])
//    }
//
//    private func openMainTabBar() {
//        let mainTabBarController = MainTabBarController()
//        
//        if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
//           let window = scene.windows.first {
//            window.rootViewController = mainTabBarController
//            window.makeKeyAndVisible()
//        }
//    }
//}
//
