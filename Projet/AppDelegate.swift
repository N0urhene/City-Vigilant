import UIKit
import Amplify
import AmplifyPlugins

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        func application(_: UIApplication,
                             didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]?
            ) -> Bool {
                configureAmplify()
                return true
            }
        return true
    }
        func configureAmplify() {
            Amplify.Logging.logLevel = .info
           let dataStorePlugin = AWSDataStorePlugin(modelRegistration: AmplifyModels())
           do {
               try Amplify.add(plugin: dataStorePlugin)
               try Amplify.configure()
               print("Initialized Amplify");
           } catch {
               // simplified error handling for the tutorial
               print("Could not initialize Amplify: \(error)")
           }
        }

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    
    }

    }

