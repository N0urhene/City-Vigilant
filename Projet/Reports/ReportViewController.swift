import UIKit
import Amplify
import MapKit
import CoreLocation
import AmplifyPlugins

enum ReportCell {
    case textCell(String)
    case streetCell
    case fileCell
    case saveCell
}

class ReportViewController: UIViewController, CLLocationManagerDelegate, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var reportArray : [ReportCell] = [.textCell("Name"), .textCell("Location/Region"), .streetCell, .textCell("Description"), .fileCell, .saveCell]
    
    var locationManager: CLLocationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.keyboardDismissMode = .onDrag
        tableView.register(UINib(nibName: "SaveReportCell", bundle: nil), forCellReuseIdentifier: "SaveReportCell")
       tableView.register(UINib(nibName: "StreetReportCell", bundle: nil), forCellReuseIdentifier: "StreetReportCell")
        tableView.register(UINib(nibName: "FileReportCell", bundle: nil), forCellReuseIdentifier: "FileReportCell")
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reportArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellType = reportArray[indexPath.row]
        
        switch cellType {
        case .textCell(let value):
            let cell = tableView.dequeueReusableCell(withIdentifier: "textViewCell", for: indexPath) as! ReportTableViewCell
            cell.titleLabel?.text = value
            cell.subTitleLabel?.placeholder = value
            return cell
        case.streetCell:
            let cell = tableView.dequeueReusableCell(withIdentifier: "StreetReportCell", for: indexPath) as! StreetReportCell
            return cell
        case .fileCell:
            let cel = tableView.dequeueReusableCell(withIdentifier: "FileReportCell", for: indexPath) as! FileReportCell
                return cel
        case .saveCell:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SaveReportCell", for: indexPath) as! SaveReportCell
            return cell
        default:
            return UITableViewCell()
        }

    }
    
    func locationManager(_ manager: CLLocationManager,
                         didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse || status == .authorizedAlways {
            locationManager.startUpdatingLocation()
        }
    }
}
