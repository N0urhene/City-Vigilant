//
//  SceneDelegate.swift
//  Projet
//
//  Created by nourhene on 29/03/2021.
//

import UIKit
import Amplify
import AmplifyPlugins

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let _ = (scene as? UIWindowScene) else { return }
        
        configureAmplify()

    }

    
    private func configureAmplify() {
        Amplify.Logging.logLevel = .info
        let dataStorePlugin = AWSDataStorePlugin(modelRegistration: AmplifyModels())
        let apiPlugin = AWSAPIPlugin(modelRegistration: AmplifyModels())
        do {
            try Amplify.add(plugin: dataStorePlugin)
            try Amplify.add(plugin: apiPlugin)
            try Amplify.configure()
            print("Initialized Amplify");
        } catch {
            print("Could not initialize Amplify: \(error)")
        }
    }

}

