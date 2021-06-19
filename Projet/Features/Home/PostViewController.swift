
import UIKit

class PostViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    private var postReports: [Report] = []
    let amplifyClient = AmplifyClient()
    var postImages: [String] = ["dechets", "poubelle", "road"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        amplifyClient.listReports(completion: setReports(reports:))
    }
    
    func showUpdateAction() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let postVC = storyboard.instantiateViewController(identifier: "UpdatePostViewController") as! UpdatePostViewController
            present(postVC, animated: true)
        
        }
    
    // postReports bch twalli ta5ou tab de Reports
    func setReports(reports: [Report]) {
        postReports = reports
        tableView.reloadData()
    }
}

//MARK: UITableViewDataSource
extension PostViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postReports.count
    
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostsCell", for: indexPath) as! PostsCell
         
     let report =  postReports[indexPath.row]
        cell.update(report: report)
      //  cell.postImageView.image = UIImage(named: postImages[indexPath.row])
        cell.showUpdate = showUpdateAction
        return cell
    }
}

//MARK: UITableViewDelegate
extension PostViewController: UITableViewDelegate {

}
