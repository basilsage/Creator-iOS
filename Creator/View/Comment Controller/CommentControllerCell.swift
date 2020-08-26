//
//  CommentControllerCell.swift
//  Creator
//
//  Created by DJ Satoda on 8/23/20.
//  Copyright © 2020 DJ Satoda. All rights reserved.
//

import Firebase
import Foundation
import UIKit

protocol CommentCellDelegate {
//    func didTapCommentButton()
}

class CommentControllerCell : UITableViewCell {
    
    var delegate : CommentCellDelegate?
    
    //MARK: UI Elements
    
    let profileImage : UIImageView = {
        let pi = UIImageView()
        pi.contentMode = .scaleAspectFill
        pi.clipsToBounds = true
        pi.isUserInteractionEnabled = false
        return pi
    }()
    
    
    let usernameAndBodyLabel : UILabel = {
        let uabl = UILabel()
        uabl.numberOfLines = 0
        
        let attributedText = NSMutableAttributedString(string: "username ", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 8)])
        attributedText.append(NSMutableAttributedString(string: "hello this is my comment. ake a symbolic breakpoint at UIViewAlertForUnsatisfiableConstraints to catch this in the debugger.", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 8)]))
        uabl.attributedText = attributedText

        return uabl
    }()
    
    let commentTimeLabel : UILabel = {
        let ctl = UILabel()
        ctl.text = "1 hour ago"
        ctl.font = UIFont.boldSystemFont(ofSize: 8)
        return ctl
    }()
    
    lazy var likeButton : UIButton = {
        let likeButton = UIButton(type: .system)
        likeButton.tintColor = .black
        likeButton.setTitle("🤍 10", for: .normal) //eventually link this count to backend
        likeButton.addTarget(self, action: #selector(likeButtonPressed), for: .touchUpInside)
        return likeButton
    }()
    
    @objc func likeButtonPressed() {
        // save like button to db
        print("Likedd")
    }
    
//    func saveToDb() {
//        guard let uid = Auth.auth().currentUser?.uid else { return }
//        let dateCreated = NSDate().timeIntervalSince1970
//        guard let email = Auth.auth().currentUser?.email else { return }
//
//        let newUser = User(userName: email, firstName: "Raghav", lastName: "Sehtia", type: User.UserType.FAN)
//
//        let reaction = Reaction(user: newUser, type: Reaction.ReactionType.LIKE)
//        //
//        let usersRef = Database.database().reference().child("feedItems").child(uid)
//        //        let values = ["creationDate": dateCreated, "email" : email, "userType" : "FAN"] as [String : Any]
//
//        usersRef.updateChildValues(reaction.toDictionary() as [AnyHashable : Any]) { (err, ref) in
//            if let err = err {
//                print("Failed to save user to DB", err)
//                return
//            }
//
//            print("Successfully saved user to DB")
//        }
//    }
    
    
    let bottomDivider : UIView = {
        let bd = UIView()
        bd.backgroundColor = UIColor.lightGray
        return bd
    }()
        
    
    //MARK: Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let profileImageWidth : CGFloat = 30
        
        addSubview(profileImage)
        profileImage.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 10, paddingLeft: 10, paddingBottom: 10, paddingRight: 0, width: profileImageWidth, height: profileImageWidth)
        profileImage.layer.cornerRadius = profileImageWidth / 2
        
        addSubview(likeButton)
        likeButton.anchor(top: topAnchor, left: nil, bottom: bottomAnchor, right: rightAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 10, paddingRight: 10, width: 50, height: 50)
        
        
        addSubview(usernameAndBodyLabel)
        usernameAndBodyLabel.anchor(top: topAnchor, left: profileImage.rightAnchor, bottom: nil, right: likeButton.leftAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: 0, height: 10)
        
        addSubview(commentTimeLabel)
        commentTimeLabel.anchor(top: usernameAndBodyLabel.bottomAnchor, left: profileImage.rightAnchor, bottom: bottomAnchor, right: nil, paddingTop: 5, paddingLeft: 10, paddingBottom: 10, paddingRight: 0, width: 80, height: 10)
        

        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
