//
//  WCSettingsProfileTableViewCell.swift
//  WeChat
//
//  Created by Kamal Harariya on 4/27/24.
//

import UIKit

class WCSettingsProfileTableViewCell: UITableViewCell {
    
    private let imageDimensions: CGFloat = 50.0
    private let hPadding = 16.0
    private let barCodeDimension = 36.0
    
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
    
    lazy var statusLabel: UILabel = {
        let name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.font = .preferredFont(forTextStyle: .subheadline)
        return name
    }()
    
    lazy var barCodeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
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
        cellImageView.topAnchor(top: contentView.topAnchor, constant: 8.0)
        let bottom = contentView.bottomAnchor(bottom: cellImageView.bottomAnchor, constant: 8.0)
        bottom.priority = .defaultLow
        bottom.isActive = true
        
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        contentView.addSubview(stackView)
        stackView.alignment = .leading
        stackView.spacing = 8.0
        stackView.leading(leading: cellImageView.trailingAnchor, constant: 10.0)
        stackView.centerYAnchor(center: cellImageView.centerYAnchor)
        
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(statusLabel)
        
        
        // last time label
        contentView.addSubview(barCodeImageView)
        barCodeImageView.width(constant: barCodeDimension)
        barCodeImageView.height(constant: barCodeDimension)
        contentView.trailingAnchor(trailing: barCodeImageView.trailingAnchor, constant: hPadding)
        barCodeImageView.leading(leading: stackView.trailingAnchor, constant: 10.0)
        barCodeImageView.centerYAnchor(center: cellImageView.centerYAnchor)
        barCodeImageView.contentMode = .scaleToFill
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        cellImageView.image = nil
        nameLabel.text = ""
        statusLabel.text = ""
    }
    
    private func polishImageView(imageName: String, imageView: UIImageView, radius: CGFloat) {
        imageView.image = UIImage(named: imageName)
        imageView.layer.masksToBounds = false
        imageView.layer.cornerRadius = radius
        imageView.backgroundColor = .lightGray
        imageView.clipsToBounds = true
    }
    
    func updateContents(data: SettingSection?) {
        guard let _data = data else { return }
        polishImageView(imageName: _data.imageName, imageView: cellImageView, radius: imageDimensions / 2.0)
        if _data.isBarCodeAvailable ?? false {
            polishImageView(imageName: "BarCode", imageView: barCodeImageView, radius: barCodeDimension / 2.0)
        }
        nameLabel.text = _data.name
        if let status = _data.status {
            statusLabel.isHidden = false
            statusLabel.text = status
        } else {
            statusLabel.isHidden = true
        }
    }
}
