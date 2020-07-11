//
//  ArtistProfileCollectibleCells.swift
//  Creator
//
//  Created by DJ Satoda on 4/26/20.
//  Copyright © 2020 DJ Satoda. All rights reserved.
//

import Foundation
import UIKit

class CollectibleProfileLedgerCell : UICollectionViewCell {
    
    //MARK: Subviews
        
    let collectorProfileImages : UIImageView = {
        let ci = UIImageView()
        ci.contentMode = .scaleAspectFill
        ci.clipsToBounds = true
        return ci
    }()
    
    let collectorUsername : UILabel = {
        let cu = UILabel()
        cu.font = UIFont(name: "Futura", size: 10)
        cu.numberOfLines = 0
        cu.textAlignment = .center
        cu.textColor = .darkGray
        return cu
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let collectibleImageWidth : CGFloat = 40
        
        addSubview(collectorProfileImages)
        collectorProfileImages.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 15, paddingLeft: 15, paddingBottom: 0, paddingRight: 0, width: collectibleImageWidth, height: collectibleImageWidth)
        collectorProfileImages.layer.cornerRadius = collectibleImageWidth / 2
        
        addSubview(collectorUsername)
        collectorUsername.anchor(top: nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: collectibleImageWidth, height: collectibleImageWidth)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
