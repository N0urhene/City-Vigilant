
import UIKit

class NameViewCell: UITableViewCell, UITextFieldDelegate {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleTextField: UITextField!
        
    var getName : (String?) -> () = { _ in }

    override func awakeFromNib() {
        super.awakeFromNib()
        self.subTitleTextField.delegate = self
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("\(textField.text ?? "")")
        getName(subTitleTextField.text)
    }
}
  
