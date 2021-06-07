
import UIKit

class PostsCell: UITableViewCell {

    @IBOutlet weak var  userLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var statusLabel: UILabel!
    
    var report: Report!
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
    }
    
    func update() {
        userLabel.text = report.name
        timeLabel.text = report.time
        captionLabel.text = report.description
        //postImageView.image = report.image
        statusLabel.text = "\(report.nbrOfLikes) likes                                                      \(report.nbrOfComments) comments"

    }
}
