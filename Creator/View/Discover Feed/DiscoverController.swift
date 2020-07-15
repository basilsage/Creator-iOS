//
//  DiscoverController.swift
//  Creator
//
//  Created by DJ Satoda on 7/7/20.
//  Copyright © 2020 DJ Satoda. All rights reserved.
//

import Foundation
import UIKit

// https://stackoverflow.com/questions/33126183/how-to-make-uicollectionview-bounce-to-illustrate-scrollability

class DiscoverController : UICollectionViewController, UICollectionViewDelegateFlowLayout, DiscoverCellDelegate {
    
    let cellId = "cellId"
    
    //MARK: Initializer
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.register(DiscoverControllerCell.self, forCellWithReuseIdentifier: cellId)
        
        collectionView.isPagingEnabled = true
        collectionView.translatesAutoresizingMaskIntoConstraints = false // what does this do? Delete and see what happens
        edgesForExtendedLayout = [] // moves below the nav bar
    }
    
    //MARK: CollectionView Delegate Methods
    var colors : [UIColor] = [.blue, .red]
    var collectibleImages : [UIImage] = [#imageLiteral(resourceName: "moreFatter.2jpg"), #imageLiteral(resourceName: "yeProfile")]
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! DiscoverControllerCell
        cell.delegate = self
        cell.collectibleImage.image = collectibleImages[indexPath.item]
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    override init(collectionViewLayout layout: UICollectionViewLayout) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Present Collectible Detail Controller
    func didTapSeeMoreDetail() {
        print("Delegate recceived")
        let collectibleProfileController = CollectibleProfileController()
        collectibleProfileController.modalPresentationStyle = .automatic
        present(collectibleProfileController, animated: true, completion: nil)
    }
    
}
