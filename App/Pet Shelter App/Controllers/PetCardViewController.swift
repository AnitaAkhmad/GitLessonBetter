//
//  PetCardViewController.swift
//  Pet Shelter App
//
//  Created by macbook on 06.02.2025.
//
import UIKit

class PetCardViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.hidesBackButton = true
        navigationController?.setNavigationBarHidden(true, animated: false)
        setupUI()
    }

    
    func setupUI() {
        let petImagePageVC = PetImagePageViewController(
            transitionStyle: .scroll,
            navigationOrientation: .horizontal
        )
        petImagePageVC.view.translatesAutoresizingMaskIntoConstraints = false
        addChild(petImagePageVC)
        view.addSubview(petImagePageVC.view)
        petImagePageVC.didMove(toParent: self)
        
        let petNameLabel = UILabel()
        petNameLabel.text = "Samoyed Willy"
        petNameLabel.font = UIFont(name: "SFProDisplay-Bold", size: 32)
        petNameLabel.textColor = .yellow
        petNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let ageTag = createTagView(text: "1 year", backgroundColor: UIColor(named: "YellowColor") ?? UIColor.systemYellow)
        let skillsTag = createTagView(text: "Knows the commands", backgroundColor: UIColor(named: "PurpleColor") ?? UIColor.systemPurple)
        let weightTag = createTagView(text: "23 kg", backgroundColor: UIColor(named: "PinkColor") ?? UIColor.systemPink)
        
        let tagsStackView = UIStackView(arrangedSubviews: [ageTag, skillsTag, weightTag])
        tagsStackView.axis = .horizontal
        tagsStackView.spacing = 8
        tagsStackView.translatesAutoresizingMaskIntoConstraints = false
        
        let descriptionLabel = UILabel()
        descriptionLabel.text = "The kindest Samoyed we've ever met. Likes to play with balls, is friends with other animals. Despite the white color, he loves rain and puddles."
        descriptionLabel.font = UIFont.systemFont(ofSize: 16)
        descriptionLabel.textColor = .darkGray
        descriptionLabel.numberOfLines = 0
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let button = UIButton(type: .system)
        button.setTitle("Sign up for an acquaintance", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor.systemRed
        button.layer.cornerRadius = 30
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        view.addSubview(petImagePageVC.view)
        view.addSubview(petNameLabel)
        view.addSubview(tagsStackView)
        view.addSubview(descriptionLabel)
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            petImagePageVC.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 12),
            petImagePageVC.view.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            petImagePageVC.view.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            petImagePageVC.view.heightAnchor.constraint(equalToConstant: 360),
            
            petNameLabel.topAnchor.constraint(equalTo: petImagePageVC.view.bottomAnchor, constant: 28),
            petNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            tagsStackView.topAnchor.constraint(equalTo: petNameLabel.bottomAnchor, constant: 16),
            tagsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            descriptionLabel.topAnchor.constraint(equalTo: tagsStackView.bottomAnchor, constant: 20),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            button.heightAnchor.constraint(equalToConstant: 58)
        ])
    }
    
    func createTagView(text: String, backgroundColor: UIColor) -> UIView {
        let containerView = UIView()
        containerView.backgroundColor = .cyan
        containerView.layer.cornerRadius = 14.5
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        let label = UILabel()
        label.text = text
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.textColor = .purple
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8),
            label.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8),
            label.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
            label.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8)
        ])
        
        return containerView
    }
    
    @objc func buttonTapped() {
        print("Sign up button tapped!")
    }
}

