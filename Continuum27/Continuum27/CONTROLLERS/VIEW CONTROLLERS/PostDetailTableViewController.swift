//
//  PostDetailTableViewController.swift
//  Continuum27
//
//  Created by Austin West on 7/9/19.
//  Copyright © 2019 Austin West. All rights reserved.
//

import UIKit

class PostDetailTableViewController: UITableViewController {

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var buttonStackView: UIStackView!
    @IBOutlet weak var followPostButton: UIButton!
    
    
    var post: Post? {
        didSet {
            loadViewIfNeeded()
            updateViews()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @objc func updateViews() {
        guard let post = post else { return }
        photoImageView.image = post.photo
        tableView.reloadData()
        updateFollowPostButtonText()
    }
    
    func updateFollowPostButtonText() {
        guard let post = post else { return }
    }
    
    func presentCommentAlertController() {
        let alertController = UIAlertController(title: "Add a Comment", message: "This app is anymous. Have at it", preferredStyle: .alert)
        alertController.addTextField { (textField) in
            textField.placeholder = "This is an epic sentence"
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let commentAction = UIAlertAction(title: "Comment", style: .default) { (_) in
            guard let commentText = alertController.textFields?.first?.text,
            !commentText.isEmpty,
                let post = self.post else { return }
            PostController.shared.addComment(text: commentText, post: post, completion: { (comment) in
            })
            self.tableView.reloadData()
        }
        alertController.addAction(cancelAction)
        alertController.addAction(commentAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    @IBAction func commentButtonTapped(_ sender: Any) {
        presentCommentAlertController()
    }
    
    @IBAction func shareButtonTapped(_ sender: Any) {
    }
    
    @IBAction func followPostTapped(_ sender: Any) {
    }
    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        return post?.comments.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "commentCell", for: indexPath)
        let comment = post?.comments[indexPath.row]
        cell.textLabel?.text = comment?.text
        //cell.detailTextLabel?.text = comment?.timestamp.stringWith(dateStyle: .medium, timeStyle: .short)
      
        return cell
    }
    
}
