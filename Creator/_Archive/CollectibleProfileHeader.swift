//
//  ArtistProfileHeader.swift
//  Creator
//
//  Created by DJ Satoda on 4/26/20.
//  Copyright © 2020 DJ Satoda. All rights reserved.
//

import Foundation
import UIKit

class CollectibleProfileHeader : UICollectionReusableView {
    
    lazy var exitButton : UIButton = {
        let eb = UIButton(type: .system)
        eb.setTitle("X", for: .normal)
        eb.addTarget(self, action: #selector(exitButtonPressed), for: .touchUpInside)        
        return eb
    }()
    
    var artistName : UILabel = {
        let an = UILabel()
        an.textColor = UIColor.black
        an.text = "More Fatter"
        an.font = UIFont.boldSystemFont(ofSize: 40)
        return an
    }()
    
    @objc func exitButtonPressed() {
        print("Exit button pressed")
    }
    
    let headerBackgroundView : UIView = {
        let bv = UIView()
        bv.backgroundColor = .white
        return bv
    }()
    
    let collectiblePicture : UIImageView = {
        let artistProfilePic = UIImageView()
        artistProfilePic.image = #imageLiteral(resourceName: "asapCollectible1")
        artistProfilePic.contentMode = .scaleAspectFill
        artistProfilePic.clipsToBounds = true
        return artistProfilePic
    }()
    
    let collectibleName : UILabel = {
        let an = UILabel()
        
        let collectibleDetailsString = NSMutableAttributedString(string: "Poinsettia", attributes: [NSAttributedString.Key.font: UIFont(name: "Futura", size: 18) ?? UIFont.systemFont(ofSize: 18), NSAttributedString.Key.foregroundColor: UIColor.rgb(red: 0, green: 0, blue: 0)])
                
        collectibleDetailsString.append(NSAttributedString(string: " | ", attributes: [NSAttributedString.Key.font: UIFont(name: "Futura", size: 18) ?? UIFont.systemFont(ofSize: 18), NSAttributedString.Key.foregroundColor: UIColor.rgb(red: 0, green: 0, blue: 0)]))

        collectibleDetailsString.append(NSAttributedString(string: "Unreleased Track", attributes: [NSAttributedString.Key.font: UIFont(name: "Futura", size: 18) ?? UIFont.systemFont(ofSize: 18), NSAttributedString.Key.foregroundColor: UIColor.rgb(red: 70, green: 69, blue: 70)]))
        
        an.attributedText = collectibleDetailsString
//        an.font = UIFont(name: "Futura-Bold", size: 20)
//        an.textAlignment = .left
        return an
    }()
    
    var aboutHeaderLabel : UILabel = {
        let ahl = UILabel()
        ahl.textColor = UIColor.black
        ahl.text = "About"
        ahl.font = UIFont.boldSystemFont(ofSize: 20)
        return ahl
    }()
    
    var aboutText : UILabel = {
        let ahl = UILabel()
        ahl.textColor = UIColor.black
        ahl.text = "Writing for the court, Chief Justice John Roberts recalled the trial of Aaron Burr for treason, when Chief Justice John Marshall ordered President Jefferson to turn over evidence the former vice president sought in his defense. Two hundred years ago, a great jurist of our Court established that no citizen, not even the President, is categorically above the common duty to produce evidence when called upon in a criminal proceeding,” Chief Justice Roberts wrote. “We reaffirm that principle today and hold that the President is neither absolutely immune from state criminal subpoenas seeking his private papers nor entitled to a heightened standard of need.”"
        ahl.numberOfLines = 0
        ahl.font = UIFont.boldSystemFont(ofSize: 12)
        return ahl
    }()
    
    
    let collectibleStats : UILabel = {
        let artistStats = UILabel()
        artistStats.text = "10,000 copies issued\n9.9k sold | $499k raised\n18 remaining | Issue Price: $49.99\n5th hottest issue on Creator today!"
        artistStats.font = UIFont(name: "Futura", size: 14)
        artistStats.textAlignment = .left
        artistStats.numberOfLines = 0
        return artistStats
    }()
    

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        addSubview(headerBackgroundView)
        headerBackgroundView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        sendSubviewToBack(headerBackgroundView)
        
        addSubview(exitButton)
        exitButton.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 30, height: 30)
        
        addSubview(artistName)
        artistName.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 30, paddingLeft: 25, paddingBottom: 0, paddingRight: 0, width: 0, height: 30)
        
        addSubview(collectibleName)
        collectibleName.anchor(top: artistName.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 15, paddingLeft: 25, paddingBottom: 0, paddingRight: 0, width: 0, height: 20)
        
        addSubview(collectiblePicture)
        collectiblePicture.layer.cornerRadius = 20
        collectiblePicture.anchor(top: collectibleName.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 25, paddingLeft: 25, paddingBottom: 0, paddingRight: 25, width: 0, height: 180)

        addSubview(aboutHeaderLabel)
        aboutHeaderLabel.anchor(top: collectiblePicture.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 20, paddingLeft: 25, paddingBottom: 0, paddingRight: 25, width: 0, height: 15)
        
        addSubview(aboutText)
        aboutText.anchor(top: aboutHeaderLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 20, paddingLeft: 25, paddingBottom: 0, paddingRight: 25, width: 0, height: 200)
        
        addSubview(collectibleStats)
        collectibleStats.anchor(top: collectibleName.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 25, paddingBottom: 0, paddingRight: 0, width: 0, height: 80)
        

        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
