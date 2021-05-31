
import UIKit

class PictureCell: UITableViewCell {
    
    @IBOutlet weak var homeImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    @IBAction func ReportsButton(_ sender: Any) {
        if  let view = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "PostViewController") as? PostViewController {
            let navigationController = UINavigationController()
            navigationController.pushViewController(view, animated: true)
            
        }
    }
}
