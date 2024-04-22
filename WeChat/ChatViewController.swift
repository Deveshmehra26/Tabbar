//
//  ChatViewController.swift
//  TabBar
//
//  Created by Kamal Harariya on 4/18/24.
//

import UIKit

class ChatViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
//    func setupRightBarButtonItems() {
//        let cameraButton = UIBarButtonItem(image: UIImage(named: "camera.fill"), style: .plain, target: self, action: #selector(cameraButtonTapped(_:)))
//        let aiButton = UIBarButtonItem(image: UIImage(named: "circlebadge"), style: .plain, target: self, action: #selector(circleButtonTapped(_:)))
//        let newChatButton = UIBarButtonItem(image: UIImage(named: "plus.circle.fill"), style: .plain, target: self, action: #selector(newChatButtonTapped(_:)))
//        
//        self.navigationItem.rightBarButtonItems = [cameraButton, aiButton, newChatButton]
//    }
    
    @objc func cameraButtonTapped(_ sender: UIBarButtonItem) {
        
    }
    
    @objc func circleButtonTapped(_ sender: UIBarButtonItem) {
        
    }
    
    @objc func newChatButtonTapped(_ sender: UIBarButtonItem) {
        
    }
}
