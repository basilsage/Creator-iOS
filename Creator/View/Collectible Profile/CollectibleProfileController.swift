//
//  ArtistProfileController.swift
//  Creator
//
//  Created by DJ Satoda on 4/26/20.
//  Copyright © 2020 DJ Satoda. All rights reserved.
//

import Foundation
import UIKit

class CollectibleProfileController : UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Loading artist profile")
        
        tableView.register(CollectibleProfileLedgerCell.self, forCellReuseIdentifier: cellId)
        tableView.register(CollectibleProfileHeader.self, forHeaderFooterViewReuseIdentifier: "headerId")
        
         self.navigationController?.navigationBar.tintColor = UIColor.black
        
    }
    
    let cellId = "cellId"
    var collectibleImages : [UIImage?] = [UIImage(named: "benProfilePic.png"),UIImage(named: "mickProfilePic.png"),UIImage(named: "tylerProfilePic.png"),UIImage(named: "brooksProfilePic.png"),UIImage(named: "benProfilePic.png"),UIImage(named: "mickProfilePic.png"),UIImage(named: "tylerProfilePic.png"),UIImage(named: "brooksProfilePic.png"),UIImage(named: "benProfilePic.png"),UIImage(named: "benProfilePic.png")]
    var collectibleNames = ["Ben purchased a copy","Mick purchased a copy","Tyler purchased a copy","Brooks purchased a copy","Cameron purchased a copy","Ross purchased a copy","Drew purchased a copy","Andy purchased a copy","Austin purchased a copy","Jenna purchased a copy"]
    var availabilityStatuses = ["$49.99", "$49.99", "$49.99","$49.99","$49.99", "$49.99", "$49.99","$49.99","$49.99","$49.99"]
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! CollectibleProfileLedgerCell
        cell.collectibleImage.image = collectibleImages[indexPath.row]
        cell.collectibleName.text = collectibleNames[indexPath.row]
        cell.availabilityStatus.text = availabilityStatuses[indexPath.row]
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 440
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
    }
}
