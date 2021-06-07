
import UIKit

class PictureCell: UITableViewCell {
    
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var homeImageView: UIImageView!
    var showPostsList = {}
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    @IBAction func showPostsListAction(_ sender: Any) {
     showPostsList()
    }
}
