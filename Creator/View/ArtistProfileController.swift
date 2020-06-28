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
        
        createFormattedStrings(nameDictionary: collectibleNames, collectibleTypeDictionaries: collectibleTypes)
    }
    
    let cellId = "cellId"
    var collectibleImages : [UIImage?] = [UIImage(named: "asapCollectible1.png"),UIImage(named: "asapCollectible2.png"),UIImage(named: "asapCollectible3.png"),UIImage(named: "asapCollectible4.png"),UIImage(named: "asapCollectible5.png"),UIImage(named: "asapCollectible6.png"),UIImage(named: "asapCollectible7.png"),UIImage(named: "asapCollectible8.png"),UIImage(named: "asapCollectible9.png"),UIImage(named: "asapCollectible10.png")]
    var collectibleNames = ["Poinsettia", "SON OF HARLEM", "FLACKO FAN CLUB","BLVCK SCVLE", "Babushka Boi", "RIP YAM$", "Behind the Scenes - On Tour w/ Rocky", "LIMITED EDITION MUSIC VIDEO","Studio Notes","PRETTY ASS PICTURE HAHA"]
    var collectibleTypes = ["Unreleased Track","Short Film", "VIP Pass", "Lookbook", "Demo", "Charity Pin", "Video", "Video", "Text", "Picture"]
    var collectibleRarities = ["Ultra Rare","Ultra Rare","Ultra Rare","Ultra Rare","Ultra Rare","Ultra Rare","Ultra Rare","Ultra Rare","Ultra Rare","Ultra Rare"]
    var availabilityStatuses = ["$49.99", "$82.04", "$189.22","$16.16", "$25.88","$19.28", "$75.44","$24.20", "$11.18","$26.18"]
    
    var priceChartImages : [UIImage?] = [UIImage(named: "greenSparkline1.png"),UIImage(named: "redSparkline1.png"),UIImage(named: "greenSparkline2.png"),UIImage(named: "redSparkline2.png"),UIImage(named: "greenSparkline1.png"),UIImage(named: "redSparkline1.png"),UIImage(named: "greenSparkline2.png"),UIImage(named: "redSparkline2.png"),UIImage(named: "greenSparkline1.png"),UIImage(named: "redSparkline1.png")]
    
    
    var collectibleDetailStrings : [NSMutableAttributedString] = []
    
    func createFormattedStrings(nameDictionary : [String], collectibleTypeDictionaries : [String]) {

        for (name, type) in zip(nameDictionary, collectibleTypeDictionaries) {
            
            let collectibleDetailsString = NSMutableAttributedString(string: name, attributes: [NSAttributedString.Key.font: UIFont(name: "Futura", size: 14), NSAttributedString.Key.foregroundColor: UIColor.rgb(red: 0, green: 0, blue: 0)])
            
            collectibleDetailsString.append(NSAttributedString(string: " | ", attributes: [NSAttributedString.Key.font: UIFont(name: "Futura", size: 14), NSAttributedString.Key.foregroundColor: UIColor.rgb(red: 0, green: 0, blue: 0)]))
    
            collectibleDetailsString.append(NSAttributedString(string: type, attributes: [NSAttributedString.Key.font: UIFont(name: "Futura", size: 14), NSAttributedString.Key.foregroundColor: UIColor.rgb(red: 70, green: 69, blue: 70)]))
    
            collectibleDetailStrings.append(collectibleDetailsString)
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ArtistProfileCollectibleCell
        cell.collectibleImage.image = collectibleImages[indexPath.row]
        cell.collectibleNameAndType.attributedText = collectibleDetailStrings[indexPath.row]
        cell.collectibleType.text = collectibleTypes[indexPath.row]
        cell.collectiblePrice.text = availabilityStatuses[indexPath.row]
        cell.collectiblePriceChart.image = priceChartImages[indexPath.row]
        cell.selectionStyle = .none
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return collectibleImages.count
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 220
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "headerId")
        return header
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let collectibleProfileController = CollectibleProfileController()
        navigationController?.pushViewController(collectibleProfileController, animated: true)
        
    }
}
