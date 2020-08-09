//
//  PlayerViewController.swift
//  Creator
//
//  Created by DJ Satoda on 4/29/20.
//  Copyright © 2020 DJ Satoda. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class PlayerViewController : UIViewController {

    var player : AVAudioPlayer?
    var collectiblePurchasedBool : Int = 0
    
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
    
    
    
    let purchasedBoolButton: UIButton = {
        let shareButton = UIButton(type: .system)
        shareButton.setTitle("Purchase", for: .normal)
        shareButton.addTarget(self, action: #selector(purchasedBoolButtonPressed), for: .touchUpInside)
        
        return shareButton
    }()
    
    @objc func purchasedBoolButtonPressed() {
        if collectiblePurchasedBool == 0 {
            collectiblePurchasedBool = 1
        } else {
            collectiblePurchasedBool = 0
        }
    }
    
    let playButton : UIButton = {
        let playButton = UIButton()
        playButton.setImage(#imageLiteral(resourceName: "playButton"), for: .normal)
        playButton.contentMode = .scaleAspectFit
        playButton.addTarget(self, action: #selector(playButtonPressed), for: .touchUpInside)
        return playButton
    }()
    
    @objc func playButtonPressed() {
        
        print("pbp")
        
        if collectiblePurchasedBool == 0 {
            return
        } else {
            
            if let player = player, player.isPlaying {
                player.stop()
            } else {
                // setup player and play
                
                let urlString = Bundle.main.path(forResource: "sickoMode", ofType: "mp3")
                
                do {
                    try AVAudioSession.sharedInstance().setMode(.default)
                    try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
                    
                    guard let urlString = urlString else { return }
                    
                    
                    player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: urlString))
                    
                    guard let player = player else { return }
                    
                    player.play()
                    
                    
                } catch  {
                    print("Something went wrong")
                }
                
            }
        }
        
        
        
        
    }
    
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
        
        view.addSubview(purchasedBoolButton)
        purchasedBoolButton.anchor(top: view.topAnchor, left: nil, bottom: nil, right: view.rightAnchor, paddingTop: 30, paddingLeft: 0, paddingBottom: 0, paddingRight: 15, width: 80, height: 30)
        
        view.addSubview(playerGif)
        playerGif.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 350, paddingLeft: 15, paddingBottom: 0, paddingRight: 15, width: 0, height: 50)
        
        let stackView = UIStackView(arrangedSubviews: [rewindButton, playButton, fastForwardButton])
        stackView.distribution = .fillEqually
        stackView.spacing = 60
        stackView.axis = .horizontal
        view.addSubview(stackView)
        stackView.anchor(top: playerGif.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 280, paddingLeft: 100, paddingBottom: 0, paddingRight: 100, width: 0, height: 40)
        
        
        var mp3Player: AVAudioPlayer?
        
        let path = Bundle.main.path(forResource: "mySong.mp3", ofType:nil)!
        let url = URL(fileURLWithPath: path)

        do {
            mp3Player = try AVAudioPlayer(contentsOf: url)
            mp3Player?.play()
        } catch {
            // couldn't load file :(
        }
    }
}
