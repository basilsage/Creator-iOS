//
//  HomeFeedCell.swift
//  Creator
//
//  Created by DJ Satoda on 4/25/20.
//  Copyright © 2020 DJ Satoda. All rights reserved.
//

import Foundation
import UIKit

class HomeFeedCell : UITableViewCell {
    
    //MARK: Subviews
    
    let friendProfileImage : UIImageView = {
        let fpi = UIImageView()
        fpi.contentMode = .scaleAspectFill
        fpi.clipsToBounds = true
        return fpi
    }()
    
    let friendActionDescriptor : UILabel = {
        let fnl = UILabel()
        fnl.font = UIFont(name: "Futura", size: 14)
        return fnl
    }()
    
    
    let likeButton : UIButton = {
        let lb = UIButton(type: .system)
        lb.setImage(#imageLiteral(resourceName: "like_unselected").withRenderingMode(.alwaysOriginal), for: .normal)
        lb.tintColor = .black
        lb.addTarget(self, action: #selector(likeButtonPressed), for: .touchUpInside)
        return lb
    }()
    
    @objc func likeButtonPressed() {
        print("Like")
    }
    
    let collectibleImage : UIImageView = {
        let ci = UIImageView()
        ci.clipsToBounds = true
        ci.contentMode = .scaleAspectFill
        
        return ci
    }()
    
    let rarityBadge : UILabel = {
        let rb = UILabel()
        rb.backgroundColor = UIColor.rgb(red: 246, green: 215, blue: 67).withAlphaComponent(0.95)
        rb.font = UIFont(name: "Futura", size: 11)
        rb.textAlignment = .center
        return rb
    }()
    
    let collectibleTitle : UILabel = {
        let cd = UILabel()
        
        cd.font = UIFont(name: "Futura", size: 14)
        cd.textColor = .black
                
        return cd
    }()
    
    let collectibleDescription : UILabel = {
        let cd = UILabel()
        
        cd.font = UIFont(name: "Futura-Medium", size: 12)
        cd.textColor = UIColor.rgb(red: 70, green: 69, blue: 70)
        cd.numberOfLines = 0
        
        return cd
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let profileImageWidth : CGFloat = 40
        
        //Friend Profile Image
        addSubview(friendProfileImage)
        friendProfileImage.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 15, paddingLeft: 15, paddingBottom: 0, paddingRight: 0, width: profileImageWidth, height: profileImageWidth)
        friendProfileImage.layer.cornerRadius = profileImageWidth / 2
        
        // Like Button
        addSubview(likeButton)
        likeButton.anchor(top: topAnchor, left: nil, bottom: nil, right: rightAnchor, paddingTop: 15, paddingLeft: 0, paddingBottom: 0, paddingRight: 15, width: profileImageWidth , height: profileImageWidth)
        
        //Friend Name Label
        addSubview(friendActionDescriptor)
        friendActionDescriptor.anchor(top: topAnchor, left: friendProfileImage.rightAnchor, bottom: nil, right: likeButton.leftAnchor, paddingTop: 15, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: 100, height: profileImageWidth)
        
        // Collectible Image
        addSubview(collectibleImage)
        collectibleImage.anchor(top: friendProfileImage.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 15, paddingLeft: 15, paddingBottom: 0, paddingRight: 15, width: 0, height: 200)
        
        addSubview(rarityBadge)
        rarityBadge.anchor(top: collectibleImage.topAnchor, left: nil, bottom: nil, right: collectibleImage.rightAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 200, height: 25)
        
        
        //Collectible Title
        addSubview(collectibleTitle)
        collectibleTitle.anchor(top: collectibleImage.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 8, paddingLeft: 15, paddingBottom: 0, paddingRight: 15, width: 0, height: 30)
    
        //Collectible Description
        addSubview(collectibleDescription)
        collectibleDescription.anchor(top: collectibleTitle.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 8, paddingLeft: 15, paddingBottom: 0, paddingRight: 15, width: 0, height: 0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

