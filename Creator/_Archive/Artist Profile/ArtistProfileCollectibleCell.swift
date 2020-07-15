//
//  ArtistProfileCollectibleCells.swift
//  Creator
//
//  Created by DJ Satoda on 4/26/20.
//  Copyright © 2020 DJ Satoda. All rights reserved.
//

import Foundation
import UIKit

class ArtistProfileCollectibleCell : UITableViewCell {
    
    //MARK: Subviews
        
    let collectibleImage : UIImageView = {
        let ci = UIImageView()
        ci.contentMode = .scaleAspectFill
        ci.clipsToBounds = true
        return ci
    }()
    
    let collectibleNameAndType : UILabel = {
        let cn = UILabel()
        cn.font = UIFont(name: "Futura", size: 14)
        return cn
    }()
    
    let collectibleType : UILabel = {
        let ct = UILabel()
        ct.font = UIFont(name: "Futura", size: 14)
        ct.textColor = UIColor.rgb(red: 70, green: 69, blue: 70)
        return ct
    }()
    
    let collectiblePriceChart : UIImageView = {
        let cpc = UIImageView()
        cpc.contentMode = .scaleToFill
        cpc.clipsToBounds = true
        return cpc
    }()
    
    let collectibleRarityBadge : UILabel = {
        let crb = UILabel()
        crb.font = UIFont(name: "Futura-Bold", size: 7)
        crb.textColor = UIColor.rgb(red: 0, green: 0, blue: 0)
        crb.backgroundColor = UIColor.rgb(red: 246, green: 215, blue: 67)
        crb.text = "ULTRA RARE"
        crb.numberOfLines = 0
        crb.textAlignment = .center
        return crb
    }()
    
    let collectiblePrice : UILabel = {
        let collectiblePrice = UILabel()
        collectiblePrice.font = UIFont(name: "Futura", size: 10)
        collectiblePrice.textColor = .black
        collectiblePrice.numberOfLines = 0
        collectiblePrice.backgroundColor = UIColor.rgb(red: 246, green: 215, blue: 67)
        collectiblePrice.textAlignment = .center
        return collectiblePrice
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let collectibleImageWidth : CGFloat = 60
        
        addSubview(collectibleImage)
        collectibleImage.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 15, paddingLeft: 15, paddingBottom: 0, paddingRight: 0, width: collectibleImageWidth, height: collectibleImageWidth)
        collectibleImage.layer.cornerRadius = collectibleImageWidth / 2
        
        addSubview(collectibleRarityBadge)
        let crbWidth : CGFloat = 30
        collectibleRarityBadge.layer.cornerRadius = crbWidth / 2
        collectibleRarityBadge.layer.masksToBounds = true
        collectibleRarityBadge.anchor(top: collectibleImage.topAnchor, left: nil, bottom: nil, right: collectibleImage.rightAnchor, paddingTop: -5, paddingLeft: 0, paddingBottom: 0, paddingRight: -5, width: crbWidth, height: crbWidth)
        
        addSubview(collectiblePrice)
        collectiblePrice.layer.masksToBounds = true
        collectiblePrice.layer.cornerRadius = 10
        collectiblePrice.anchor(top: topAnchor, left: nil, bottom: nil, right: rightAnchor, paddingTop: 15, paddingLeft: 0, paddingBottom: 0, paddingRight: 15, width: 50, height: collectibleImageWidth)
    
        addSubview(collectibleNameAndType)
        collectibleNameAndType.anchor(top: topAnchor, left: collectibleImage.rightAnchor, bottom: nil, right: collectiblePrice.leftAnchor, paddingTop: 10, paddingLeft: 15, paddingBottom: 0, paddingRight: 15, width: 0 , height: 20)
        
        
        addSubview(collectiblePriceChart)
        collectiblePriceChart.anchor(top: collectibleNameAndType.bottomAnchor, left: collectibleImage.rightAnchor, bottom: nil, right: collectiblePrice.leftAnchor, paddingTop: 15, paddingLeft: 15, paddingBottom: 0, paddingRight: 15, width: 0, height: 20)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
