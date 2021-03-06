
import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .gray
        
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let storyboard = UIStoryboard(name: "Storyboard", bundle: nil)
        
        let homeVC = mainStoryboard.instantiateViewController(withIdentifier: "HomeViewController")
        let reportCategoriesViewController = mainStoryboard.instantiateViewController(withIdentifier: "ReportCategoriesViewController") as! ReportCategoriesViewController
        let reportNav = UINavigationController(rootViewController: reportCategoriesViewController)
        reportNav.navigationBar.prefersLargeTitles = true
        reportNav.navigationBar.backgroundColor = .white
        let PostViewController = mainStoryboard.instantiateViewController(withIdentifier: "PostViewController")
        let ProfileViewController = mainStoryboard.instantiateViewController(withIdentifier: "ProfileViewController")
     let navigationController = UINavigationController(rootViewController:ProfileViewController)
        setViewControllers([homeVC, PostViewController, reportNav, navigationController], animated: true)
    }
    
}
