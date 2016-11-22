//
//  CircleImageView.swift
//  Blinks Socials
//
//  Created by MishariSH on 11/15/16.
//  Copyright © 2016 MishariSH. All rights reserved.
//

import UIKit

class CircleImageView: UIImageView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = self.frame.width / 2
        clipsToBounds = true
    }
    
}
