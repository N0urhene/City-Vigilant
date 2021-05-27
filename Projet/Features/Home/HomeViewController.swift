
import UIKit

enum HomeCell {
    case PictureCell(UIImage)
    case NewsCell
    case ReportsCell
}
class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var homeArray: [HomeCell] = [.PictureCell(UIImage(named: "homepic")!),
                                 .NewsCell,
                                 .ReportsCell]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
    }
}

extension HomeViewController: UITableViewDelegate {
    
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let caseType = homeArray[indexPath.row]
        switch caseType {
        case .PictureCell:
        let cell = tableView.dequeueReusableCell(withIdentifier: "PictureCell", for: indexPath) as! PictureCell
        cell.homeImage?.image
        return cell
        case .NewsCell:
            let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as! NewsCell
            cell.collectionView.tag = indexPath.row
            return cell

        case .ReportsCell:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ReportsCell", for: indexPath) as! ReportsCell
            
            return cell
        }

    }
}
