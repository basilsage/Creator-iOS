//
//  CommentController.swift
//  Creator
//
//  Created by DJ Satoda on 8/23/20.
//  Copyright © 2020 DJ Satoda. All rights reserved.
//

import Foundation
import UIKit

class CommentController : UITableViewController {
    
    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(CommentControllerCell.self, forCellReuseIdentifier: cellId)
        navigationItem.title = "Comments"
        navigationController?.navigationBar.backItem?.backBarButtonItem?.tintColor = .black
        tableView.allowsSelection = false
        
    }
    
    //MARK: Feed data, to be replaced by backend
    
    var profilePics : [UIImage?] = [#imageLiteral(resourceName: "brooksProfilePic"),#imageLiteral(resourceName: "rockyProfile"),#imageLiteral(resourceName: "benProfilePic"), UIImage(named: "yeProfile.jpg")]
    
    
    //MARK: Tableview required methods
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! CommentControllerCell
        cell.profileImage.image = profilePics[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
}

