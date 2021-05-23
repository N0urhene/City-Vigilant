
import UIKit

class DescriptionViewCell: UITableViewCell, UITextFieldDelegate {

    var getDescription : (String?) -> () = { _ in }
    
    @IBOutlet weak var descTtextField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        descTtextField.delegate = self
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("\(textField.text ?? "")")
        getDescription(textField.text)
    }

}
