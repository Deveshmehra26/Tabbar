//
//  WCRootViewController.swift
//  TabBar
//
//  Created by Devesh on 18/04/24.
//

import UIKit

class WCRootViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let prevSelectedIndex = UserDefaults.standard.integer(forKey: "TBSelctedIndex") 
        selectedIndex = prevSelectedIndex
    }
}

extension WCRootViewController: UITabBarControllerDelegate {
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if let selectedIndex = tabBar.items?.firstIndex(of: item) {
            UserDefaults.standard.setValue(selectedIndex, forKey: "TBSelctedIndex")
            UserDefaults.standard.synchronize()
        }
    }
}

