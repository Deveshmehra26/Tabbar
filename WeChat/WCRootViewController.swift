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
        let prevSelectedIndex = UserDefaults.standard.integer(forKey: "CurrentSelectedIndex") 
        selectedIndex = prevSelectedIndex
    }
}

extension WCRootViewController: UITabBarControllerDelegate {
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if let selectedIndex = tabBar.items?.firstIndex(of: item) {
            UserDefaults.standard.setValue(selectedIndex, forKey: "CurrentSelectedIndex")
            UserDefaults.standard.synchronize()
        }
    }
}

