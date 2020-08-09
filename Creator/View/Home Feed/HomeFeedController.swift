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
    
    let cellId = "cellId"
    // hello3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.separatorColor = .none
        tableView.register(HomeFeedCell.self, forCellReuseIdentifier: cellId)

        // Set navigationBar title font and color.
        navigationItem.title = "Creator"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.black, NSAttributedString.Key.font:UIFont(name:"Futura-Medium", size: 18) ?? UIFont.systemFont(ofSize: 18)]
        
        tableView.separatorColor = .white
        tableView.allowsSelection = false
        tableView.delegate = self
        
        setupAttributedHomeFeedActionString()
        formatCollectibleTitleAndTypes(nameDictionary: collectibleTitles, collectibleTypeDictionaries: collectibleTypes)
        
    }
    
    //
    func formatAttributedHomeFeedActionString(nameOfActor : String, actionOfActor : String) {
        
        let actionString = NSMutableAttributedString(string: nameOfActor, attributes: [NSAttributedString.Key.font: UIFont(name: "Futura", size: 14) ?? UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.rgb(red: 0, green: 95, blue: 133)])
        
        actionString.append(NSAttributedString(string: actionOfActor, attributes: [NSAttributedString.Key.font: UIFont(name: "Futura", size: 14) ?? UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.rgb(red: 0, green: 0, blue: 0)]))
        
        friendActions.append(actionString)
    }
    
    var collectibleTitleAndTypes : [NSMutableAttributedString] = []
    
    func formatCollectibleTitleAndTypes(nameDictionary : [String], collectibleTypeDictionaries : [String]) {

        for (name, type) in zip(nameDictionary, collectibleTypeDictionaries) {
            
            let collectibleDetailsString = NSMutableAttributedString(string: name, attributes: [NSAttributedString.Key.font: UIFont(name: "Futura", size: 16) ?? UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.rgb(red: 0, green: 0, blue: 0)])
            collectibleDetailsString.append(NSAttributedString(string: " | ", attributes: [NSAttributedString.Key.font: UIFont(name: "Futura", size: 16) ?? UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.rgb(red: 0, green: 0, blue: 0)]))
            collectibleDetailsString.append(NSAttributedString(string: type, attributes: [NSAttributedString.Key.font: UIFont(name: "Futura", size: 16) ?? UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.rgb(red: 70, green: 69, blue: 70)]))
            collectibleTitleAndTypes.append(collectibleDetailsString)
        }
    }
    
    // Format headlines on home feed
    func setupAttributedHomeFeedActionString() {
        formatAttributedHomeFeedActionString(nameOfActor: "Tyler Satoda", actionOfActor: " purchased a collectible")
        formatAttributedHomeFeedActionString(nameOfActor: "A$AP Rocky", actionOfActor: " purchased a collectible")
        formatAttributedHomeFeedActionString(nameOfActor: "Shane", actionOfActor: " purchased a collectible")
        formatAttributedHomeFeedActionString(nameOfActor: "Ye", actionOfActor: " purchased a collectible")
    }
    
    //MARK: Feed Data, to be replaced by backend eventually
    var friendProfilePics : [UIImage?] = [#imageLiteral(resourceName: "brooksProfilePic"),#imageLiteral(resourceName: "rockyProfile"),#imageLiteral(resourceName: "benProfilePic"), UIImage(named: "yeProfile.jpg")]
    var friendActions : [NSMutableAttributedString] = []
    var collectibleImages : [UIImage?] = [#imageLiteral(resourceName: "drippin"),#imageLiteral(resourceName: "drippin"),#imageLiteral(resourceName: "drippin"),#imageLiteral(resourceName: "drippin")]
    var collectibleTitles = ["Zesty", "Zesty", "Zesty","Zesty"]
    var collectibleTypes = ["Jam Session", "Jam Session", "Jam Session","Jam Session"]
    var collectibleArtists = ["More Fatter", "More Fatter", "More Fatter","More Fatter"]
    
    var rarityDescription = ["VERY RARE - One of 100 Copies","RARE\n1 / 10k" , "ULTRA RARE - One of 10 Copies","RARE - One of 10,000 Copies"]
    var collectibleDescriptions = ["Hi Theo!! I'm so excited to listen. I'm your #1 fan. Love from South Carolina. Please come tour here one day!","Hi Theo!! I'm so excited to listen. I'm your #1 fan. Love from South Carolina. Please come tour here one day!","Hi Theo!! I'm so excited to listen. I'm your #1 fan. Love from South Carolina. Please come tour here one day!","Hi Theo!! I'm so excited to listen. I'm your #1 fan. Love from South Carolina. Please come tour here one day!"]
    
    
    //MARK: TableView Required Methods
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! HomeFeedCell
        
        cell.isUserInteractionEnabled = true
        cell.friendProfileImage.image = friendProfilePics[indexPath.row]
        cell.friendActionDescriptor.attributedText = friendActions[indexPath.row]
        cell.collectibleImage.image = collectibleImages[indexPath.row]
        cell.collectibleTitle.attributedText = collectibleTitleAndTypes[indexPath.row]
        cell.collectibleDescription.text = collectibleDescriptions[indexPath.row]
        cell.collectibleArtist.text = collectibleArtists[indexPath.row]
        cell.selectionStyle = .none
        
        return cell
    }
    
    // Determines number of rowss
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return collectibleTitles.count
    }

    // Determines height of cell
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 280
    }
}
