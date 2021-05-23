
import UIKit

class CategoriesCell: UICollectionViewCell {

    var getCategorie : (String?) -> () = { _ in }
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var iconImage: UIImageView!
    
    
    func action() {
     getCategorie(label.text)
    }
    
}
