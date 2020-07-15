//
//  DiscoverControllerCell.swift
//  Creator
//
//  Created by DJ Satoda on 7/7/20.
//  Copyright © 2020 DJ Satoda. All rights reserved.
//

import Foundation
import UIKit

protocol DiscoverCellDelegate {
    func didTapSeeMoreDetail()
}

class DiscoverControllerCell : UICollectionViewCell {
    
    var delegate : DiscoverCellDelegate?
    
    var collectibleImage : UIImageView = {
        let ci = UIImageView()
        ci.contentMode = .scaleAspectFill
        ci.clipsToBounds = true
        return ci
    }()
    
    var artistName : UILabel = {
        let an = UILabel()
        an.textColor = UIColor.white
        an.text = "MORE FATTER"
        an.font = UIFont.boldSystemFont(ofSize: 40)
        return an
    }()
    
    var collectibleName : UILabel = {
        let cn = UILabel()
        cn.textColor = UIColor.white
        cn.text = "A Special Jam Session"
        cn.font = UIFont.systemFont(ofSize: 20)
        return cn
    }()
    
    var statusButton : UILabel = {
        let sb = UILabel()
        sb.backgroundColor = UIColor.rgb(red: 38, green: 204, blue: 156)
        sb.textColor = UIColor.white
        sb.textAlignment = .center
        sb.text = "LIVE"
        sb.font = UIFont.systemFont(ofSize: 15)
        return sb
    }()
    
    lazy var seeMoreDetailsButton : UIButton = {
        let smdb = UIButton()
        smdb.setTitle("^\nSee More Details", for: .normal)
        smdb.addTarget(self, action: #selector(seeMoreDetailsButtonPressed), for: .allTouchEvents)
        smdb.titleLabel?.numberOfLines = 2
        smdb.titleLabel?.textAlignment = .center
        smdb.tintColor = .white        
        return smdb
    }()
    
    @objc func seeMoreDetailsButtonPressed() {
        print("See more detial button pressed, passing to delegate")
        delegate?.didTapSeeMoreDetail()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(collectibleImage)
        collectibleImage.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        addSubview(artistName)
        artistName.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: frame.height / 2 + 80, paddingLeft: 15, paddingBottom: 0, paddingRight: 15, width: 0, height: 30)
        
        addSubview(collectibleName)
        collectibleName.anchor(top: artistName.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 15, paddingLeft: 15, paddingBottom: 0, paddingRight: 15, width: 0, height: 25)
        
        addSubview(statusButton)
        statusButton.anchor(top: collectibleName.bottomAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 15, paddingLeft: 15, paddingBottom: 0, paddingRight: 15, width: 60, height: 40)
        
        statusButton.layer.cornerRadius = 5
        statusButton.layer.masksToBounds = true
        
        addSubview(seeMoreDetailsButton)
        seeMoreDetailsButton.anchor(top: statusButton.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 15, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
        
    }
    
}


