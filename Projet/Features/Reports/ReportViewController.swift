import UIKit
import Amplify
import CoreLocation
import AmplifyPlugins
import MobileCoreServices
import Photos
import SCLAlertView

enum ReportCell {
    case nameCell(String)
    case locationCell(String)
    case streetCell
    case descriptionCell(String)
    case fileCell
    case saveCell
}

class ReportViewController: UIViewController{
    
    @IBOutlet weak var tableView: UITableView!
    var id: String?
    var name: String?
    var region: String?
    var desc: String?
    var categorie: String?
    var image: String!
    var locationManager: CLLocationManager = CLLocationManager()
    var reportArray : [ReportCell] = [.nameCell("Name"),
                                      .locationCell("Location/Region"),
                                      .streetCell,
                                      .descriptionCell("Description"),
                                      .fileCell, .saveCell]
    
    let amplifyClient = AmplifyClient()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.keyboardDismissMode = .onDrag
        tableView.register(UINib(nibName: "SaveReportCell", bundle: nil), forCellReuseIdentifier: "SaveReportCell")
        tableView.register(UINib(nibName: "StreetReportCell", bundle: nil), forCellReuseIdentifier: "StreetReportCell")
        tableView.register(UINib(nibName: "FileReportCell", bundle: nil), forCellReuseIdentifier: "FileReportCell")
    
    }
  
    func newReport()  {
        
        guard  name?.isEmpty == false,
             region?.isEmpty == false,
            desc?.isEmpty == false
        else  {
            SCLAlertView().showWarning("Warn", subTitle: "Please fill in all fields")
            return
        }
        let reportData = Report(name: self.name,
                                region: self.region,
                                description: self.desc,
                                image: self.image,
                                categorie: self.categorie)
        amplifyClient.saveReport(report: reportData)
//        amplifyClient.downloadImages(reports: reportData)
        SCLAlertView().showSuccess("Success", subTitle: "Your report had been successfully created")
        
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
        let reportData = Report(image: self.image)
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        picker.sourceType = .photoLibrary
        self.present(picker, animated: true) {() -> Void in }
        amplifyClient.uploadImage()
//        amplifyClient.downloadImages(reports: reportData)
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
        self.present(importMenu, animated: true)
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
        case .nameCell(let value):
            let cell = tableView.dequeueReusableCell(withIdentifier: "nameViewCell", for: indexPath) as! NameViewCell
            cell.titleLabel?.text = value
            cell.subTitleTextField?.placeholder = value
            cell.getName = { (value : String?) in
                self.name = value
            }
            return cell
        case .locationCell(let value):
            let cell = tableView.dequeueReusableCell(withIdentifier: "regionViewCell", for: indexPath) as! RegionViewCell
            cell.nameLabel?.text = value
            cell.textField?.placeholder = value
            cell.getRegion = { (value : String?) in
                self.region = value!
            }
            return cell
        case.streetCell:
            let cell = tableView.dequeueReusableCell(withIdentifier: "StreetReportCell", for: indexPath) as! StreetReportCell
            return cell
        case .descriptionCell(let value):
            let cell = tableView.dequeueReusableCell(withIdentifier: "descViewCell", for: indexPath) as! DescriptionViewCell
            cell.nameLabel?.text = value
            cell.descTtextField?.placeholder = value
            cell.getDescription = { (value : String?) in
                self.desc = value!
            }
            return cell
        case .fileCell: 
            let cell = tableView.dequeueReusableCell(withIdentifier: "FileReportCell", for: indexPath) as! FileReportCell
            // cell.val = openCamera
            cell.pic = importImage
            cell.file = attachDocument
            return cell
        case .saveCell:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SaveReportCell", for: indexPath) as! SaveReportCell
            cell.save = newReport // save wallet ta3ml newReport
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
        
               print(sandboxFileURL.lastPathComponent)
                    DispatchQueue.main.async {
                        self.attachDocument()
                    }
    }
}

