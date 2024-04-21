//
//  WCRootViewController.swift
//  WeChat
//
//  Created by Kamal Harariya on 4/21/24.
//

import UIKit


class WCRootViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedIndex = UserDefaults.standard.integer(forKey: "CurrentSelectedIndex")
    }
}

extension WCRootViewController: UITabBarControllerDelegate {
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if let index = tabBar.items?.firstIndex(of: item) {
            UserDefaults.standard.set(index, forKey: "CurrentSelectedIndex")
        }
    }
}

