//
//  CongratulationsViewController.swift
//  Creator
//
//  Created by DJ Satoda on 4/29/20.
//  Copyright © 2020 DJ Satoda. All rights reserved.
//

import Foundation
import UIKit

class CongratulationsViewController : UIViewController {
    
    
    
    let congratulationsView : UIImageView = {
        let congratsView = UIImageView()
        congratsView.backgroundColor = .blue
        congratsView.frame = CGRect(x: 0.0, y:30.0, width: 414, height: 800)
        congratsView.loadGif(name: "giphy")
        
        return congratsView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.addSubview(congratulationsView)
        
    }
    
}
