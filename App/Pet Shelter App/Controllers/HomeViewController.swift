//
//  HomeViewController.swift
//  Pet Shelter App
//
//  Created by macbook on 21.01.2025.
//

//import UIKit
//
//class HomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
//    
//    private let categoriesView = CustomCategoriesView(categories: ["All", "Cat", "Dog"])
//    
//    private let collectionView: UICollectionView = {
//        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .vertical
//        layout.minimumLineSpacing = 16
//        layout.minimumInteritemSpacing = 16
//        return UICollectionView(frame: .zero, collectionViewLayout: layout)
//    }()
//    
//    private let pets = [
//        (image: UIImage(named: "Photo_1"), name: "Gary", age: "3 years", breed: "Yorkshire Terrier"),
//        (image: UIImage(named: "Photo_2"), name: "Peach", age: "2.5 years", breed: "Half-breed"),
//        (image: UIImage(named: "Photo_3"), name: "Whitney", age: "2 months", breed: "British Longhair"),
//        (image: UIImage(named: "Photo_4"), name: "Buggy", age: "4 months", breed: "Jack Russell Terrier"),
//        (image: UIImage(named: "Photo_5"), name: "Stive", age: "40 months", breed: "blablabla"),
//        (image: UIImage(named: "Photo_6"), name: "Zheltok", age: "1 months", breed: "akak")
//    ]
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .white
//        setupCategoriesView()
//        setupCollectionView()
//    }
//
//    private func setupCategoriesView() {
//        view.addSubview(categoriesView)
//        categoriesView.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            categoriesView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
//            categoriesView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
//            categoriesView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
//            categoriesView.heightAnchor.constraint(equalToConstant: 52)
//        ])
//    }
//
//    private func setupCollectionView() {
//        collectionView.dataSource = self
//        collectionView.delegate = self
//        collectionView.register(PetCardCell.self, forCellWithReuseIdentifier: "PetCardCell")
//        collectionView.backgroundColor = .clear
//        view.addSubview(collectionView)
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            collectionView.topAnchor.constraint(equalTo: categoriesView.bottomAnchor, constant: 16),
//            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
//            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
//            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
//        ])
//    }
//
//    // MARK: - UICollectionViewDataSource
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return pets.count
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PetCardCell", for: indexPath) as! PetCardCell
//        let pet = pets[indexPath.item]
//        cell.configure(with: pet.image, name: pet.name, age: pet.age, breed: pet.breed)
//        return cell
//    }
//    
//    // MARK: - UICollectionViewDelegateFlowLayout
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: (collectionView.frame.width - 16) / 2, height: 240)
//    }
//}

import UIKit

class HomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
//    private let navigationView = NavigationView()
    
    private let categoriesView = CustomCategoriesView(categories: ["All", "Cat", "Dog"])
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 12
        layout.minimumInteritemSpacing = 12
        return UICollectionView(frame: .zero, collectionViewLayout: layout)
    }()
    
    private let pets = [
        (image: UIImage(named: "Photo_1"), name: "Gary", age: "3 years", breed: "Yorkshire Terrier"),
        (image: UIImage(named: "Photo_2"), name: "Peach", age: "2.5 years", breed: "Half-breed"),
        (image: UIImage(named: "Photo_3"), name: "Whitney", age: "2 months", breed: "British Longhair"),
        (image: UIImage(named: "Photo_4"), name: "Buggy", age: "4 months", breed: "Jack Russell Terrier"),
        (image: UIImage(named: "Photo_5"), name: "Stive", age: "40 months", breed: "blablabla"),
        (image: UIImage(named: "Photo_6"), name: "Zheltok", age: "1 months", breed: "akak")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupCategoriesView()
        setupCollectionView()
//        setupNavigationView()
    }

    private func setupCategoriesView() {
        view.addSubview(categoriesView)
        categoriesView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            categoriesView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            categoriesView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            categoriesView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            categoriesView.heightAnchor.constraint(equalToConstant: 52)
        ])
    }

    private func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(PetCardCell.self, forCellWithReuseIdentifier: "PetCardCell")
        collectionView.backgroundColor = .clear
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: categoriesView.bottomAnchor, constant: 12),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

    // MARK: - UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pets.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PetCardCell", for: indexPath) as! PetCardCell
        let pet = pets[indexPath.item]
        cell.configure(with: pet.image, name: pet.name, age: pet.age, breed: pet.breed)
        return cell
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat = 16
        let itemWidth = (collectionView.bounds.width/2 - padding/2)
        return CGSize(width: itemWidth, height: 200)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        let petCardVC = PetCardViewController()
        

        navigationController?.pushViewController(petCardVC, animated: true)
    }


}
