
import UIKit

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    let profileArray: [Profile] = [
        Profile(
            title: "ACCOUNT SETTINGS", imageIcon: ""),
        Profile(
            title: "Personal information", imageIcon: "person"),
        Profile(
            title: "Notifications", imageIcon: "bell"),
        Profile(
            title: "Posts", imageIcon: "text.bubble"),
        Profile(
            title: "Donation", imageIcon: "creditcard"),
        Profile(
            title: "Terms of service", imageIcon: "doc.plaintext")
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.profileArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "profileCell", for: indexPath) as? ProfileTableViewCell {
            cell.configure(with: profileArray[indexPath.row].title, image: profileArray[indexPath.row].imageIcon)
            //            cell.labelView?.text = ProfileArray[indexPath.row].title
            //            cell.icon.image = UIImage(contentsOfFile: ProfileArray[indexPath.row].imageIcon)
            return cell
        }
        
        if let cel = tableView.dequeueReusableCell(withIdentifier: "accountCell", for: indexPath) as? AccountTableViewCell {
            cel.label?.text = profileArray[indexPath.row].title
            
            return cel
        }
        return UITableViewCell()
    }
    
    
}
