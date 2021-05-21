
import UIKit

class DescriptionViewCell: UITableViewCell, UITextFieldDelegate {

    var getName : (String?) -> () = { _ in }
    
    @IBOutlet weak var descTtextField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        descTtextField.delegate = self
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("\(textField.text ?? "")")
        getName(textField.text)
    }

}
