//
//  PetCardCell.swift
//  Pet Shelter App
//
//  Created by macbook on 22.01.2025.
//

import UIKit

class PetCardCell: UICollectionViewCell {
    
    private let petCardView = PetCardView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(petCardView)
        
        contentView.backgroundColor = .white
        
        petCardView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            petCardView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            petCardView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            petCardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            petCardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0)
        ])
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func configure(with image: UIImage?, name: String, age: String, breed: String) {
        petCardView.configure(with: image, name: name, age: age, breed: breed)
    }
}
