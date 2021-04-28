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

class ReportViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var reportArray : [ReportCell] = [.textCell("Name"),
                                      .textCell("Location/Region"),
                                      .streetCell,
                                      .textCell("Description"),
                                      .fileCell, .saveCell]
    
    var locationManager: CLLocationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.keyboardDismissMode = .onDrag
        tableView.register(UINib(nibName: "SaveReportCell", bundle: nil), forCellReuseIdentifier: "SaveReportCell")
        tableView.register(UINib(nibName: "StreetReportCell", bundle: nil), forCellReuseIdentifier: "StreetReportCell")
        tableView.register(UINib(nibName: "FileReportCell", bundle: nil), forCellReuseIdentifier: "FileReportCell")
       
    }

    private func openCamera() {
        let vc = UIImagePickerController()
        vc.sourceType = .camera
        vc.allowsEditing = true
        vc.delegate = self
        present(vc, animated: true)
    }
    private func importImage() {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
    }
    
//    func  imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//        picker.dismiss(animated: true)
//
//        guard let image = info[.editedImage] as? UIImage else {
//            print("No image found")
//            return
//        }
//        print(image.size)
//    }
    
}



//MARK: Protocol UITableViewDataSource
extension ReportViewController: UITableViewDataSource {
    
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
            let cell = tableView.dequeueReusableCell(withIdentifier: "FileReportCell", for: indexPath) as! FileReportCell
            cell.val = openCamera
            cell.pic = importImage

            return cell
        case .saveCell:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SaveReportCell", for: indexPath) as! SaveReportCell
            return cell
        default:
            return UITableViewCell()
        }
    }
}

//MARK: Protocol UITableViewDelegate
extension ReportViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120.0
    }
}

//MARK: Protocol UINavigationControllerDelegate, UIImagePickerControllerDelegate
extension ReportViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
}
