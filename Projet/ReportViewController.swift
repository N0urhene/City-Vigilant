import UIKit
import Amplify

class ReportViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
            do {
                try Amplify.configure()
            } catch {
                print("An error occurred setting up Amplify: \(error)")
            }
            return true
        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
