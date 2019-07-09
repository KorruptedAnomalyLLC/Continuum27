//
//  Post.swift
//  Continuum27
//
//  Created by Austin West on 7/9/19.
//  Copyright © 2019 Austin West. All rights reserved.
//

import UIKit

class Post {
    
    var photoData: Data?
    var timestamp: Date
    var caption: String
    var comments: [Comment]
    var photo: UIImage? {
        get {
            guard let photoData = photoData else { return nil }
            return UIImage(data: photoData)
        }
        set  {
            photoData = newValue?.jpegData(compressionQuality: 0.5)
        }
    }
    
    // MARK: - Initializers
    init(timestamp: Date = Date(), caption: String, comments: [Comment], photo: UIImage) {
        self.timestamp = timestamp
        self.caption = caption
        self.comments = comments
        self.photo = photo
    }
    
}
