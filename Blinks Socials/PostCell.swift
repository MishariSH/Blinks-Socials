//
//  PostCell.swift
//  Blinks Socials
//
//  Created by MishariSH on 11/16/16.
//  Copyright © 2016 MishariSH. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {

    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var usernameLbl: UILabel!
    @IBOutlet weak var postImg: UIImageView!
    @IBOutlet weak var caption: UITextView!
    @IBOutlet weak var likes: UILabel!
    
    var post: Post!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(post: Post) {
        
        self.post = post
        self.caption.text = post.caption
        self.likes.text = "\(post.likes)"
        
    }

}
