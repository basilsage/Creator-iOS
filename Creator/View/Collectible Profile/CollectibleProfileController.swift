//
//  ArtistProfileController.swift
//  Creator
//
//  Created by DJ Satoda on 4/26/20.
//  Copyright © 2020 DJ Satoda. All rights reserved.
//

import Foundation
import UIKit

class CollectibleProfileController : UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Loading artist profile")
        
        let headerId = "headerId"
        let footerId = "footerId"
        
        
        collectionView.register(CollectibleProfileLedgerCell.self, forCellWithReuseIdentifier: cellId)
        
        collectionView.register(CollectibleProfileHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
        collectionView.register(CollectibleProfileFooter.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: footerId)
        
         self.navigationController?.navigationBar.tintColor = UIColor.black
        
    }
    
    let cellId = "cellId"
    var collectibleImages : [UIImage?] = [UIImage(named: "benProfilePic.png"),UIImage(named: "mickProfilePic.png"),UIImage(named: "tylerProfilePic.png"),UIImage(named: "brooksProfilePic.png"),UIImage(named: "benProfilePic.png"),UIImage(named: "mickProfilePic.png"),UIImage(named: "tylerProfilePic.png"),UIImage(named: "brooksProfilePic.png"),UIImage(named: "benProfilePic.png"),UIImage(named: "benProfilePic.png")]
    var collectibleNames = ["Ben purchased a copy","Mick purchased a copy","Tyler purchased a copy","Brooks purchased a copy","Cameron purchased a copy","Ross purchased a copy","Drew purchased a copy","Andy purchased a copy","Austin purchased a copy","Jenna purchased a copy"]
    var availabilityStatuses = ["$49.99", "$49.99", "$49.99","$49.99","$49.99", "$49.99", "$49.99","$49.99","$49.99","$49.99"]
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CollectibleProfileLedgerCell
        cell.collectibleImage.image = collectibleImages[indexPath.row]
        cell.collectibleName.text = collectibleNames[indexPath.row]
        cell.availabilityStatus.text = availabilityStatuses[indexPath.row]
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height - 500 - 80)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 100)
    }
    

    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.width - 1) / 2
        return CGSize(width: width, height: width)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {

        case UICollectionView.elementKindSectionHeader:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headerId", for: indexPath) as! CollectibleProfileHeader

            header.backgroundColor = UIColor.blue
            return header

        case UICollectionView.elementKindSectionFooter:
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "footerId", for: indexPath) as! CollectibleProfileFooter

            footer.backgroundColor = UIColor.green
            return footer

        default:
            assert(false, "Unexpected element kind")
        }
    }
    
    
    init() {
       let flowLayout = UICollectionViewFlowLayout()
       flowLayout.scrollDirection = .horizontal
        flowLayout.sectionHeadersPinToVisibleBounds = true
       super.init(collectionViewLayout: flowLayout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
