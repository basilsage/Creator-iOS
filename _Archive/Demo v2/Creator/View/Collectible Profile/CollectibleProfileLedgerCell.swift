//
//  ArtistProfileCollectibleCells.swift
//  Creator
//
//  Created by DJ Satoda on 4/26/20.
//  Copyright © 2020 DJ Satoda. All rights reserved.
//

import Foundation
import UIKit

class CollectibleProfileLedgerCell : UITableViewCell {
    
    //MARK: Subviews
        
    let collectibleImage : UIImageView = {
        let ci = UIImageView()
        ci.contentMode = .scaleAspectFill
        ci.clipsToBounds = true
        return ci
    }()
    
    let collectibleName : UILabel = {
        let cn = UILabel()
        cn.font = UIFont(name: "Futura", size: 14)
        return cn
    }()
    
    let availabilityStatus : UILabel = {
        let availabilityStatus = UILabel()
        availabilityStatus.font = UIFont(name: "Futura", size: 10)
        availabilityStatus.numberOfLines = 0
        availabilityStatus.textAlignment = .center
        availabilityStatus.textColor = .darkGray
        return availabilityStatus
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let collectibleImageWidth : CGFloat = 40
        
        addSubview(collectibleImage)
        collectibleImage.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 15, paddingLeft: 15, paddingBottom: 0, paddingRight: 0, width: collectibleImageWidth, height: collectibleImageWidth)
        collectibleImage.layer.cornerRadius = collectibleImageWidth / 2
        
        addSubview(availabilityStatus)
        availabilityStatus.anchor(top: topAnchor, left: nil, bottom: nil, right: rightAnchor, paddingTop: 15, paddingLeft: 0, paddingBottom: 0, paddingRight: 15, width: 50, height: collectibleImageWidth)
    
        addSubview(collectibleName)
        collectibleName.anchor(top: topAnchor, left: collectibleImage.rightAnchor, bottom: nil, right: availabilityStatus.leftAnchor, paddingTop: 15, paddingLeft: 15, paddingBottom: 0, paddingRight: 15, width: 0 , height: collectibleImageWidth)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
