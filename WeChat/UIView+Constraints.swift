//
//  UIView+Constraints.swift
//  WeChat
//
//  Created by Kamal Harariya on 4/22/24.
//

import UIKit

extension UIView {
    
    func leading(leading: NSLayoutXAxisAnchor, constant: CGFloat = 0.0) {
        leadingAnchor.constraint(equalTo: leading, constant: constant).isActive = true
    }
    
    func height(constant: CGFloat = 0.0) {
        heightAnchor.constraint(equalToConstant: constant).isActive = true
    }
    
    func width(constant: CGFloat = 0.0) {
        widthAnchor.constraint(equalToConstant: constant).isActive = true 
    }
    
    @discardableResult
    func topAnchor(top: NSLayoutYAxisAnchor, constant: CGFloat) -> NSLayoutConstraint {
        let topAnchor = topAnchor.constraint(equalTo: top, constant: constant)
        topAnchor.isActive = true
        return topAnchor
    }
    
    @discardableResult
    func bottomAnchor(bottom: NSLayoutYAxisAnchor, constant: CGFloat) -> NSLayoutConstraint {
        let bottomAnchor = bottomAnchor.constraint(equalTo: bottom, constant: constant)
        bottomAnchor.isActive = true
        return bottomAnchor
    }
}
