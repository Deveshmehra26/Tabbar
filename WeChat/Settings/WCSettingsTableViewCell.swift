//
//  WCSettingsTableViewCell.swift
//  WeChat
//
//  Created by Kamal Harariya on 4/27/24.
//

import UIKit

class WCSettingsTableViewCell: UITableViewCell {
    
    private let hPadding = 16.0
    private let imageDimensions = 30.0
    
    lazy var cellIconView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        imageView.tintColor = .label
        return imageView
    }()
    
    lazy var nameLabel: UILabel = {
        let name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.font = .preferredFont(forTextStyle: .body)
        return name
    }()
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubview()
    }
    
    private func setupSubview() {
        // Image View
        contentView.addSubview(cellIconView)
        cellIconView.leading(leading: contentView.leadingAnchor, constant: hPadding)
        cellIconView.height(constant: imageDimensions)
        cellIconView.width(constant: imageDimensions)
        cellIconView.topAnchor(top: contentView.topAnchor, constant: 8.0)
        let bottom = contentView.bottomAnchor(bottom: cellIconView.bottomAnchor, constant: 8.0)
        bottom.priority = .defaultLow
        bottom.isActive = true
        
        // last time label
        contentView.addSubview(nameLabel)
        contentView.trailingAnchor(trailing: nameLabel.trailingAnchor, constant: hPadding)
        nameLabel.leading(leading: cellIconView.trailingAnchor, constant: 10.0)
        nameLabel.centerYAnchor(center: cellIconView.centerYAnchor)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        cellIconView.image = nil
        nameLabel.text = ""
    }
        
    func updateContents(data: SettingSection?) {
        guard let _data = data else { return }
        cellIconView.image = UIImage(named: _data.imageName)?.withRenderingMode(.alwaysTemplate)
        cellIconView.tintColor = .label
        nameLabel.text = _data.name

    }
}
