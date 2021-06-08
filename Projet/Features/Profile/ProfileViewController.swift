
import UIKit

enum ProfileCell {
    case UserNameCell
    case AccountCell(String)
    case ProfileCell(String, UIImage)
    
}
class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var profileArray: [ProfileCell] = [.UserNameCell, .AccountCell("ACCOUNT SETTINGS") ,.ProfileCell("Personal information", UIImage(systemName: "person")!), .ProfileCell("Notifications", UIImage(systemName: "bell")!), .ProfileCell("Posts", UIImage(systemName: "text.bubble")!), .ProfileCell("Donation", UIImage(systemName: "creditcard")!), .AccountCell("LEGAL"),.ProfileCell("Terms of service", UIImage(systemName: "doc.plaintext")!), .ProfileCell("Log out", UIImage(systemName: "lock.open")!)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 95.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profileArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellType = profileArray[indexPath.row]
        
        switch cellType {
        case .UserNameCell:
            let cell = tableView.dequeueReusableCell(withIdentifier: "UserNameCell", for: indexPath) as! UserNameCell
            return cell
            
        case .AccountCell(let value):
            let cell = tableView.dequeueReusableCell(withIdentifier: "AccountCell", for: indexPath) as! AccountCell
            cell.label.text = value
            return cell
            
        case .ProfileCell(let value, let icons):
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell", for: indexPath) as! ProfileTableViewCell
            cell.labelView.text = value
            cell.icon.image = icons
            return cell
            
        default:
            break
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath ) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: "DonationViewController") as! DonationViewController
        navigationController?.pushViewController(viewController, animated: true)
    }
}
