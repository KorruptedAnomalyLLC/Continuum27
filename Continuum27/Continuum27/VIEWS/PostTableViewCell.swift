//
//  PostTableViewCell.swift
//  Continuum27
//
//  Created by Austin West on 7/9/19.
//  Copyright © 2019 Austin West. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    @IBOutlet weak var postPhotoImageView: UIImageView!
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var commentCountLabel: UILabel!
    

    var post: Post? {
        didSet {
            updateViews()
        }
    }
    
    
    func updateViews() {
        postPhotoImageView.image = post?.photo
        captionLabel.text = post?.caption
        
        
    }

}
