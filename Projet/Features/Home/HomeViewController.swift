
import UIKit

enum HomeCell {
    case PictureCell
}
class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    let homeArray: [HomeCell] = [.PictureCell]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        tableView.register(UINib(nibName: "PictureCell", bundle: nil), forCellReuseIdentifier: "PictureCell")
    }
    
    func showPostsListAction() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let postVC = storyboard.instantiateViewController(identifier: "PostViewController") as! PostViewController
            present(postVC, animated: true)
        
        }

}

//MARK: UITableViewDataSource
extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let caseType = homeArray[indexPath.row]
        switch caseType {
        case .PictureCell:
            let cell = tableView.dequeueReusableCell(withIdentifier: "PictureCell", for: indexPath) as! PictureCell
            cell.homeImageView?.image = UIImage(named: "home")
            cell.showPostsList = showPostsListAction
            return cell
        }
    }
}

//MARK: UITableViewDelegate
extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch homeArray[indexPath.section] {
        case .PictureCell:
            return 750.0
        }
    }
}
