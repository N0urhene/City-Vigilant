
import UIKit

enum HomeCell {
    case PictureCell
    case NewsCell
}
class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    let homeArray: [HomeCell] = [.PictureCell, .NewsCell]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        tableView.register(UINib(nibName: "PictureCell", bundle: nil), forCellReuseIdentifier: "PictureCell")
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
            cell.homeImage?.image = UIImage(named: "home")
            return cell
        case .NewsCell:
            let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as! NewsCell
            cell.collectionView.tag = indexPath.section
            
            return cell
        }
    }
}

//MARK: UITableViewDelegate
extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch homeArray[indexPath.section] {
        case .NewsCell:
            return 200.0
        case .PictureCell:
            return 750.0
        }
    }
}
