import UIKit

class MainTabBarController: UITabBarController {

    private let middleButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        let homeVC = HomeViewController()
        let discoverVC = DiscoverViewController()
        let noficationVC = NoficationViewController()
        let profileVC = ProfileViewController()

        homeVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(resource: .hometabbar), tag: 0)
        discoverVC.tabBarItem = UITabBarItem(title: "Discover", image: UIImage(resource: .search1), tag: 1)
        noficationVC.tabBarItem = UITabBarItem(title: "Chat", image: UIImage(resource: .notification), tag: 2)
        profileVC.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(resource: .profile), tag: 3)

        viewControllers = [
            UINavigationController(rootViewController: homeVC),
            UINavigationController(rootViewController: discoverVC),
            .init(),
            UINavigationController(rootViewController: noficationVC),
            UINavigationController(rootViewController: profileVC)
        ]

        setupMiddleButton()
    }

    private func setupMiddleButton() {
        middleButton.setImage(UIImage(resource: .add), for: .normal)
        middleButton.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
      middleButton.layer.cornerRadius = 25
        middleButton.clipsToBounds = true
        middleButton.backgroundColor = .clear
        middleButton.addTarget(self, action: #selector(middleButtonTapped), for: .touchUpInside)

        self.tabBar.addSubview(middleButton)
    }

    @objc private func middleButtonTapped() {
        let addVC = AddViewController()
        addVC.modalPresentationStyle = .fullScreen
        self.present(addVC, animated: true, completion: nil)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // Giữ middle button chính giữa tabBar khi xoay màn
        middleButton.center = CGPoint(x: tabBar.bounds.width / 2, y: tabBar.bounds.height / 2 - 15 )
    }
}
