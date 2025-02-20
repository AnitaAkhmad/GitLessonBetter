//
//  PetCardViewController.swift
//  Pet Shelter App
//
//  Created by macbook on 06.02.2025.
//
import UIKit

class PetCardViewController: UIViewController {

    // MARK: - Model
    struct Pet {
        let images: [UIImage?]
        let name: String
        let age: String
        let skills: String
        let weight: String
        let description: String
    }

    private let pet = Pet(
        images: [UIImage(named: "Photo_1"), UIImage(named: "Photo_2")],
        name: "Samoyed Willy",
        age: "1 year",
        skills: "Knows the commands",
        weight: "23 kg",
        description: "The kindest Samoyed we've ever met. Likes to play with balls, is friends with other animals. Despite the white color, he loves rain and puddles."
    )

    // MARK: - View
    private let petImagePageVC: PetImagePageViewController = {
        let vc = PetImagePageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
        vc.view.translatesAutoresizingMaskIntoConstraints = false
        return vc
    }()

    private let petNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFProDisplay-Bold", size: 32)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var tagsStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
            createTagView(text: pet.age, color: UIColor(named: "YellowColor") ?? .systemYellow),
            createTagView(text: pet.skills, color: UIColor(named: "PurpleColor") ?? .systemPurple),
            createTagView(text: pet.weight, color: UIColor(named: "PinkColor") ?? .systemPink)
        ])
        stack.axis = .horizontal
        stack.spacing = 8
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .darkGray
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign up for an acquaintance", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor.button
        button.layer.cornerRadius = 30
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()

    // MARK: - Controller
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.setNavigationBarHidden(true, animated: false)

        setupUI()
        configureData()
    }

    private func setupUI() {
        addChild(petImagePageVC)
        view.addSubview(petImagePageVC.view)
        petImagePageVC.didMove(toParent: self)

        view.addSubview(petNameLabel)
        view.addSubview(tagsStackView)
        view.addSubview(descriptionLabel)
        view.addSubview(signUpButton)

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

            signUpButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            signUpButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            signUpButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            signUpButton.heightAnchor.constraint(equalToConstant: 58)
        ])
    }

    private func configureData() {
        petNameLabel.text = pet.name
        descriptionLabel.text = pet.description
    }

    private func createTagView(text: String, color: UIColor) -> UIView {
        let containerView = UIView()
        containerView.backgroundColor = color
        containerView.layer.cornerRadius = 14.5
        containerView.translatesAutoresizingMaskIntoConstraints = false

        let label = UILabel()
        label.text = text
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textColor = .white
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

    @objc private func buttonTapped() {
        print("Sign up button tapped!")
    }
}
