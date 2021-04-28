
import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .gray
        
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        let homeVC = mainStoryboard.instantiateViewController(withIdentifier: "HomeViewController")
        
        let reportCategoriesViewController = mainStoryboard.instantiateViewController(withIdentifier: "ReportCategoriesViewController") as! ReportCategoriesViewController
        let reportNav = UINavigationController(rootViewController: reportCategoriesViewController)
        reportNav.navigationBar.prefersLargeTitles = true
        reportNav.navigationBar.backgroundColor = .white
        let PostsViewController = mainStoryboard.instantiateViewController(withIdentifier: "PostsViewController")
        let ProfileViewController = mainStoryboard.instantiateViewController(withIdentifier: "ProfileViewController")

        setViewControllers([homeVC, PostsViewController, reportNav, ProfileViewController], animated: true)
    }
    
}
