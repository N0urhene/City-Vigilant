
import UIKit

class ReportTableViewCell: UITableViewCell, UITextFieldDelegate {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UITextField!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("\(textField.text ?? "")")
        return true
    }

    
}
