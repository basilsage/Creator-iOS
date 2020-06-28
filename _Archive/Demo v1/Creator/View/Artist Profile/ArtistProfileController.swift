//
//  ArtistProfileController.swift
//  Creator
//
//  Created by DJ Satoda on 4/26/20.
//  Copyright © 2020 DJ Satoda. All rights reserved.
//

import Foundation
import UIKit

class ArtistProfileController : UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Loading artist profile")
        
        tableView.register(ArtistProfileCollectibleCell.self, forCellReuseIdentifier: cellId)
        tableView.register(ArtistProfileHeader.self, forHeaderFooterViewReuseIdentifier: "headerId")
        
         self.navigationController?.navigationBar.tintColor = UIColor.black
        
    }
    
    let cellId = "cellId"
    var collectibleImages : [UIImage?] = [UIImage(named: "asapCollectible1.png"),UIImage(named: "asapCollectible2.png"),UIImage(named: "asapCollectible3.png"),UIImage(named: "asapCollectible4.png"),UIImage(named: "asapCollectible5.png"),UIImage(named: "asapCollectible6.png"),UIImage(named: "asapCollectible7.png"),UIImage(named: "asapCollectible8.png"),UIImage(named: "asapCollectible9.png"),UIImage(named: "asapCollectible10.png")]
    var collectibleNames = ["Poinsettia (Unreleased Track)", "SON OF HARLEM - A SHORT FILM", "Concert VIP Pass","PRETTY FLACKO LOOKBOOK", "BABUSHKA BOI - DEMO", "CHARITY PIN - RIP YAMS", "Behind the Scenes Video - On Tour w/ Rocky", "LIMITED EDITION MUSIC VIDEO","Studio Notes","PRETTY ASS PICTURE HAHA"]
    var availabilityStatuses = ["18 / 10,000\nLeft", "SOLD OUT", "SOLD OUT","SOLD OUT", "SOLD OUT","SOLD OUT", "SOLD OUT","SOLD OUT", "SOLD OUT","SOLD OUT"]
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ArtistProfileCollectibleCell
        cell.collectibleImage.image = collectibleImages[indexPath.row]
        cell.collectibleName.text = collectibleNames[indexPath.row]
        cell.availabilityStatus.text = availabilityStatuses[indexPath.row]
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 220
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "headerId")
        return header
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let collectibleProfileController = CollectibleProfileController()
        navigationController?.pushViewController(collectibleProfileController, animated: true)
        
    }
}
