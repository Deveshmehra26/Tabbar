//
//  WCMessageTableViewCell.swift
//  WeChat
//
//  Created by Kamal Harariya on 4/21/24.
//

import UIKit

class WCMessageTableViewCell: UITableViewCell {
    
    private let imageDimensions: CGFloat = 70.0
    private let hPadding = 16.0
    
    lazy var cellImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
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
        cellImageView.topAnchor(top: contentView.topAnchor, constant: 12.0)
        let bottom = contentView.bottomAnchor(bottom: cellImageView.bottomAnchor, constant: 12.0)
        bottom.priority = .defaultLow
        bottom.isActive = true
        
        // name label
        
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
}
