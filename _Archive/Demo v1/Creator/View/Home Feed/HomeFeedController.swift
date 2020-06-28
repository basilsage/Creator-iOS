//
//  HomeFeedController.swift
//  Creator
//
//  Created by DJ Satoda on 4/25/20.
//  Copyright © 2020 DJ Satoda. All rights reserved.
//

import Foundation
import UIKit

class HomeFeedController : UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Hello")
        
        tableView.register(HomeFeedCell.self, forCellReuseIdentifier: cellId)
        
        navigationItem.title = "Creator"

        // To Set your navigationBar title font and color.
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.black, NSAttributedString.Key.font:UIFont(name:"Futura", size: 18)]
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: nil)
        navigationItem.rightBarButtonItem?.tintColor = .black
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: nil)
        
        
        
    }
    
    //MARK: Setup Variables
    let cellId = "cellId"
    
    //MARK: Feed Data, to be replaced by backend eventually
    
    var friendProfilePics : [UIImage] = [#imageLiteral(resourceName: "brooksProfilePic"),#imageLiteral(resourceName: "rockyProfile"),#imageLiteral(resourceName: "mickProfilePic")]
    var friendActions = ["Tyler Satoda purchased a collectible", "A$AP Rocky issued a new collectible", "Boyish is your friends' #1 artist of June"]
    var collectibleImages : [UIImage] = [#imageLiteral(resourceName: "travisScott4"),#imageLiteral(resourceName: "asapCollectible1"),#imageLiteral(resourceName: "boyish")]
    var collectibleTitles = ["Lotus Vision (AstroWorld Deleted Track)", "Poinsettia (Unreleased Track)", "Cookbook from Gordon Ramsay"]
    var rarityDescription = ["ULTRA RARE - One of 10 Copies","RARE - One of 10,000 Copies" , "COMMON - One of 50,000 Copies"]
    var collectibleDescriptions = ["Cut from Travis Scott's hit album AstroWorld, Lotus Vision is an atmospheric track that is innovative and yet entirely recognizable to the Cactus Jack brand", "What's good, my newest track is available exclusively via Creator. Only 10k copies will ever be sold. Get yours today. Much love - Pretty Flacko", "Cut from Travis Scott's hit album Astroworld, Lotus Vision is an atmospheric track that is innovative and yet entirely recognizable to the Cactus Jack brand"]
    
    //MARK: TableView Required Methods
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! HomeFeedCell
        cell.friendProfileImage.image = friendProfilePics[indexPath.row]
        cell.friendActionDescriptor.text = friendActions[indexPath.row]
        cell.collectibleImage.image = collectibleImages[indexPath.row]
        cell.collectibleTitle.text = collectibleTitles[indexPath.row]
        cell.collectibleRarity.text = rarityDescription[indexPath.row]
        cell.collectibleDescription.text = collectibleDescriptions[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let artistProfileController = ArtistProfileController()        
        navigationController?.pushViewController(artistProfileController, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 430
    }
}
