
import UIKit
import CoreLocation

class StreetReportCell: UITableViewCell {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var addButton: UIButton!
    
    var placemark: CLPlacemark?
    private var locationManager: CLLocationManager?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        displayLocationInfo()
    }
    
    @IBAction func add(_ sender: Any) {
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.requestWhenInUseAuthorization()
        locationManager?.startUpdatingLocation()
    }
    
    func displayLocationInfo() {
        if let containsPlacemark = placemark {
            print("your location is:-",containsPlacemark)
            locationManager?.stopUpdatingLocation()
            let locality = containsPlacemark.locality
            print(locality!)
            let administrativeArea = containsPlacemark.administrativeArea
            print(administrativeArea!)
            let country = containsPlacemark.country
            print(country!)
           
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
    if let location = locations.last {
            let latitude = location.coordinate.latitude
            let longitude = location.coordinate.longitude
        print(latitude)
        print(longitude)
        }
}

func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
    print("Error while updating location " + error.localizedDescription)
}

