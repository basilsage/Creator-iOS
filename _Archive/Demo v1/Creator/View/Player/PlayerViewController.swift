//
//  PlayerViewController.swift
//  Creator
//
//  Created by DJ Satoda on 4/29/20.
//  Copyright © 2020 DJ Satoda. All rights reserved.
//

import Foundation
import UIKit

class PlayerViewController : UIViewController {

    let backgroundView : UIView = {
        let bv = UIView()
        bv.backgroundColor = .white
        
        return bv
    }()
    
    let playerGif : UIImageView = {
        let playerGif = UIImageView()
        playerGif.contentMode = .scaleAspectFill
        playerGif.loadGif(name: "visualizer")
        
        return playerGif
    }()
    
    let friendGif : UIImageView = {
        let friendGif = UIImageView()
        friendGif.contentMode = .scaleAspectFill
        friendGif.clipsToBounds = true
        friendGif.loadGif(name: "wildOut")
        
        return friendGif
    }()
    
    let shareButton: UIButton = {
        let shareButton = UIButton(type: .system)
        shareButton.setTitle("Share", for: .normal)
        
        shareButton.layer.cornerRadius = 5
        shareButton.titleLabel?.font = UIFont(name: "Futura", size: 20)
        shareButton.setTitleColor(.black, for: .normal)
        
        shareButton.addTarget(self, action: #selector(handleShareButtonPressed), for: .touchUpInside)
        
        return shareButton
    }()
    
    @objc func handleShareButtonPressed() {
        view.addSubview(friendGif)
        friendGif.anchor(top: view.topAnchor, left: nil, bottom: nil, right: view.rightAnchor, paddingTop: 100, paddingLeft: 0, paddingBottom: 0, paddingRight: 15, width: 100, height: 150)
        friendGif.layer.cornerRadius = 10
    }
    
    let playButton : UIImageView = {
        let playButton = UIImageView()
        playButton.image = UIImage(named: "playButton")
        playButton.contentMode = .scaleAspectFit
        return playButton
    }()
    
    let fastForwardButton : UIImageView = {
        let fastForwardButton = UIImageView()
        fastForwardButton.image = UIImage(named: "fastForwardButton")
        fastForwardButton.contentMode = .scaleAspectFit
        return fastForwardButton
    }()
    
    let rewindButton : UIImageView = {
        let rewindButton = UIImageView()
        rewindButton.image = UIImage(named: "rewindButton")
        rewindButton.contentMode = .scaleAspectFit
        return rewindButton
    }()
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(backgroundView)
        backgroundView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        view.addSubview(shareButton)
        shareButton.anchor(top: view.topAnchor, left: nil, bottom: nil, right: view.rightAnchor, paddingTop: 30, paddingLeft: 0, paddingBottom: 0, paddingRight: 15, width: 60, height: 30)
        
        view.addSubview(playerGif)
        playerGif.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 350, paddingLeft: 15, paddingBottom: 0, paddingRight: 15, width: 0, height: 50)
        
        let stackView = UIStackView(arrangedSubviews: [rewindButton, playButton, fastForwardButton])
        stackView.distribution = .fillEqually
        stackView.spacing = 60
        stackView.axis = .horizontal
        view.addSubview(stackView)
        stackView.anchor(top: playerGif.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 280, paddingLeft: 100, paddingBottom: 0, paddingRight: 100, width: 0, height: 40)
        
    }
    
        
}

    
