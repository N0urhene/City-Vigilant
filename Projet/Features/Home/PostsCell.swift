
import UIKit

class PostsCell: UITableViewCell {

    @IBOutlet weak var  userLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var postImageView: UIImageView!
    var showUpdate = {}

    override func awakeFromNib() {
        super.awakeFromNib()
      
    }
    @IBAction func shareAction(_ sender: Any) {
    }
    
    @IBAction func updateAction(_ sender: Any) {
        showUpdate()
    }
    
    func update(report: Report) {
        userLabel.text = report.name
        captionLabel.text = report.description
        //postImageView.image = UIImage(named: postImages)
    }
}
