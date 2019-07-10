//
//  PostListTableViewController.swift
//  Continuum27
//
//  Created by Austin West on 7/9/19.
//  Copyright © 2019 Austin West. All rights reserved.
//

import UIKit

class PostListTableViewController: UITableViewController {

//    var resultsArray: [SearchableRecord] = []
//    var isSearching = false
//    var dataSource: [SearchableRecord] {
//        return isSearching ? resultsArray : PostController.shared.posts
//    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        DispatchQueue.main.async {
            
              self.tableView.reloadData()
        }
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 0 //dataSource.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as! PostTableViewCell
        let post = /* dataSource */[indexPath.row] as? Post
        cell.post = post
      
        return cell
    }



    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPostDetailVC" {
            let destinationVC = segue.destination as! PostDetailTableViewController
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            let post = PostController.shared.posts[indexPath.row]
            destinationVC.post = post
        }
    }
}
