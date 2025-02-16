import UIKit

class CustomCategoriesView: UIView {
    
    // MARK: - Properties
    private var categories: [String]
    private var selectedIndex: Int = 0 {
        didSet {
            updateButtonsAppearance()
        }
    }
    var onCategorySelected: ((Int) -> Void)?
    
    private var buttons: [UIButton] = []
    
    // MARK: - Init
    init(categories: [String]) {
        self.categories = categories
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    private func setupView() {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 12
        
        for (index, category) in categories.enumerated() {
            let button = UIButton(type: .system)
            button.setTitle(category, for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
            button.layer.cornerRadius = 25
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.systemGray4.cgColor
            button.backgroundColor = index == selectedIndex ? UIColor(named: "ButtonColor") : UIColor.white
            button.setTitleColor(index == selectedIndex ? UIColor.white : UIColor.gray, for: .normal)
            button.tag = index
            button.addTarget(self, action: #selector(categoryButtonTapped(_:)), for: .touchUpInside)
            
            // Add a circular imageView inside the button
            let imageView = UIImageView()
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.layer.cornerRadius = 16
            imageView.clipsToBounds = true
            imageView.contentMode = .scaleAspectFill
            

            switch index {
            case 0:
                imageView.image = UIImage(named: "All")
            case 1:
                imageView.image = UIImage(named: "Cat")
            case 2:
                imageView.image = UIImage(named: "Dog")
            default:
                break
            }
            
            button.addSubview(imageView)
            

            NSLayoutConstraint.activate([
                imageView.topAnchor.constraint(equalTo: button.topAnchor, constant: 10),
                imageView.leadingAnchor.constraint(equalTo: button.leadingAnchor, constant: 10),
                imageView.bottomAnchor.constraint(equalTo: button.bottomAnchor, constant: -10),
                imageView.widthAnchor.constraint(equalToConstant: 32), // Fixed width
                imageView.heightAnchor.constraint(equalToConstant: 32) // Fixed height
            ])
            
            buttons.append(button)
            stackView.addArrangedSubview(button)
            

            button.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                button.heightAnchor.constraint(equalToConstant: 52), // 
                button.widthAnchor.constraint(equalToConstant: 100) //
            ])
        }
        
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        ])
    }
    
    private func updateButtonsAppearance() {
        for (index, button) in buttons.enumerated() {
            button.backgroundColor = index == selectedIndex ? UIColor(named: "ButtonColor") : UIColor.white
            button.setTitleColor(index == selectedIndex ? UIColor.white : UIColor.gray, for: .normal)
        }
    }
    
    // MARK: - Actions
    @objc private func categoryButtonTapped(_ sender: UIButton) {
        selectedIndex = sender.tag
        onCategorySelected?(selectedIndex)
    }
}
