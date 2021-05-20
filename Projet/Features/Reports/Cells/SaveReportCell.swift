
import UIKit

class SaveReportCell: UITableViewCell {
    
    @IBOutlet weak var saveButton: UIButton!
    var save = {}
    
    override func awakeFromNib() {
        super.awakeFromNib()
        saveButton.layer.cornerRadius = 12
    }
    
    @IBAction func saveAction(_ sender: Any) {
       save()
    }
}

