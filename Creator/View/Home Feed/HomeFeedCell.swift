//
//  HomeFeedCell.swift
//  Creator
//
//  Created by DJ Satoda on 4/25/20.
//  Copyright © 2020 DJ Satoda. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class HomeFeedCell : UITableViewCell {
    
    //MARK: UI Elements
    
    let friendProfileImage : UIImageView = {
        let fpi = UIImageView()
        fpi.contentMode = .scaleAspectFill
        fpi.clipsToBounds = true
        fpi.isUserInteractionEnabled = false
        return fpi
    }()
    
    let friendActionDescriptor : UILabel = {
        let fnl = UILabel()
        fnl.font = UIFont(name: "Futura", size: 14)
        return fnl
    }()
    
    let collectibleImage : UIImageView = {
        let ci = UIImageView()
        ci.clipsToBounds = true
        ci.contentMode = .scaleAspectFill
        ci.isUserInteractionEnabled = false
        return ci
    }()
    
    let collectibleTitle : UILabel = {
        let cd = UILabel()
        cd.textColor = .black
        return cd
    }()
    
    let collectibleArtist : UILabel = {
        let ca = UILabel()
        ca.font = UIFont(name: "Futura", size: 16)
        ca.textColor = .black
        return ca
    }()
    
    let collectibleDescription : UILabel = {
        let cd = UILabel()
        cd.font = UIFont(name: "Futura-Medium", size: 12)
        cd.textColor = UIColor.rgb(red: 70, green: 69, blue: 70)
        cd.numberOfLines = 0
        return cd
    }()
    
    let rarityBadge: UILabel = {
        let label = UILabel()
        let attributedText = NSMutableAttributedString(string: "Very Rare\n", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 9)])
        attributedText.append(NSAttributedString(string: "1 of 100", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 7)]))
        label.attributedText = attributedText
        label.textAlignment = .center
        label.backgroundColor = UIColor.rgb(red: 246, green: 215, blue: 67).withAlphaComponent(0.95)
        label.numberOfLines = 0
        return label
    }()
    
    let topDivider : UIView = {
        let td = UIView()
        td.backgroundColor = UIColor.lightGray
        return td
    }()
    
    let bottomDivider : UIView = {
        let bd = UIView()
        bd.backgroundColor = UIColor.lightGray
        return bd
    }()
    
    lazy var likeButton : UIButton = {
        let likeButton = UIButton(type: .system)
        likeButton.tintColor = .black
        likeButton.setTitle("🤍 10", for: .normal) //eventually link this count to backend
        likeButton.addTarget(self, action: #selector(likeButtonPressed), for: .touchUpInside)
        return likeButton
    }()
    
    lazy var commentButton : UIButton = {
        let cb = UIButton(type: .system)
        cb.tintColor = .black
        cb.addTarget(self, action: #selector(commentButtonPressed), for: .touchUpInside)
        cb.setAttributedTitle(NSAttributedString(string: "💬 2", attributes: [NSAttributedString.Key.foregroundColor:UIColor.gray,  NSAttributedString.Key.font:UIFont(name:"Futura-Medium", size: 15) ?? UIFont.systemFont(ofSize: 15)]), for: .normal) //eventually link this count to backend
        cb.isUserInteractionEnabled = true
        return cb
    }()
    
    
    //MARK: Button Functions
    @objc func likeButtonPressed() {
        print("Like Button Pressed") //eventually add like to backend
        let currentUser = User(userName: "myUsername", firstName: "DJ", lastName: "Raghav", type: User.UserType.FAN)
        let myReaction = Reaction(user: currentUser, type: Reaction.ReactionType.LIKE)
        let usersRef = Database.database().reference().child("feedItems").child("rossPurchasedACollectibleToday").child("reactions")
        let userRefAutoChild = usersRef.childByAutoId()
        
        userRefAutoChild.updateChildValues(myReaction.toDictionary() as! [AnyHashable : Any]) { (err, ref) in
            if let err = err {
                
                print("Failed to save reaction", err)
                return
            }

            print("Successfully saved reaction to DB")
            
        }
        
    }
    
    //DJ TO CLEAN UP
    
    @objc func commentButtonPressed() {
        print("Comment Button Pressed") //eventually present comment view controller
        
        let currentUser = User(userName: "myUsername", firstName: "DJ", lastName: "Raghav", type: User.UserType.FAN)
        var myComment = Comment(user: currentUser, createdAtSeconds: NSNumber(value: NSDate().timeIntervalSince1970), body: "Hello, world")
//        var myComment = Comment(user: currentUser, createdAtSeconds: NSNumber(value: NSDate().timeIntervalSince1970), body: "Hello, world", reactions: [])
        
        let usersRef = Database.database().reference().child("comments").child("collectible_0000001")
    
        
        usersRef.updateChildValues(myComment.toDictionary() as! [AnyHashable : Any]) { (err, ref) in
            if let err = err {
                print(type(of: myComment))
                print("Failed to save user to DB", err)
                return
            }

            print("Successfully saved user to DB")
            print(type(of: myComment))
        }
    }
    
    //MARK: Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let profileImageWidth : CGFloat = 40
        
        addSubview(friendProfileImage)
        friendProfileImage.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 15, paddingLeft: 15, paddingBottom: 0, paddingRight: 0, width: profileImageWidth, height: profileImageWidth)
        friendProfileImage.layer.cornerRadius = profileImageWidth / 2

        addSubview(friendActionDescriptor)
        friendActionDescriptor.anchor(top: topAnchor, left: friendProfileImage.rightAnchor, bottom: nil, right: rightAnchor, paddingTop: 15, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: 0, height: profileImageWidth)

        addSubview(collectibleImage)
        collectibleImage.anchor(top: friendProfileImage.bottomAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 15, paddingLeft: 15, paddingBottom: 0, paddingRight: 15, width: 80, height: 80)

        addSubview(collectibleTitle)
        collectibleTitle.anchor(top: collectibleImage.topAnchor, left: collectibleImage.rightAnchor, bottom: nil, right: rightAnchor, paddingTop: 8, paddingLeft: 15, paddingBottom: 0, paddingRight: 15, width: 0, height: 30)

        addSubview(collectibleArtist)
        collectibleArtist.anchor(top: collectibleTitle.bottomAnchor, left: collectibleImage.rightAnchor, bottom: nil, right: rightAnchor, paddingTop: 8, paddingLeft: 15, paddingBottom: 0, paddingRight: 15, width: 0, height: 30)
        
        addSubview(collectibleDescription)
        collectibleDescription.anchor(top: collectibleImage.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 8, paddingLeft: 15, paddingBottom: 0, paddingRight: 15, width: 0, height: 50)
        
        addSubview(rarityBadge)
        rarityBadge.anchor(top: collectibleImage.topAnchor, left: nil, bottom: nil, right: rightAnchor, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 15, width: 40, height: 40)
        rarityBadge.clipsToBounds = true
        rarityBadge.layer.cornerRadius = 10

        setupActionButtons()
        
    }
    
    func setupActionButtons() {
        let stackView = UIStackView(arrangedSubviews: [likeButton, commentButton])
        
        stackView.distribution = .fillEqually
        
        addSubview(stackView)
        stackView.anchor(top: nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 15, paddingBottom: 0, paddingRight: 15, width: 0, height: 35)
        
        addSubview(topDivider)
        topDivider.anchor(top: nil, left: leftAnchor, bottom: stackView.topAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0.5)
        
        addSubview(bottomDivider)
        bottomDivider.anchor(top: stackView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0.5)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

