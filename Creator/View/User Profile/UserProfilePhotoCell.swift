//
//  UserProfilePhotoCell.swift
//  Creator
//
//  Created by DJ Satoda on 4/26/20.
//  Copyright © 2020 DJ Satoda. All rights reserved.
//

import Foundation
import UIKit

class UserProfilePhotoCell: UICollectionViewCell {
    
    let photoImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    let collectibleName : UILabel = {
        let cn = UILabel()
        cn.font = UIFont(name: "Futura-Bold", size: 12)
        cn.text = "Poinsettia"
        return cn
    }()
    
    let collectibleRarityAndCounts : UILabel = {
        let crac = UILabel()
        crac.text = "rarity | counts"
        
        let collectibleDetailsString = NSMutableAttributedString(string: "Rare", attributes: [NSAttributedString.Key.font: UIFont(name: "Futura", size: 12), NSAttributedString.Key.foregroundColor: UIColor.rgb(red: 0, green: 0, blue: 0)])
                
        collectibleDetailsString.append(NSAttributedString(string: " | ", attributes: [NSAttributedString.Key.font: UIFont(name: "Futura", size: 12), NSAttributedString.Key.foregroundColor: UIColor.rgb(red: 0, green: 0, blue: 0)]))
        
        collectibleDetailsString.append(NSAttributedString(string: "One of 10,000", attributes: [NSAttributedString.Key.font: UIFont(name: "Futura", size: 12), NSAttributedString.Key.foregroundColor: UIColor.rgb(red: 70, green: 69, blue: 70)]))
        
        crac.attributedText = collectibleDetailsString
        return crac
    }()
    
    let creatorName : UILabel = {
        let cn = UILabel()
        cn.font = UIFont(name: "Futura", size: 12)
        cn.text = "A$AP Rocky"
        return cn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(photoImageView)
        photoImageView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 5, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: 0, height: frame.width)
        
        addSubview(collectibleName)
        collectibleName.anchor(top: photoImageView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 2, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: 0, height: 30)
        
        addSubview(collectibleRarityAndCounts)
        collectibleRarityAndCounts.anchor(top: collectibleName.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 2, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: 0, height: 30)
        
        addSubview(creatorName)
        creatorName.anchor(top: collectibleRarityAndCounts.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 2, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: 0, height: 30)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
