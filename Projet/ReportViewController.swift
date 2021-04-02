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
        let item = User(firstName: "Nourhene", lastName: "Soueid")
    
    Amplify.DataStore.save(item) { result in
       switch(result) {
       case .success(let savedItem):
           print("Saved item: \(savedItem.firstName)")
       case .failure(let error):
           print("Could not save item to DataStore: \(error)")
       }
    }
  }
}
