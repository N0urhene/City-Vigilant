
import UIKit
enum creditCardCell {
    case CardCell(UIImage, String)
}
class DonationViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var cardArray: [creditCardCell] = [.CardCell(UIImage(systemName: "creditcard")!, "Credit card or debit card"), .CardCell(UIImage(named: "pp")!, "PayPal")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
}

extension DonationViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cardArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellType = cardArray[indexPath.row]
        switch  cellType {
        
        case .CardCell(let image, let name):
            let cell = tableView.dequeueReusableCell(withIdentifier: "CardCell", for: indexPath) as! CardCell
            cell.cardImageView.image = image
            cell.cardLabel.text = name
            return cell
        }
    }
    
}

extension DonationViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: "PaymeeViewController") as! PaymeeViewController
        navigationController?.pushViewController(viewController, animated: true)
    }
}
