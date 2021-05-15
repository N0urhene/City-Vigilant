
import UIKit

class SaveReportCell: UITableViewCell {
    
    @IBOutlet weak var saveButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        saveButton.layer.cornerRadius = 12
    }
    
    @IBAction func saveAction(_ sender: Any) {
        let amplifyClient = AmplifyClient()
        amplifyClient.saveReport(report: Report(id: "aajhiuzaa", name: "aabnhn a", region: "zzzjnmjbz", description: "bbbhjbb"))
        amplifyClient.createSubscription()
    }
}

