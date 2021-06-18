
import UIKit

class LogInCell: UITableViewCell {

    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var featureLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configure(with title: String, image: String) {
        featureLabel.text = title
        icon.image = UIImage(systemName: image)
    }


}
