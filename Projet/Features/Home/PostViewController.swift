
import UIKit

class PostViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    private var postReports: [Report] = []
    let amplifyClient = AmplifyClient()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        amplifyClient.listReports(completion: setReports(reports:))
    }
    
    // postReports bch twalli ta5ou tab de Reports
    func setReports(reports: [Report]) {
        postReports = reports
//        postReports.sort { (report1, report2) -> Bool in
//            return report1.createdAt ?? Date() > report2.createdAt ?? Date()
//        }
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
        return cell
    }
}

//MARK: UITableViewDelegate
extension PostViewController: UITableViewDelegate {

}
