
import UIKit
enum creditCardCell {
    case CardCell(UIImage, String, String)
}
class DonationViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var iconArray: [creditCardCell] = [.CardCell(UIImage(named: "jci1")!, "JCI Ghomrassen", "Jeune Chambre Internationale Ghomrassen"), .CardCell(UIImage(named: "jci2")!, "JCI Hammam Sousse", "Jeune Chambre Internationale Hammam Sousse"),
        .CardCell(UIImage(named: "jci3")!, "JCI Sayada", "Jeune Chambre Internationale Sayada"),
        .CardCell(UIImage(named: "jci4")!, "JCI Kélibia", "Jeune Chambre Internationale Kélibia"),
        .CardCell(UIImage(named: "acl")!, "ACL Djerba", "JAssociation Citoyenneté Et Libertés – Djerba"),
        .CardCell(UIImage(named: "atcv")!, "ATCV", "Association Tunisienne pour la Citoyenneté et le Volontariat"),
        .CardCell(UIImage(named: "atcl")!, "ATCL", "JAssociation Tunisienne de Citoyenneté et de Liberté"),
        .CardCell(UIImage(named: "aac")!, "AAC", "JAssociation pour l’Action Citoyenne"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
}

extension DonationViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return iconArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellType = iconArray[indexPath.row]
        switch  cellType {
        
        case .CardCell(let image, let name, let description):
            let cell = tableView.dequeueReusableCell(withIdentifier: "AssociationCell", for: indexPath) as! AssociationCell
            cell.cardImageView.image = image
            cell.nameLabel.text = name
            cell.captionLabel.text = description
            return cell
        }
    }
    
}

extension DonationViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: "PaymeeViewController") as! PaymeeViewController
        navigationController?.pushViewController(viewController, animated: true)
    }
}
