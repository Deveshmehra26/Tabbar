//
//  CustomViewCOntroller.swift
//  WeChat
//
//  Created by Devesh on 04/05/24.
//

import UIKit

class CustomViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
//        navigationItem.title = "Avatar"
        let imageName = "kamakshi_1"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        
//        let imageView = UIImage(named: "kamakshi_1")
       imageView.frame = CGRect(x: 50, y: 100, width: 300, height: 400)
        view.addSubview(imageView)

        let button = UIButton()
        button.backgroundColor = .red
        button.setTitle("Click Meee!", for: .normal)
//        button.translatesAutoresizingMaskIntoConstraints = false
        button.frame = CGRect(x: 50, y: 510, width: 300, height: 50)
        button.layer.cornerRadius = 5
        view.addSubview(button)
        
//        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
//        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.tintColor = .black
    }
}
