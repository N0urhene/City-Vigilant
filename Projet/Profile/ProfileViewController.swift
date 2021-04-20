
import UIKit

enum ProfileCell {
    case UserNameCell
    case ProfileCell(String)
    
}
class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var profileArray: [ProfileCell] = [.UserNameCell, .ProfileCell("ACCOUNT SETTINGS"), .ProfileCell("Personal information"), .ProfileCell("Notifications"), .ProfileCell("Posts"), .ProfileCell("Donation"), .ProfileCell("LEGAL"),.ProfileCell("Terms of service"), .ProfileCell("Log out")]
    
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
        case .ProfileCell(let value):
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell", for: indexPath) as! ProfileTableViewCell
            cell.labelView.text = value
            cell.icon.image = UIImage()
            return cell
        default:
            break
        }
        return UITableViewCell()
    }
    
    
}
