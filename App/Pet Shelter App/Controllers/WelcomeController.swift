//
//  ViewController.swift
//  Pet Shelter App
//
//  Created by macbook on 20.01.2025.
//

import UIKit

class WelcomeController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Установка фонового изображения
        let backgroundImage = UIImageView(image: UIImage(named: "background"))
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.contentMode = .scaleAspectFill
        backgroundImage.clipsToBounds = true
        self.view.addSubview(backgroundImage)


        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: self.view.topAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])

        
        let button = UIButton(type: .system)
        button.setTitle("Let's Go", for: .normal)
        button.setTitleColor(.white, for: .normal) // Цвет текста
        button.backgroundColor = UIColor.button // Установка кастомного цвета
        button.layer.cornerRadius = 30 // Закругление углов
        button.clipsToBounds = true

        // Добавление действия нажатия
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)

        // Отключаем автоматическую установку frame
        button.translatesAutoresizingMaskIntoConstraints = false

        // Добавление кнопки на экран
        self.view.addSubview(button)

        // Установка констрейнов
        NSLayoutConstraint.activate([
            button.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -28), // Отступ от нижней Safe Area
            button.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 17), // Отступ слева
            button.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -17), // Отступ справа
            button.heightAnchor.constraint(equalToConstant: 58) // Фиксированная высота
        ])

        
        
        let labelDescriptor = UILabel()
        labelDescriptor.text = "Happiness is closer than you think"
        labelDescriptor.textColor = .white // Цвет текста
        labelDescriptor.font = UIFont(name: "SFProDisplay-Bold", size: 32)// Шрифт SF Pro Display
        labelDescriptor.textAlignment = .center // Выравнивание по центру
        labelDescriptor.numberOfLines = 0 // Поддержка переноса текста

        // Отключаем автоматическое создание фреймов
        labelDescriptor.translatesAutoresizingMaskIntoConstraints = false

        // Добавляем лейбл в иерархию
        self.view.addSubview(labelDescriptor)

        // Добавляем констрейнты для лейбла
        NSLayoutConstraint.activate([
            labelDescriptor.bottomAnchor.constraint(equalTo: button.topAnchor, constant: -52), // Отступ снизу от кнопки
            labelDescriptor.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 17), // Отступ слева
            labelDescriptor.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -17), // Отступ справа
        ])
        let logoImageView = UIImageView()
        logoImageView.image = UIImage(named: "logoTakee") // Установка изображения логотипа
        logoImageView.contentMode = .scaleAspectFit // Устанавливаем корректное масштабирование изображения

        // Отключаем автоматическое создание фреймов
        logoImageView.translatesAutoresizingMaskIntoConstraints = false

        // Добавляем UIImageView в иерархию представлений
        self.view.addSubview(logoImageView)

        // Устанавливаем констрейнты
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 32), // Отступ сверху
            logoImageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 154), // Отступ слева
            logoImageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -154), // Отступ справа
            logoImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor) // По центру экрана
        ])


    }
    
    // Метод, вызываемый при нажатии кнопки
    @objc func buttonTapped() {
        print("Let's Go button tapped!")
        
//        // Создаём экземпляр MainViewController
//        let mainViewController = MainScreenViewController()
//        
//        // Указываем стиль перехода (например, полноэкранный)
//        mainViewController.modalPresentationStyle = .fullScreen
//        
//        // Выполняем переход
//        present(mainViewController, animated: true, completion: nil)
//    }
        let vc = MainTabBarController()
        let backImage = UIImage(named: "logoTakeeBlack")
        let backButton = UIBarButtonItem(image: backImage, style: .plain, target: self, action: #selector(backAction))
        backButton.tintColor = .black
        navigationItem.leftBarButtonItem = backButton
        
        
        let notificationImage = UIImage(named: "Notification")?.withRenderingMode(.alwaysOriginal)
        let notificationButton = UIBarButtonItem(image: notificationImage, style: .plain, target: self, action: #selector(notificationTapped))
        
        // Установка кастомной кнопки вместо стандартной
        vc.navigationItem.leftBarButtonItem = backButton
        vc.navigationItem.rightBarButtonItem = notificationButton
        navigationController?.pushViewController(vc, animated: true)
      }
    
//    @objc func backAction() {
//        navigationController?.popViewController(animated: true)
//    }
    @objc func backAction() {
        print("Back button tapped!")
    }
    @objc func notificationTapped() {
        //
    }

    
    
    
    
    
  }
