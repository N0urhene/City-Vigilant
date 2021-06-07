
import UIKit
import Amplify
import AmplifyPlugins
import AWSS3

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var apiPlugin: AWSAPIPlugin?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
        
        configureAmplify()
        
        window?.rootViewController = TabBarController()
        window?.makeKeyAndVisible()
    }
    
    private func configureAmplify() {
        Amplify.Logging.logLevel = .info
        let dataStorePlugin = AWSDataStorePlugin(modelRegistration: AmplifyModels())
        let apiPlugin = AWSAPIPlugin(modelRegistration: AmplifyModels())
        do {
            try Amplify.add(plugin: dataStorePlugin)
            try Amplify.add(plugin: AWSCognitoAuthPlugin())
            try Amplify.add(plugin: AWSS3StoragePlugin())
            try Amplify.add(plugin: apiPlugin)
            try Amplify.configure()
            print("Amplify configured with storage plugin");
        } catch {
            print("Could not initialize Amplify: \(error)")
        }
    }

}

