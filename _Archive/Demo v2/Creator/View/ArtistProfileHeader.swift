//
//  ArtistProfileHeader.swift
//  Creator
//
//  Created by DJ Satoda on 4/26/20.
//  Copyright © 2020 DJ Satoda. All rights reserved.
//

import Foundation
import UIKit

class ArtistProfileHeader : UITableViewHeaderFooterView {
    
    let headerBackgroundView : UIView = {
        let bv = UIView()
        bv.backgroundColor = .white
        return bv
    }()
    
    let artistProfilePic : UIImageView = {
        let artistProfilePic = UIImageView()
        artistProfilePic.image = #imageLiteral(resourceName: "rockyProfile")
        artistProfilePic.contentMode = .scaleAspectFill
        artistProfilePic.clipsToBounds = true
        return artistProfilePic
    }()
    
    let artistName : UILabel = {
        let an = UILabel()
        an.text = "A$AP Rocky"
        an.font = UIFont(name: "Futura-Bold", size: 20)
        an.textAlignment = .center
        return an
    }()
    
    let artistStats : UILabel = {
        let artistStats = UILabel()
        artistStats.text = "7.8M followers | $2.2M raised"
        artistStats.font = UIFont(name: "Futura", size: 14)
        artistStats.textAlignment = .center
        return artistStats
    }()
    
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        let profilePicWidth : CGFloat = 50

        
        addSubview(headerBackgroundView)
        headerBackgroundView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        sendSubviewToBack(headerBackgroundView)
        
        
//        let padding = (self.frame.width / 2)
//        print(padding)
        addSubview(artistProfilePic)
        artistProfilePic.layer.cornerRadius = profilePicWidth / 2
//        artistProfilePic.center = self.headerBackgroundView.center
        artistProfilePic.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 15, paddingLeft: 150, paddingBottom: 0, paddingRight: 150, width: profilePicWidth, height: profilePicWidth * 2)
        
        addSubview(artistName)
        artistName.anchor(top: artistProfilePic.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 15, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 40)
        
        addSubview(artistStats)
        artistStats.anchor(top: artistName.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 40)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
