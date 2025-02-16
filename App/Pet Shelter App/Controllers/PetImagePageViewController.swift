//
//  s.swift
//  Pet Shelter App
//
//  Created by macbook on 11.02.2025.
//

import UIKit

class PetImagePageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {

    let imageNames = ["Dog1", "Dog2", "Dog3"]
    var currentIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        delegate = self
        
        if let startVC = viewControllerForIndex(0) {
            setViewControllers([startVC], direction: .forward, animated: true)
        }
    }

    func viewControllerForIndex(_ index: Int) -> UIViewController? {
        guard index >= 0, index < imageNames.count else { return nil }
        
        let imageVC = UIViewController()
        let imageView = UIImageView(image: UIImage(named: imageNames[index]))
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageVC.view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: imageVC.view.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: imageVC.view.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: imageVC.view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: imageVC.view.trailingAnchor)
        ])
        
        // Добавляем кастомную вью
        let statusView = PetStatusView()
        statusView.configure(image: UIImage(named: "Dog1"), title: "Willie\non a walk")
        statusView.translatesAutoresizingMaskIntoConstraints = false
        imageVC.view.addSubview(statusView)
        
        NSLayoutConstraint.activate([
            statusView.leadingAnchor.constraint(equalTo: imageVC.view.leadingAnchor, constant: 16),
            statusView.bottomAnchor.constraint(equalTo: imageVC.view.bottomAnchor, constant: -16),
            statusView.widthAnchor.constraint(equalToConstant: 127),
            statusView.heightAnchor.constraint(equalToConstant: 48)
        ])
        
        imageVC.view.tag = index
        return imageVC
    }


    // MARK: - Page View Controller DataSource
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let index = viewController.view.tag
        return viewControllerForIndex(index - 1)
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let index = viewController.view.tag
        return viewControllerForIndex(index + 1)
    }
}
