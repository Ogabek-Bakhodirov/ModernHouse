//
//  ViewController.swift
//  ModernHouse
//
//  Created by Ogabek Bakhodirov on 28/01/23.
//

import UIKit

class TabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        setTabbar()
    }
    
    func setTabbar(){        
        let mainViewItem = UITabBarItem()
        mainViewItem.title = "Work space"
        mainViewItem.image = UIImage.init(systemName: "pencil.line")
        
        let mainViewController = HomeViewController() //WorkSpaceCotroller()
        mainViewController.tabBarItem = mainViewItem
        
        let aboutAppItem = UITabBarItem()
        aboutAppItem.title = "About"
        aboutAppItem.image = UIImage.init(systemName: "exclamationmark.circle")
        
        let aboutAppController = AboutAppController()
        aboutAppController.tabBarItem = aboutAppItem
        
        self.setViewControllers([mainViewController, aboutAppController], animated: false)
    }
}

