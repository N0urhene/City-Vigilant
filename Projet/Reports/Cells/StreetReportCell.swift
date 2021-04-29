
import UIKit
import CoreLocation

class StreetReportCell: UITableViewCell {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var addButton: UIButton!
    
   private var locationManager: CLLocationManager?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.requestWhenInUseAuthorization()
        locationManager?.startUpdatingLocation()
      
    }
    @IBAction func add(_ sender: Any) {
     
    }
}
    //MARK: Protocol CLLocationManagerDelegate
extension StreetReportCell: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager,didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse || status == .authorizedAlways {
            if CLLocationManager.isMonitoringAvailable(for: CLBeaconRegion.self) {
                if CLLocationManager.isRangingAvailable() {
                    locationManager?.startUpdatingLocation()
                }
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
//            addButton =  ( "latitude:\(location.coordinate.latitude) \nlangitude: \(location.coordinate.longitude)")
        }
        
    }
}
