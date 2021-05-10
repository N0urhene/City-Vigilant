import UIKit
import Amplify
import MapKit
import CoreLocation
import AmplifyPlugins
import MobileCoreServices
import Photos

enum ReportCell {
    case textCell(String)
    case streetCell
    case fileCell
    case saveCell
}

class ReportViewController: UIViewController{
    
    @IBOutlet weak var tableView: UITableView!
    
    var reportArray : [ReportCell] = [.textCell("Name"),
                                      .textCell("Location/Region"),
                                      .streetCell,
                                      .textCell("Description"),
                                      .fileCell, .saveCell]
    
    var locationManager: CLLocationManager = CLLocationManager()
    //    let reportItem: Report
    //    let onToggleCompleted: (Report) -> Void
    
    
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
        if(UIImagePickerController.isSourceTypeAvailable(.camera))
        {
            let vc = UIImagePickerController()
            vc.sourceType = .camera
            vc.allowsEditing = true
            vc.delegate = self
            present(vc, animated: true)
        }
        else
        {
            let actionController: UIAlertController = UIAlertController(title: "Camera is not available",message: "", preferredStyle: .alert)
            let cancelAction: UIAlertAction = UIAlertAction(title: "OK", style: .cancel) { action -> Void  in
            }
            actionController.addAction(cancelAction)
            self.present(actionController, animated: true, completion: nil)
        }
    }
    
    private func importImage() {
        let picker = UIImagePickerController()
        
        picker.allowsEditing = true
        picker.delegate = self
        
        picker.sourceType = .photoLibrary
        self.present(picker, animated: true) {() -> Void in }
    }
    
    func checkLibrary() {
        let photos = PHPhotoLibrary.authorizationStatus()
        if photos == .authorized {
            switch photos {
            case .authorized:
                self.importImage()
            case .denied:
                print("Error")
            default:
                break
            }
        }
    }
    
    private func attachDocument() {
        let types = [kUTTypePDF, kUTTypeText, kUTTypeRTF, kUTTypeSpreadsheet]
        let importMenu = UIDocumentPickerViewController(documentTypes: types as [String], in: .import )
        importMenu.delegate = self
        importMenu.modalPresentationStyle = .formSheet
        present(importMenu, animated: true)
        
    }
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
            // cell.val = openCamera
            cell.pic = importImage
            cell.file = attachDocument
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
    
    func  imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        
        guard let image = info[.editedImage] as? UIImage else {
            print("No image found")
            return
        }
        print(image.size)
    }
}
//MARK: Protocol UIDocumentPickerDelegate
extension ReportViewController: UIDocumentPickerDelegate{
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        guard let selectedFileURL = urls.first else { return }
        
        let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let sandboxFileURL = dir.appendingPathComponent(selectedFileURL.lastPathComponent)
        
        //        print(sandboxFileURL.lastPathComponent)
        //            DispatchQueue.main.async {
        //                self.attachDocument().append(sandboxFileURL.lastPathComponent)
        //            }
    }
    //    func toggleCompleted() {
    //        UIView.animate(withDuration: 2.0) { [self] in
    //            self.onToggleCompleted(reportItem)
    //      }
    //    }
}

