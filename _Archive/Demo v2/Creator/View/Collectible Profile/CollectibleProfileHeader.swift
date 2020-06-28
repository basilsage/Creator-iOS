//
//  ArtistProfileHeader.swift
//  Creator
//
//  Created by DJ Satoda on 4/26/20.
//  Copyright © 2020 DJ Satoda. All rights reserved.
//

import Foundation
import UIKit

class CollectibleProfileHeader : UITableViewHeaderFooterView {
    
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
        
        let collectibleDetailsString = NSMutableAttributedString(string: "Poinsettia", attributes: [NSAttributedString.Key.font: UIFont(name: "Futura", size: 18), NSAttributedString.Key.foregroundColor: UIColor.rgb(red: 0, green: 0, blue: 0)])
                
        collectibleDetailsString.append(NSAttributedString(string: " | ", attributes: [NSAttributedString.Key.font: UIFont(name: "Futura", size: 18), NSAttributedString.Key.foregroundColor: UIColor.rgb(red: 0, green: 0, blue: 0)]))

        collectibleDetailsString.append(NSAttributedString(string: "Unreleased Track", attributes: [NSAttributedString.Key.font: UIFont(name: "Futura", size: 18), NSAttributedString.Key.foregroundColor: UIColor.rgb(red: 70, green: 69, blue: 70)]))
        
        an.attributedText = collectibleDetailsString
//        an.font = UIFont(name: "Futura-Bold", size: 20)
//        an.textAlignment = .left
        return an
    }()
    
    let collectibleStats : UILabel = {
        let artistStats = UILabel()
        artistStats.text = "10,000 copies issued\n9.9k sold | $499k raised\n18 remaining | Issue Price: $49.99\n5th hottest issue on Creator today!"
        artistStats.font = UIFont(name: "Futura", size: 14)
        artistStats.textAlignment = .left
        artistStats.numberOfLines = 0
        return artistStats
    }()
    
    let buyButton : UIButton = {
        let bb = UIButton(type: .system)
        bb.setTitle("Buy", for: .normal)
        bb.backgroundColor = UIColor.rgb(red: 246, green: 215, blue: 67)
        bb.setTitleColor(.white, for: .normal)
        bb.titleLabel?.font = UIFont(name: "Futura-Bold", size: 14)
        
        return bb
    }()
    
    @objc func buyButtonPressed() {
        
        let alert = UIAlertController(title: "Confirm Purchase?", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: .none))
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in
            
            let alert = UIAlertController(title: "Congratulations!\n🎉🎊🎉🎊🎉🎊🎉🎊🎉🎊", message: "Purchase Successful! Check it out in your collection.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Thanks!", style: .default, handler: { (_) in
                
//                let userProfileController = UserProfileController()
//                self.window?.rootViewController?.present(userProfileController, animated: true, completion: nil)

            }))
            
            self.window?.rootViewController?.present(alert, animated: true, completion: nil)
            

        }))
        self.window?.rootViewController?.present(alert, animated: true, completion: nil)
    }
    
    let sellButton : UIButton = {
        let sb = UIButton(type: .system)
        sb.setTitle("Sell", for: .normal)
        sb.backgroundColor = UIColor.rgb(red: 255, green: 230, blue: 176)
        sb.setTitleColor(.white, for: .normal)
        sb.titleLabel?.font = UIFont(name: "Futura-Bold", size: 14)
        
        return sb
    }()
    
    let socialProofLabel : UILabel = {
        let spl = UILabel()
        
        spl.text = "7 friends wishlisted.\nBe the first of your friends to collect!"
        spl.font = UIFont(name: "Futura", size: 14)
        spl.numberOfLines = 0
        spl.textAlignment = .center
        
        return spl
    }()
    
    let collectibleAvailabilityBadge : UILabel = {
        let cab = UILabel()
        cab.font = UIFont(name: "Futura-Bold", size: 10)
        cab.textColor = UIColor.rgb(red: 255, green: 255, blue: 255)
        cab.backgroundColor = UIColor.rgb(red: 178, green: 35, blue: 34)
        cab.text = "18\nLEFT"
        cab.numberOfLines = 0
        cab.textAlignment = .center
        return cab
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        
        
        addSubview(headerBackgroundView)
        headerBackgroundView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        sendSubviewToBack(headerBackgroundView)
        
        addSubview(collectiblePicture)
        collectiblePicture.layer.cornerRadius = 20
        collectiblePicture.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 25, paddingLeft: 25, paddingBottom: 0, paddingRight: 25, width: 0, height: 180)
        
        addSubview(collectibleAvailabilityBadge)
        collectibleAvailabilityBadge.layer.cornerRadius = 50 / 2
        collectibleAvailabilityBadge.layer.masksToBounds = true
        collectibleAvailabilityBadge.anchor(top: collectiblePicture.topAnchor, left: nil, bottom: nil, right: collectiblePicture.rightAnchor, paddingTop: -10, paddingLeft: 0, paddingBottom: 0, paddingRight: -10, width: 50, height: 50)
        
        addSubview(collectibleName)
        collectibleName.anchor(top: collectiblePicture.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 15, paddingLeft: 25, paddingBottom: 0, paddingRight: 0, width: 0, height: 20)
        
        addSubview(collectibleStats)
        collectibleStats.anchor(top: collectibleName.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 25, paddingBottom: 0, paddingRight: 0, width: 0, height: 80)
        
        addSubview(buyButton)
        buyButton.layer.cornerRadius = 15
        buyButton.anchor(top: collectibleStats.bottomAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 25, paddingBottom: 0, paddingRight: 0, width: 165, height: 38)
        buyButton.addTarget(self, action: #selector(buyButtonPressed), for: .touchUpInside)
        
        addSubview(sellButton)
        sellButton.layer.cornerRadius = 15
        sellButton.anchor(top: collectibleStats.bottomAnchor, left: nil, bottom: nil, right: rightAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 25, width: 165, height: 38)
        
        addSubview(socialProofLabel)
        socialProofLabel.anchor(top: buyButton.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 15, paddingLeft: 25, paddingBottom: 0, paddingRight: 25, width: 0, height: 40)
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
