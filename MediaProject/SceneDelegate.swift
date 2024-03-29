//
//  SceneDelegate.swift
//  MediaProject
//
//  Created by 남현정 on 2024/01/30.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
 
        guard let scene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: scene)
        
        let tabBarvc = UITabBarController()
        
        let firstNav = UINavigationController(rootViewController: TVGroupViewController())
        let secondNav = UINavigationController(rootViewController: TVDetailViewController())
        let thirdNav = UINavigationController(rootViewController: ProfileViewController())
        
        thirdNav.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]

        firstNav.tabBarItem = UITabBarItem(title: "TV트랜드", image: UIImage(systemName: "chart.line.uptrend.xyaxis.circle.fill"), tag: 0)
        secondNav.tabBarItem = UITabBarItem(title: "TV검색", image: UIImage(systemName: "magnifyingglass.circle.fill"), tag: 1)
        thirdNav.tabBarItem = UITabBarItem(title: "프로필", image: UIImage(systemName: "person.fill"), tag: 2)
        
        tabBarvc.tabBar.tintColor = Custom.Color.PointColor
        tabBarvc.tabBar.barTintColor = Custom.Color.backgroundColor // 스크롤하면 색이 변경되는데 그때 색을 여기서 바꿀 수 있다.
        tabBarvc.viewControllers = [firstNav, secondNav, thirdNav]
        
        window?.rootViewController = tabBarvc
        window?.makeKeyAndVisible()
        
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

