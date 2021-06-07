
import UIKit

class PostViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var user: String?
    var time: String?
    var caption: String?
    var image: String?
    private var postReports: [Report] = []
    let amplifyClient = AmplifyClient()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        amplifyClient.getReports()
        amplifyClient.listReports(setReports: setReports(reports:))
        tableView.reloadData()
        
    }
    
//        func fetchData(){
////            let reports = Report(name: self.user,
////                                  description: self.caption,
////                                  image: self.image!,
////                                  time: self.time)
//
//    //    //        }
    
    // postReports bch twalli ta5ou tab de Reports
    func setReports(reports: [Report]) {
        postReports = reports
    }
}

//MARK: UITableViewDataSource
extension PostViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postReports.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostsCell", for: indexPath) as! PostsCell
        cell.userLabel.text = user
        cell.timeLabel.text = time
        cell.captionLabel.text = caption
        //cell.postImageView.image = UIImage(named: image!)
        //cell.update()
        return cell
    }
}

//MARK: UITableViewDelegate
extension PostViewController: UITableViewDelegate {
    
}
