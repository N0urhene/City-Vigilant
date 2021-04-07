import UIKit
import Amplify
import MapKit
import CoreLocation
import AmplifyPlugins

class ReportViewController: UIViewController, CLLocationManagerDelegate {
    
    
    @IBOutlet weak var streetTextField: UITextField!
    @IBOutlet weak var municipalityTextField: UITextField!
    
    var locationManager: CLLocationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.createUserData()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        // self.configureAmplify()
    }
    
    
    func locationManager(_ manager: CLLocationManager,
                         didChangeAuthorization status: CLAuthorizationStatus) {
        
        if status == .authorizedWhenInUse || status == .authorizedAlways {
            locationManager.startUpdatingLocation()
        }
    }
    func createUserData() {
        let item = Report(description: "Build an iOS application using Amplify")
        Amplify.DataStore.save(item) { result in
            switch(result) {
            case .success(let savedItem):
                print("Saved item: \(savedItem.description)")
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
