//
//  UIView.swift
//  Food_Ordering
//
//  Created by praveen mack on 30/08/21.
//

import UIKit

extension UIView {
    
    func pin(to superView: UIView){
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: superView.topAnchor).isActive = true
        leadingAnchor.constraint(equalTo: superView.leadingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: superView.bottomAnchor).isActive = true
        trailingAnchor.constraint(equalTo: superView.trailingAnchor).isActive = true
    }
    
    func setCardShadow(){
        layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3).cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset =  CGSize(width: 0, height: 0)
        layer.shadowRadius = 10
        layer.shouldRasterize = true
        layer.masksToBounds = false
        layer.rasterizationScale = UIScreen.main.scale
    }
    
    func removeCardShadow(){
        layer.shadowRadius = 0
        layer.shadowColor = UIColor.clear.cgColor
    }
    
}

extension UIColor {
    static let color1:UIColor = UIColor(red: 248/255, green: 126/255, blue: 5/255, alpha: 0.4)
    static let color2:UIColor = UIColor(red: 171/255, green: 24/255, blue: 47/255, alpha: 0.4)
    static let color3:UIColor = UIColor(red: 22/255, green: 191/255, blue: 0/255, alpha: 0.4)
    static let color4:UIColor = UIColor(red: 5/255, green: 147/255, blue: 248/255, alpha: 0.4)
}

extension NSTextAttachment {
    func setImageHeight(height: CGFloat) {
        guard let image = image else { return }
        let ratio = image.size.width / image.size.height
        
        bounds = CGRect(x: bounds.origin.x, y: bounds.origin.y, width: ratio * height, height: height)
    }
}
