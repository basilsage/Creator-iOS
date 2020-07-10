//
//  ArtistProfileController.swift
//  Creator
//
//  Created by DJ Satoda on 4/25/20.
//  Copyright © 2020 DJ Satoda. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class UserProfileController : UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    //https://stackoverflow.com/questions/47261152/nest-a-uicollectionview-inside-a-uiview-programmatically/47263346
    
    let cellId = "cellId"
    var userId: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Loading User Profile")
        collectionView?.backgroundColor = .white
        collectionView?.register(UserProfileHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "headerId")
        
        collectionView?.register(UserProfilePhotoCell.self, forCellWithReuseIdentifier: cellId)
        
        
        let settingsButton : UIBarButtonItem = UIBarButtonItem(image: UIImage(named: "settings.png"), style: .done, target: self, action: #selector(settingsButtonPressed))
        navigationItem.leftBarButtonItem = settingsButton
        navigationController?.navigationBar.tintColor = .black
        
        
    }
    
    @objc func settingsButtonPressed() {
        let actionSheet = UIAlertController(title: "Settings", message: "", preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Change Username", style: .default, handler: { (_) in
            print("Change username pressed")
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Help", style: .default, handler: { (_) in
            print("Help button pressed")
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        actionSheet.addAction(UIAlertAction(title: "Logout", style: .destructive, handler: { (_) in
            do {
                try Auth.auth().signOut()
                
                let loginController = LoginController()
                let navController = UINavigationController(rootViewController: loginController)
                navController.modalPresentationStyle = .fullScreen
                self.present(navController, animated: true, completion: nil)
                
            } catch {
                print("Failure to logout")
            }
            
            
            
        }))
        
        present(actionSheet, animated: true, completion: nil)
    }
    
    
    var collectibleImages : [UIImage?] = [UIImage(named: "asapCollectible1.png"),UIImage(named: "asapCollectible2.png"),UIImage(named: "asapCollectible3.png"),UIImage(named: "asapCollectible4.png"),UIImage(named: "asapCollectible5.png"),UIImage(named: "asapCollectible6.png"),UIImage(named: "asapCollectible7.png"),UIImage(named: "asapCollectible8.png"),UIImage(named: "asapCollectible9.png"),UIImage(named: "asapCollectible10.png"),UIImage(named: "asapCollectible1.png"),UIImage(named: "asapCollectible2.png"),UIImage(named: "asapCollectible3.png"),UIImage(named: "asapCollectible4.png"),UIImage(named: "asapCollectible5.png"),UIImage(named: "asapCollectible6.png"),UIImage(named: "asapCollectible7.png"),UIImage(named: "asapCollectible8.png"),UIImage(named: "asapCollectible9.png"),UIImage(named: "asapCollectible10.png")]
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectibleImages.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! UserProfilePhotoCell
        cell.photoImageView.image = collectibleImages[indexPath.row]
        cell.photoImageView.layer.cornerRadius = (view.frame.width - 2) / 6 - 20
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.width - 1) / 2
        return CGSize(width: width, height: width * 1.5)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headerId", for: indexPath) as! UserProfileHeader
        let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headerId", for: indexPath) as! UserProfileHeader
        
        return header
    }

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 250)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let playerViewController = PlayerViewController()
        present(playerViewController, animated: true, completion: nil)
    }
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

