
import UIKit

class PostViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var user: String?
    var time: String?
    var caption: String?
    var image: String?
    var postReports: [Report] = []
    let amplifyClient = AmplifyClient()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        
    }
    
    //    func fetchData(){
    //        let postData = Report(name: self.user,
    //                              time: self.time,
    //                              description: self.caption,
    //                              image: self.image!)
    //        amplifyClient.listReports()
    //    }
    
}

extension PostViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postReports.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostsCell", for: indexPath) as! PostsCell
        
        return cell
    }
}
extension PostViewController: UITableViewDelegate {
    
}
