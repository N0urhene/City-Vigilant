
import UIKit
import SCLAlertView
class SaveReportCell: UITableViewCell {
    
    @IBOutlet weak var saveButton: UIButton!
    var save = {}
    
    override func awakeFromNib() {
        super.awakeFromNib()
        saveButton.layer.cornerRadius = 12
    }
    
    @IBAction func saveAction(_ sender: Any) {
        save()
        SCLAlertView().showSuccess("Success", subTitle: "Your report had been successfully created")
    }
}

