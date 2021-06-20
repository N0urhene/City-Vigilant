
import UIKit

enum LoginCell {
    case NumberCell
    case ContinueCell
    case SocialLoginCell(UIButton)
}

class LoginViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var loginArray: [LoginCell] = [.NumberCell, .ContinueCell, .SocialLoginCell(UIButton())]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
    }
}
    extension LoginViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return loginArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellType = loginArray[indexPath.row]
        switch cellType {
        case .NumberCell:
            let cell = tableView.dequeueReusableCell(withIdentifier: "NumberCell", for: indexPath) as! NumberCell
            return cell
            
        case .ContinueCell:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ContinueCell", for: indexPath) as! ContinueCell
            return cell
            
        case .SocialLoginCell:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SocialLoginCell", for: indexPath) as! SocialLoginCell
            return cell
        }
    }
  
}

extension LoginViewController: UITableViewDelegate {
    
}
