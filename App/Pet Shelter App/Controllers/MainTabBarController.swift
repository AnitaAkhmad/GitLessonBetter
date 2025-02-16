import UIKit

class MainTabBarController: UITabBarController {

    private var roundLayer: CAShapeLayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        generateTabBar()
        setTabBarAppearance()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupRoundedTabBar()
    }
    
    private func generateTabBar() {
        viewControllers = [
            generateVC(
                viewController: HomeViewController(),
                title: "Home",
                image: UIImage(named: "Home")
            ),
            generateVC(
                viewController: UIViewController(),
                title: "Favorites",
                image: UIImage(systemName: "star.fill")
            ),
            generateVC(
                viewController: UIViewController(),
                title: "Messages",
                image: UIImage(systemName: "bubble.left.and.bubble.right.fill")
            ),
            generateVC(
                viewController: UIViewController(),
                title: "Profile",
                image: UIImage(systemName: "person.circle.fill")
            )
        ]
    }
    
    private func generateVC(viewController: UIViewController, title: String, image: UIImage?) -> UIViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        return viewController
    }
    
    private func setTabBarAppearance() {
        tabBar.tintColor = UIColor(named: "ButtonColor") // Кастомный цвет для активных элементов
        tabBar.unselectedItemTintColor = UIColor(named: "Grey") // Кастомный цвет для неактивных элементов
        tabBar.backgroundColor = .white // Фон таб-бара
    }


    private func setupRoundedTabBar() {
        // Удаляем предыдущий слой, чтобы избежать наложений
        roundLayer?.removeFromSuperlayer()
        
        let positionOnX: CGFloat = 10
        let positionOnY: CGFloat = 14
        let width = tabBar.bounds.width - positionOnX * 2
        let height = tabBar.bounds.height + positionOnY * 2
        
        // Создаём слой для закругления таб-бара
        let newRoundLayer = CAShapeLayer()
        let bezierPath = UIBezierPath(
            roundedRect: CGRect(
                x: positionOnX,
                y: tabBar.bounds.minY - positionOnY,
                width: width,
                height: height
            ),
            cornerRadius: height / 2
        )
        newRoundLayer.path = bezierPath.cgPath
        newRoundLayer.fillColor = UIColor.white.cgColor // Цвет фона таб-бара
        
        tabBar.layer.insertSublayer(newRoundLayer, at: 0)
        roundLayer = newRoundLayer
    }
}
