//
//  WCMessageTableViewCell.swift
//  WeChat
//
//  Created by Kamal Harariya on 4/21/24.
//

import UIKit

class WCMessageTableViewCell: UITableViewCell {
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var lastMessageLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func polishImageView() {
        iconImageView.layer.cornerRadius = 35
        iconImageView.layer.masksToBounds = true
        iconImageView.backgroundColor = .lightGray
    }
}
