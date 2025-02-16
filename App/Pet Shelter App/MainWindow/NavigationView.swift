//
//  NavigationView.swift
//  Pet Shelter App
//
//  Created by macbook on 06.02.2025.
//
import UIKit

class NavigationView: UIView {
    
    weak var parentViewController: UIViewController? {
        didSet {
            setupNavigationItems()
        }
    }

    private func setupNavigationItems() {
        guard let parentVC = parentViewController else { return }
        
        // Logo image on the left
        let logoImage = UIImage(named: "logoTakeeBlack")
        let logoButton = UIBarButtonItem(image: logoImage, style: .plain, target: self, action: #selector(logoTapped))
        logoButton.tintColor = .black
        
        // Notification bell on the right
        let notificationImage = UIImage(named: "Notification")?.withRenderingMode(.alwaysOriginal)
        let notificationButton = UIBarButtonItem(image: notificationImage, style: .plain, target: self, action: #selector(notificationTapped))
        
        // Set up the navigation bar items
        parentVC.navigationItem.leftBarButtonItem = logoButton
        parentVC.navigationItem.rightBarButtonItem = notificationButton
    }

    @objc private func logoTapped() {
        print("Logo tapped!")
    }

    @objc private func notificationTapped() {
        print("Notification button tapped!")
    }
}
