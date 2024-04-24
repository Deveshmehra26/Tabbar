//
//  WCMessageTableViewCell.swift
//  WeChat
//
//  Created by Kamal Harariya on 4/21/24.
//

import UIKit

class WCMessageTableViewCell: UITableViewCell {
    
    private let imageDimensions: CGFloat = 60.0
    private let hPadding = 16.0
    
    lazy var cellImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    lazy var nameLabel: UILabel = {
        let name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.font = .preferredFont(forTextStyle: .headline)
        return name
    }()
    
    lazy var lastMessageLabel: UILabel = {
        let name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.font = .preferredFont(forTextStyle: .subheadline)
        return name
    }()
    
    lazy var lastUpdatedTimeLabel: UILabel = {
        let name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.font = .preferredFont(forTextStyle: .subheadline)
        return name
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubview()
    }
    
    func setupSubview() {
        // Image View
        contentView.addSubview(cellImageView)
        cellImageView.leading(leading: contentView.leadingAnchor, constant: hPadding)
        cellImageView.height(constant: imageDimensions)
        cellImageView.width(constant: imageDimensions)
        cellImageView.topAnchor(top: contentView.topAnchor, constant: 12.0)
        let bottom = contentView.bottomAnchor(bottom: cellImageView.bottomAnchor, constant: 12.0)
        bottom.priority = .defaultLow
        bottom.isActive = true
        
        // name label
        contentView.addSubview(nameLabel)
        nameLabel.leading(leading: cellImageView.trailingAnchor, constant: 10.0)
        nameLabel.topAnchor(top: cellImageView.topAnchor)
        
        // last message label
        contentView.addSubview(lastMessageLabel)
        lastMessageLabel.topAnchor(top: nameLabel.bottomAnchor, constant: 4.0)
        lastMessageLabel.leading(leading: nameLabel.leadingAnchor)
        lastMessageLabel.trailingAnchor(trailing: nameLabel.trailingAnchor)
        
        // last time label
        contentView.addSubview(lastUpdatedTimeLabel)
        contentView.trailingAnchor(trailing: lastUpdatedTimeLabel.trailingAnchor, constant: hPadding)
        lastUpdatedTimeLabel.leading(leading: nameLabel.trailingAnchor, constant: 10.0)
        lastUpdatedTimeLabel.centerYAnchor.constraint(equalTo: nameLabel.centerYAnchor).isActive = true 
        lastUpdatedTimeLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        cellImageView.image = nil
    }
    
    func polishImageView(imageName: String) {
        cellImageView.image = UIImage(named: imageName)
        cellImageView.layer.masksToBounds = false
        cellImageView.layer.cornerRadius = imageDimensions / 2.0
        cellImageView.backgroundColor = .lightGray
        cellImageView.clipsToBounds = true
    }
    
    func polishTimeLabel(time: TimeInterval?, isUnread: Bool) {
        guard let _time = time else { return }
        let date = Date(timeIntervalSince1970: _time)
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.calendar = Calendar.current
        
        let calendar = Calendar.current
        let currentDate = Date()
        let lastMessageDay = calendar.component(.day, from: date)
        let currentDay = calendar.component(.day, from: currentDate)
        let difference = currentDay - lastMessageDay
        if difference >= 7 {
            dateFormatter.dateFormat = "M/dd/yy"
            lastUpdatedTimeLabel.text = dateFormatter.string(from: date)
        } else if (currentDay - lastMessageDay > 1) {
            dateFormatter.dateFormat = "EEEE"
            lastUpdatedTimeLabel.text = dateFormatter.string(from: date)
        } else if (currentDay - lastMessageDay == 1) {
            lastUpdatedTimeLabel.text = "Yesterday"
        } else {
            dateFormatter.dateFormat = "h:mm a"
            let str = dateFormatter.string(from: date)
            lastUpdatedTimeLabel.text = str
        }

        lastUpdatedTimeLabel.textColor = isUnread ? .green : .gray
    }
}
