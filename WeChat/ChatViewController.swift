//
//  ChatViewController.swift
//  TabBar
//
//  Created by Kamal Harariya on 4/18/24.
//

import UIKit

class ChatViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    let chatViewModel = ChatViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.register(WCMessageTableViewCell.self, forCellReuseIdentifier: "ChatCellID")
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 100.0, bottom: 0, right: 0.0)
        chatViewModel.getChatList { result in
            switch result {
            case .success:
                setupRightBarButtonItems()
                
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension ChatViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatViewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        guard let chatData = chatViewModel.message(at: indexPath.row) else {
            return cell
        }
        
        switch chatData.type {
        case .archive:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "ArchiveCellID", for: indexPath) as? WCArchiveTableViewCell {
                cell.titleLabel.text = chatData.name
                return cell
            }
        case .chat:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "ChatCellID", for: indexPath) as? WCMessageTableViewCell {
//                cell.nameLabel.text = chatData.name
//                cell.lastMessageLabel.text = chatData.messages?.last?.message
                cell.polishImageView(imageName: chatData.image)
                return cell
            }
        }
        return cell
    }
}

private extension ChatViewController {
    
    func setupRightBarButtonItems() {
        let stackview = UIStackView()
        
        if let circleButton = createButton(name: "circle", color: .green) {
            circleButton.addTarget(self, action: #selector(circleButtonTapped(_:)), for: .touchUpInside)
            stackview.addArrangedSubview(circleButton)
        }
        
        if let cameraButton = createButton(name: "camera", color: .black) {
            cameraButton.addTarget(self, action: #selector(cameraButtonTapped(_:)), for: .touchUpInside)
            stackview.addArrangedSubview(cameraButton)
        }
        
        if let chatButton = createButton(name:"plusIcon", color: .systemBlue) {
            chatButton.addTarget(self, action: #selector(chatButtonTapped(_:)), for: .touchUpInside)
            stackview.addArrangedSubview(chatButton)
        }
        
        stackview.distribution = .equalSpacing
        stackview.axis = .horizontal
        stackview.alignment = .center
        stackview.spacing = 12
        let rightBarButton = UIBarButtonItem(customView: stackview)
        navigationItem.rightBarButtonItem = rightBarButton
    }
    
    func createButton(name: String, color: UIColor) -> UIButton? {
        let button = UIButton.init(type: .custom)
        let buttomImage = UIImage(named: name)?.withRenderingMode(.alwaysTemplate)
        button.setImage(buttomImage, for: .normal)
        button.tintColor = color
        return button
    }
    
    @objc func cameraButtonTapped(_ button: UIBarButtonItem) {
        
    }
    
    @objc func chatButtonTapped(_ button: UIBarButtonItem) {
        
    }
    
    @objc func circleButtonTapped(_ button: UIBarButtonItem) {
        
    }
}
