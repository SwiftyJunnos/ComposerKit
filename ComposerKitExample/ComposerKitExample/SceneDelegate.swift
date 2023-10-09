//
//  SceneDelegate.swift
//  ComposerExample
//
//  Created by 이창준 on 9/25/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        
        let homeVC = MVCHomeViewController()
        let navigationVC = UINavigationController(rootViewController: homeVC)
        
        window.rootViewController = navigationVC
        
        self.window = window
        window.makeKeyAndVisible()
    }
    
}
