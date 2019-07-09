//
//  PostController.swift
//  Continuum27
//
//  Created by Austin West on 7/9/19.
//  Copyright © 2019 Austin West. All rights reserved.
//

import Foundation

class PostController {
    
// Singleton
    static let shared = PostController()
    
    // Source of Truth
    var posts: [Post] = []
    
    
    func addComment(text: String, post: Post, completion: @escaping (Comment?) -> Void) {
        let comment = Comment(text: text, post: post)
        post.comments.append(comment)
    }
}
