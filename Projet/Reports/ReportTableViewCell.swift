
import UIKit

class ReportTableViewCell: UITableViewCell, UITextFieldDelegate {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitle: UITextField!

    override class func awakeFromNib() {
        super.awakeFromNib()
    }
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        print("\(textField.text ?? "")")
//        return true
//    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}
