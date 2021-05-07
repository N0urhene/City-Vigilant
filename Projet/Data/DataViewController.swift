
import UIKit
import Amplify
import AmplifyPlugins

class DataViewController: UIViewController {
    
    var reports = [Report]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        ModelRegistry.register(modelType: Report.self)
      //  getReports()
        createReport(report)
        getReports()
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
    
    func createReport(_ report: Report) {
        Amplify.API.mutate(request: .create(report)) { event in
            switch event {
            case.success(let result):
                switch result {
                case .success :
                    print("Successfully created the report")
                case.failure(let error):
                    print(" \(error)")
                }
            case.failure(let APIError):
                print("failed to create a report", APIError)
                
            }
        }
    }
    
    func saveReportData(id: String, name: String, region: String?, description: String) {
        let item = Report(id: id, name: name, region: region, description: description)
//        report.append(item)
        Amplify.DataStore.save(item) { result in
            switch result {
            case.success(let savedItem):
                print("Saved item: \(savedItem.name)")
            case.failure(let error):
                print("\(error)")
                
            }
        }
    }
    
    func getReports() {
        Amplify.API.query(request: .list(Report.self)) { result in
            do {
                let reports = try result.get().get()
                DispatchQueue.main.async {
                    self.reports = reports
                }
            }
            catch {
                print(error)
            }
        }
    }

}
