//
// 📰 🐸
// Project: RSSchool_T9
//
// Author: Uladzislau Volchyk
// On: 23.07.21
//
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = scene as? UIWindowScene else { fatalError("LOL, be careful, drink some water") }
        window = UIWindow(windowScene: scene)
        window?.tintColor = .red
        UserDefaults.standard.set(true, forKey: "drawStories")
        UserDefaults.standard.setValue("Color6", forKey: "currentColor")
        let tabBarController = UITabBarController()
        let navigationController = UINavigationController()
        let galleryViewController = GalleryViewController()
        let settingsViewController = SettingsViewController()
        settingsViewController.title = "Settings"
        navigationController.viewControllers = [settingsViewController]
        tabBarController.viewControllers = [galleryViewController, navigationController]
        galleryViewController.tabBarItem = UITabBarItem(title: "Items", image: UIImage(systemName: "square.grid.2x2"), tag: 0)
        settingsViewController.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gear"), tag: 1)
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
    }
}

