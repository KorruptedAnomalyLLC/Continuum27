//
//  Comment.swift
//  Continuum27
//
//  Created by Austin West on 7/9/19.
//  Copyright © 2019 Austin West. All rights reserved.
//

import Foundation

struct  CommentConstants {
    static let rextKey = "Comment"
    static let timestampKey = "timestamp"
    static let postReferenceKey = "post"
}

class Comment {
    
    let text: String
    let timestamp: Date
    
    weak var post: Post?
    
        
    
    // Initializer
    init(text: String, timestamp: Date = Date(), post: Post) {
        self.text = text
        self.timestamp = timestamp
        self.post = post
    }
    
}
