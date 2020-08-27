//
//  CommentController.swift
//  Creator
//
//  Created by DJ Satoda on 8/23/20.
//  Copyright © 2020 DJ Satoda. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class CommentController : UITableViewController {
    
    let cellId = "cellId"
    
    override func viewDidAppear(_ animated: Bool) {
        fetchComments()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(CommentControllerCell.self, forCellReuseIdentifier: cellId)
        navigationItem.title = "Comments"
        navigationController?.navigationBar.backItem?.backBarButtonItem?.tintColor = .black
        tableView.allowsSelection = false
        
    }
    
    //MARK: Feed data, to be replaced by backend
    
    var profilePics : [UIImage?] = [#imageLiteral(resourceName: "brooksProfilePic"),#imageLiteral(resourceName: "rockyProfile"),#imageLiteral(resourceName: "benProfilePic"), UIImage(named: "yeProfile.jpg"),UIImage(named: "yeProfile.jpg"),UIImage(named: "yeProfile.jpg"),UIImage(named: "yeProfile.jpg"),UIImage(named: "yeProfile.jpg"),UIImage(named: "yeProfile.jpg"),UIImage(named: "yeProfile.jpg"),UIImage(named: "yeProfile.jpg"),UIImage(named: "yeProfile.jpg")]
    
    
    var comments = [Comment]()
    func fetchComments() {
        comments.removeAll()
        
        let ref = Database.database().reference().child("comments")
        
        ref.observeSingleEvent(of: .value) { (snapshot) in
            // converts all transactions into a single dictionary
            guard let dictionaries = snapshot.value as? [String: Any] else { return }
            print("All comments dictionaries: ")
            print(dictionaries)
            
            // for each comment in dictionary:
            dictionaries.forEach { (key, value) in
                
                // turn the comment into a dictionary
                guard let dictionary = value as? [String : Any] else { return }
                print("For each comment, currently: ")
                print(dictionary)
//
                let currentTime = NSDate().timeIntervalSince1970
                let currentTimeNSNumber = currentTime as NSNumber
                guard let currentUserEmail = Auth.auth().currentUser?.email else {return}
                let commentBody = dictionary["body"] as! String
//
                let currentUser = User(userName: currentUserEmail, firstName: "X", lastName: "X", type: User.UserType.FAN)
                let comment = Comment(user: currentUser, createdAtSeconds: currentTimeNSNumber, body: commentBody)
                
                
                print("Appending comment")
                self.comments.append(comment)
                
                
            }
            
            
            self.tableView.reloadData()
        
        
        
        }
    }
    
    
    //MARK: Tableview required methods
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! CommentControllerCell
        cell.profileImage.image = profilePics[indexPath.row]
        cell.usernameAndBodyLabel.text = comments[indexPath.row].body
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    // idk why you need lazy but you can't grab its text until you do...
    lazy var containerView : UIView = {
        let containerView = UIView()
//        containerView.autoresizingMask = .flexibleHeight
        containerView.backgroundColor = .red
        containerView.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        
        let submitButton = UIButton(type: .system)
        submitButton.setTitle("Submit", for: .normal)
        submitButton.setTitleColor(.black, for: .normal)
        
        
        containerView.addSubview(submitButton)
        submitButton.anchor(top: containerView.topAnchor, left: nil, bottom: containerView.bottomAnchor, right: containerView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 12, width: 50, height: 0)
        
        
        
        
        containerView.addSubview(commentTextField)
        self.commentTextField.anchor(top: containerView.topAnchor, left: containerView.leftAnchor, bottom: containerView.bottomAnchor, right: submitButton.leftAnchor, paddingTop: 0, paddingLeft: 12, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        submitButton.addTarget(self, action: #selector(handleSubmit), for: .touchUpInside)
        
//        textField.anchor(top: containerView.topAnchor, left: containerView.leftAnchor, bottom: containerView.layoutMarginsGuide.bottomAnchor, right: containerView.rightAnchor, paddingTop: 0, paddingLeft: 12, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        return containerView
    }()
    
    let commentTextField : UITextField = {
        let commentTextField = UITextField()
        commentTextField.placeholder = "Enter comment."
        return commentTextField
    }()
    
    @objc func handleSubmit() {
        
        guard let commentBody = commentTextField.text else { return }
        
        print("Comment button pressed. Submitting the following comment: \(commentBody)")
//
        guard let currentUserEmail  = Auth.auth().currentUser?.email else { return }
//
        let currentUser = User(userName: currentUserEmail, firstName: "X", lastName: "X", type: User.UserType.FAN)
        let myComment = Comment(user: currentUser, createdAtSeconds: NSNumber(value: NSDate().timeIntervalSince1970), body: commentBody, reactions: [])
//
        let usersRef = Database.database().reference().child("comments").childByAutoId()
//
        usersRef.updateChildValues(myComment.toDictionary() as [AnyHashable : Any]) { (err, ref) in
            if let err = err {
                print("Failed to save comment to DB", err)
                return
            }

            print("Successfully saved comment to DB")
        }
        
    }
    
    // provides bottom input accessorry
    override var inputAccessoryView: UIView? {
        get {
            return containerView
        }
    }
    
    override var canBecomeFirstResponder: Bool {
        return true
    }
    
    // disappear tab bar
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        tabBarController?.tabBar.isHidden = false
    }
    
}

