
import UIKit
import Amplify
import Combine
import AmplifyPlugins

class DataViewController: UIViewController {
    
var todoSubscription: AnyCancellable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        subscribeReports()
        userData()
        createUserData()
        reportData()
        saveReportData()
    }
    
    func subscribeReports() {
       self.todoSubscription
           = Amplify.DataStore.publisher(for: Report.self)
               .sink(receiveCompletion: { completion in
                   print("Subscription has been completed: \(completion)")
               }, receiveValue: { mutationEvent in
                   print("Subscription got this value: \(mutationEvent)")

                   do {
                     let report = try mutationEvent.decodeModel(as: Report.self)

                     switch mutationEvent.mutationType {
                     case "create":
                       print("Created: \(report)")
                     case "update":
                       print("Updated: \(report)")
                     case "delete":
                       print("Deleted: \(report)")
                     default:
                       break
                     }

                   } catch {
                     print("Model could not be decoded: \(error)")
                   }
               })
    }
    
    func createUserData() {
        let item = User(id: "14010208", firstName: "Nourhene", lastName: "SOUEID", phoneNumber: 52533363, email: "soueidnourhene@gmail.com")
        Amplify.DataStore.save(item) { result in
            switch(result) {
            case .success(let user):
                print("First name: \(user.firstName)")
                if let lastName = user.lastName {
                    print("Last name: \(lastName)")
                }
                if let nbr = user.phoneNumber {
                    print("Phone number: \(nbr)")
                }
                if let email = user.email {
                    print("Email: \(email)")
                }
            case .failure(let error):
                print("Could not save item to DataStore: \(error)")
            }
        }
    }
    
    func userData() {
        
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
    func saveReportData() {
      subscribeReports()
}
    
    func reportData() {
        Amplify.DataStore.query(Report.self) { Result in
            switch(Result) {
            case.success(let reports):
                for report in reports {
                    print("Name: \(report.name)")
                if let region = report.region {
                    print("Location/ Region: \(region)")
                }
                        print("Description: \(description)")
                    }
            case.failure(let error):
                print("\(error)")
            }
        }
    }
}
