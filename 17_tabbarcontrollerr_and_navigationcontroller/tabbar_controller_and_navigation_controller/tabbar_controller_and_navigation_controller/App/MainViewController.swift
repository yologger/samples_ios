//
//  ViewController.swift
//  tabbar_controller_and_navigation_controller
//
//  Created by Hyukjung Kwon on 2021/02/26.
//

import UIKit

class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func openNavigationInTabbar(_ sender: Any) {
        
        let firstVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FirstViewController") as! FirstViewController
        let firstNavigationVC = UINavigationController(rootViewController: firstVC)
        let title1 = "first"
        let tabBarItem1 = UITabBarItem(title: title1, image: nil, selectedImage: nil)
        firstNavigationVC.navigationBar.topItem?.title = "FirstVC Navigation"
        firstNavigationVC.tabBarItem = tabBarItem1
        
        
        let secondVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        let secondNavigationVC = UINavigationController(rootViewController: secondVC)
        let title2 = "second"
        let tabBarItem2 = UITabBarItem(title: title2, image: nil, selectedImage: nil)
        secondNavigationVC.navigationBar.topItem?.title = "SecondVC Navigation"
        secondNavigationVC.tabBarItem = tabBarItem2
        
        
        let tabbarController = UITabBarController()
        tabbarController.modalPresentationStyle = .fullScreen
        tabbarController.setViewControllers([firstNavigationVC, secondNavigationVC], animated: true)
        present(tabbarController, animated: true, completion: nil)
    }
    
    
    @IBAction func openTabbarInNavigation(_ sender: Any) {
        
        let thirdVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ThirdViewController") as! ThirdViewController
        let title3 = "Third"
        let tabBarItem3 = UITabBarItem(title: title3, image: nil, selectedImage: nil)
        thirdVC.tabBarItem = tabBarItem3
        
        
        let fourthVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FourthViewController") as! FourthViewController
        let title4 = "Fourth"
        let tabBarItem4 = UITabBarItem(title: title4, image: nil, selectedImage: nil)
        fourthVC.tabBarItem = tabBarItem4
        
        
        let tabbarController = UITabBarController()
        tabbarController.setViewControllers([thirdVC, fourthVC], animated: true)
        
        
        let navigationController = UINavigationController(rootViewController: tabbarController)
        navigationController.navigationBar.topItem?.title = "Tabbar in Navigation"
        navigationController.modalPresentationStyle = .fullScreen
        present(navigationController, animated: true, completion: nil)
    }
    
    @IBAction func openTabbarByStoryboard(_ sender: Any) {
        
        let tabbarVC = UIStoryboard(name: "TabbarByStoryboard", bundle: nil).instantiateViewController(withIdentifier: "TabbarController") as! TabbarController
        tabbarVC.modalPresentationStyle = .fullScreen
        
        present(tabbarVC, animated: true, completion: nil)
        
    }
}

