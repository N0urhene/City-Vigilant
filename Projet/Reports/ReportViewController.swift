import UIKit
import Amplify
import MapKit
import CoreLocation
import AmplifyPlugins

class ReportViewController: UIViewController, CLLocationManagerDelegate, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var ReportArray = ["Name","Location/Region","Street location","Description"]
    var locationManager: CLLocationManager = CLLocationManager()


    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
    
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.ReportArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "textViewCell", for: indexPath) as? ReportTableViewCell {
            let item = ReportArray[indexPath.row]
            cell.titleLabel?.text = item
            cell.subTitle?.placeholder = item
           return cell
        }
        if let cel = tableView.dequeueReusableCell(withIdentifier: "fileCell", for: indexPath) as? FileTableViewCell {
//            cel.fileLabel?.text = "Attach file"
//            cel.imageIcon?.image 
            return cel
        }
       return UITableViewCell()
    }
    
    func locationManager(_ manager: CLLocationManager,
                         didChangeAuthorization status: CLAuthorizationStatus) {
        
        if status == .authorizedWhenInUse || status == .authorizedAlways {
            locationManager.startUpdatingLocation()
        }
    
    }
}
