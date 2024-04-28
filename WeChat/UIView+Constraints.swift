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
    
    @discardableResult
    func trailingAnchor(trailing: NSLayoutXAxisAnchor, constant: CGFloat = 0.0) -> NSLayoutConstraint {
        let trailingAnchor = trailingAnchor.constraint(equalTo: trailing, constant: constant)
        trailingAnchor.isActive = true
        return trailingAnchor
    }
    
    func height(constant: CGFloat = 0.0) {
        heightAnchor.constraint(equalToConstant: constant).isActive = true
    }
    
    func width(constant: CGFloat = 0.0) {
        widthAnchor.constraint(equalToConstant: constant).isActive = true 
    }
    
    @discardableResult
    func topAnchor(top: NSLayoutYAxisAnchor, constant: CGFloat = 0.0) -> NSLayoutConstraint {
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
    
    @discardableResult
    func centerYAnchor(center: NSLayoutYAxisAnchor) -> NSLayoutConstraint {
        let center = centerYAnchor.constraint(equalTo: center)
        center.isActive = true
        return center
    }
}
