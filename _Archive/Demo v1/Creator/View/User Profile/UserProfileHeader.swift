//
//  UserProfileHeader.swift
//  Creator
//
//  Created by DJ Satoda on 4/26/20.
//  Copyright © 2020 DJ Satoda. All rights reserved.
//

import UIKit
import Firebase

class UserProfileHeader: UICollectionViewCell {
    
    fileprivate func setupFollowStyle() {
        self.editProfileFollowButton.setTitle("Follow", for: .normal)
        self.editProfileFollowButton.backgroundColor = UIColor.rgb(red: 17, green: 154, blue: 237)
        self.editProfileFollowButton.setTitleColor(.white, for: .normal)
        self.editProfileFollowButton.layer.borderColor = UIColor(white: 0, alpha: 0.2).cgColor
    }
    
    let profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "raghav")
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    let usernameLabel: UILabel = {
        let label = UILabel()
        label.text = "Raghav's Collection"
        label.textAlignment = .center
        label.font = UIFont(name: "Futura-Bold", size: 18)
        return label
    }()
    
    let postsLabel: UILabel = {
        let label = UILabel()
        
        let attributedText = NSMutableAttributedString(string: "22\n", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14)])
        
        attributedText.append(NSAttributedString(string: "collectibles", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)]))
        
        label.attributedText = attributedText
        
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    let followersLabel: UILabel = {
        let label = UILabel()
        
        let attributedText = NSMutableAttributedString(string: "$7.6k\n", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14)])
        
        attributedText.append(NSAttributedString(string: "collection value", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)]))
        
        label.attributedText = attributedText
        
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    let followingLabel: UILabel = {
        let label = UILabel()
        
        let attributedText = NSMutableAttributedString(string: "426\n", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14)])
        
        attributedText.append(NSAttributedString(string: "friends", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)]))
        
        label.attributedText = attributedText
        
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    lazy var editProfileFollowButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Edit Profile", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 3
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(profileImageView)
        
        let profilePicWidth : CGFloat = 50
        profileImageView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 15, paddingLeft: 150, paddingBottom: 0, paddingRight: 150, width: profilePicWidth, height: profilePicWidth * 2)
        profileImageView.layer.cornerRadius = 80 / 2
        profileImageView.clipsToBounds = true

        
        addSubview(usernameLabel)
        usernameLabel.anchor(top: profileImageView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 15, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 40)
        
        setupUserStatsView()
        
        addSubview(editProfileFollowButton)
        editProfileFollowButton.anchor(top: postsLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 12, paddingLeft: 15, paddingBottom: 0, paddingRight: 15, width: 0, height: 34)
    }
    
    fileprivate func setupUserStatsView() {
        let stackView = UIStackView(arrangedSubviews: [postsLabel, followersLabel, followingLabel])
        
        stackView.distribution = .fillEqually
        
        addSubview(stackView)
        stackView.anchor(top: usernameLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 12, paddingLeft: 12, paddingBottom: 0, paddingRight: 12, width: 0, height: 50)
    }

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
