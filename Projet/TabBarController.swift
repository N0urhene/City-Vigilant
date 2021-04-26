//
//  TabBarController.swift
//  Projet
//
//  Created by nourhene on 26/04/2021.
//

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
        
        let viewcontrollerVert = UIViewController()
        viewcontrollerVert.view.backgroundColor = .green
        viewcontrollerVert.title = "vert"


        setViewControllers([homeVC, reportNav, viewcontrollerVert], animated: true)
    }
    
}
