
import UIKit
import CoreLocation

class StreetReportCell: UITableViewCell {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var addButton: UIButton!
    
    var localityTxtField: UITextField!
    var aAreaTxtField: UITextField!
    var countryTxtField: UITextField!
    
    private var locationManager: CLLocationManager?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func add(_ sender: Any) {
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.requestWhenInUseAuthorization()
        locationManager?.startUpdatingLocation()
    }
    
    func displayLocationInfo(_ placemark: CLPlacemark?) {
        if let containsPlacemark = placemark {
            print("your location is:-",containsPlacemark)
            locationManager?.stopUpdatingLocation()
            let locality = (containsPlacemark.locality != nil) ? containsPlacemark.locality : ""
            let administrativeArea = (containsPlacemark.administrativeArea != nil) ? containsPlacemark.administrativeArea : ""
            let country = (containsPlacemark.country != nil) ? containsPlacemark.country : ""
            
            localityTxtField.text = locality
            aAreaTxtField.text = administrativeArea
            countryTxtField.text = country
        }
    }
}
//MARK: Protocol CLLocationManagerDelegate
extension StreetReportCell: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager,didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse || status == .authorizedAlways {
            
            locationManager?.startUpdatingLocation()
        }
    }
}

func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    print(locations)
}

func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
    print("Error while updating location " + error.localizedDescription)
}

