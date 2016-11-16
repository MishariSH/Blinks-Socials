//
//  CircleImageView.swift
//  Blinks Socials
//
//  Created by MishariSH on 11/15/16.
//  Copyright © 2016 MishariSH. All rights reserved.
//

import UIKit

class CircleImageView: UIImageView {

    override func awakeFromNib() {
        super.awakeFromNib()
        layer.shadowColor = UIColor(red: SHADOW_GRAY, green: SHADOW_GRAY, blue: SHADOW_GRAY, alpha: 0.6).cgColor
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 5.0
        layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        
    }
    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        layer.cornerRadius = self.frame.width / 2
//        
//    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        layer.cornerRadius = self.frame.width / 2
    }
    
}
