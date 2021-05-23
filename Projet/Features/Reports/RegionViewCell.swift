
import UIKit

class RegionViewCell: UITableViewCell, UITextFieldDelegate {

    var getRegion : (String?) -> () = { _ in }
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        textField.delegate = self
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("\(textField.text ?? "")")
        getRegion(textField.text)
    }
}
 
