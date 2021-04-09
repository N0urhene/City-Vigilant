import UIKit
import Amplify
import MapKit
import CoreLocation
import AmplifyPlugins

class ReportViewController: UIViewController, CLLocationManagerDelegate, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var ReportTableView: UITableView!
    var ReportArray: [Report] = []
    var locationManager: CLLocationManager = CLLocationManager()


    override func viewDidLoad() {
        super.viewDidLoad()
        self.userData()
        self.createUserData()
        ReportTableView.delegate = self
        ReportTableView.dataSource = self
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
    
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.ReportArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "textViewCell", for: indexPath) as? ReportTableViewCell {
            let item = ReportArray[indexPath.row]
            cell.Titletext?.text = item.name
            cell.subTitle?.text = item.region
           return cell
        }
       return UITableViewCell()
    }
    
    func locationManager(_ manager: CLLocationManager,
                         didChangeAuthorization status: CLAuthorizationStatus) {
        
        if status == .authorizedWhenInUse || status == .authorizedAlways {
            locationManager.startUpdatingLocation()
        }
    
    }
    func createUserData() {
        let item = Report(name: "Nourhene", description: "Build an iOS application using Amplify")
        Amplify.DataStore.save(item) { result in
            switch(result) {
            case .success(let savedItem):
                print("Saved item: \(savedItem.name)")
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
