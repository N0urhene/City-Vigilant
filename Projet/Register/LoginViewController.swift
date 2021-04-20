
import UIKit

enum LoginCell {
    case numberCell
    case continueCell
    case socialLoginCell
}

class LoginViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var loginArray: [LoginCell] = [.numberCell, .continueCell, .socialLoginCell]
//    var loginArray = ["Continue with Email", "Continue with Facebook", "Continue with Google", "Continue with Apple"
//    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! LoginTableViewCell
                cell.loginBtn! = UIButton()
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       if let view = UIStoryboard(name: "Storyboard", bundle: nil).instantiateViewController(identifier: "RegisterViewController") as? RegisterViewController {
//
//            view.label.text = loginArray[indexPath.row]
//            view.button = UIButton()
//            view.signUpButton = UIButton()
            self.navigationController?.pushViewController(view, animated: true)
        }
    }
}
