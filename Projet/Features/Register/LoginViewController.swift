
import UIKit

enum LoginCell {
    case numberCell
    case continueCell
    case socialLoginCell(UIButton)
}

class LoginViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var loginArray: [LoginCell] = [.numberCell, .continueCell, .socialLoginCell(UIButton())]

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
        case .numberCell:
            let cell = tableView.dequeueReusableCell(withIdentifier: "NumCell", for: indexPath) as! NumCell
            return cell
        case .continueCell:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ContinueCell", for: indexPath) as! ContinueCell
            return cell
        case .socialLoginCell:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SocialLoginCell", for: indexPath) as! SocialLoginCell
            return cell
    
        }
    }
  
}

extension LoginViewController: UITableViewDelegate {
    
}
