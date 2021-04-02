import UIKit
import Amplify
import AmplifyPlugins

class ReportViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
     self.performOnAppear()
    
       // self.configureAmplify()
    }
    func performOnAppear() {
        
        Amplify.DataStore.query(User.self) { result in
       switch(result) {
       case .success(let users):
        for user in users {
            print("First Name: \(user.firstName)")
            if let lastName = user.lastName {
                print("Last Name: \(lastName)")
            }
            if let number = user.phoneNumber {
                print("Phone Number: \(number)")
            }
            if let email = user.email {
                print("Adresse email: \(email)")
            }
        }
       case .failure(let error):
           print("Could not save item to DataStore: \(error)")
       }
    }
  }
    func reportData() {
        Amplify.DataStore.query(Report.self) { Result in
            switch(Result) {
            case.success(let reports):
                for report in reports {
                    print("Description: \(report.description)")
                }
            case.failure(let error):
                print("\(error)")
            }
        }
    }
    
}
