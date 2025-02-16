//
//  Card.swift
//  Pet Shelter App
//
//  Created by macbook on 21.01.2025.
//а потом сделать collection view


import UIKit

class PetCardView: UIView {
    
    // MARK: - UI Elements
    private let imageView = UIImageView()
    private let containerView = UIView()
    private let nameLabel = UILabel()
    private let ageLabel = UILabel()
    private let breedLabel = UILabel()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
        
        backgroundColor = .white
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
        setupConstraints()
    }

    // MARK: - Setup
    private func setupView() {
        // Настройка imageView
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 16
        imageView.clipsToBounds = true
        addSubview(imageView)
        
        // Контейнер для текста
        containerView.backgroundColor = .clear
        containerView.layer.cornerRadius = 16
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOpacity = 0.15
        containerView.layer.shadowOffset = CGSize(width: 0, height: 4)
        containerView.layer.shadowRadius = 10
        addSubview(containerView)
        
        // Настройка nameLabel
        nameLabel.font = UIFont.boldSystemFont(ofSize: 16)
        nameLabel.textColor = .black
        containerView.addSubview(nameLabel)
        
        // Настройка ageLabel
        ageLabel.font = UIFont.systemFont(ofSize: 14)
        ageLabel.textColor = .darkGray
        containerView.addSubview(ageLabel)
        
        // Настройка breedLabel
        breedLabel.font = UIFont.systemFont(ofSize: 14)
        breedLabel.textColor = .darkGray
        containerView.addSubview(breedLabel)
    }
    
    private func setupConstraints() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        containerView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        ageLabel.translatesAutoresizingMaskIntoConstraints = false
        breedLabel.translatesAutoresizingMaskIntoConstraints = false
        
        bringSubviewToFront(imageView)
        
        NSLayoutConstraint.activate([
            // Фото (162x116)
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
//            imageView.widthAnchor.constraint(equalToConstant: 162),
            imageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 116),
            
            containerView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -8),
            containerView.centerXAnchor.constraint(equalTo: centerXAnchor),
            containerView.widthAnchor.constraint(equalTo: imageView.widthAnchor),
            containerView.heightAnchor.constraint(equalToConstant: 76),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),

            
            // Имя
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8),
            nameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 9),

            // Возраст
            ageLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            ageLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
            
            // Порода
            breedLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
            breedLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),

        ])
    }
      func configure(with image: UIImage?, name: String, age: String, breed: String) {
        imageView.image = image
        nameLabel.text = name
        ageLabel.text = age
        breedLabel.text = breed
    }
}
