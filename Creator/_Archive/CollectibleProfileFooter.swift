//
//  CollectibleProfileFooter.swift
//  Creator
//
//  Created by DJ Satoda on 7/10/20.
//  Copyright © 2020 DJ Satoda. All rights reserved.
//

import Foundation
import UIKit

class CollectibleProfileFooter : UICollectionReusableView {
    
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
    
    override init(frame: CGRect) {
           super.init(frame: frame)
        
        addSubview(buyButton)
        buyButton.layer.cornerRadius = 15
        buyButton.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 15, paddingLeft: 15, paddingBottom: 15, paddingRight: 0, width: 50, height: 0)
        buyButton.addTarget(self, action: #selector(buyButtonPressed), for: .touchUpInside)
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
