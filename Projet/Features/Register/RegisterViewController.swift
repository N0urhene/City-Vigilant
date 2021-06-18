
import UIKit
enum RegisterCell {
    case LogInCell(String, UIImage)
}
class RegisterViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    var loginArray:[RegisterCell] = [.LogInCell("Settings", UIImage(systemName: "gearshape")!), .LogInCell("Donation", UIImage(systemName: "creditcard")!), .LogInCell("Get help", UIImage(systemName: "questionmark")!), .LogInCell("Terme of srvices", UIImage(systemName: "doc.plaintext")!)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        tableView.delegate = self
        
        
    }
    
    @IBAction func signUpButton(_ sender: Any) {
        if let view = UIStoryboard(name: "Storyboard", bundle: nil).instantiateViewController(identifier: "LoginViewController") as? LoginViewController {
             self.navigationController?.pushViewController(view, animated: true)
         }
    }
    @IBAction func logInButton(_ sender: Any) {
        if let view = UIStoryboard(name: "Storyboard", bundle: nil).instantiateViewController(identifier: "LoginViewController") as? LoginViewController {
             self.navigationController?.pushViewController(view, animated: true)
         }
    }
}
//MARK:RegisterViewController: UITableViewDataSource
extension RegisterViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return loginArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellType = loginArray[indexPath.row]
        switch cellType {
        case .LogInCell(let value, let image):
            let cell = tableView.dequeueReusableCell(withIdentifier: "loginCell", for: indexPath) as! LogInCell
            cell.featureLabel.text = value
            cell.icon.image = image
            return cell
        }
    }
}
extension RegisterViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 87.0
    }
    
}
