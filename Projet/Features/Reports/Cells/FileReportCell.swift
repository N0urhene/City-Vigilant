
import UIKit

class FileReportCell: UITableViewCell {

    @IBOutlet weak var fileLabel: UILabel!
    
    var val = {}
    var pic = {}
    var file = {}
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    @IBAction func fileAction(_ sender: Any) {
        file()
    }
    
    @IBAction func photoAction(_ sender: Any) {
        pic()
    }
    
    @IBAction func cameraAction(_ sender: Any) {
        val()
    }
    
}
