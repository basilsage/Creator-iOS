//
//  ArtistProfileController.swift
//  Creator
//
//  Created by DJ Satoda on 4/26/20.
//  Copyright © 2020 DJ Satoda. All rights reserved.
//

import Foundation
import AVKit
import UIKit
import AVFoundation

class CollectibleProfileController : UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UITableViewDataSource, UITableViewDelegate {
    
    var detailsTableView : UITableView!
    var collectionView: UICollectionView!
    var tableViewCellId = "tvCID"
    var collectionViewCellId = "cvCID"
    
    
    

    //MARK: UI Elements
    
    let videoView : UIImageView = {
        let playerGif = UIImageView()
        playerGif.backgroundColor = .red
        playerGif.contentMode = .scaleAspectFill
        playerGif.loadGif(name: "asapRocky.gif")
        return playerGif
    }()
    
    let profileBackgroundView : UIScrollView = {
        let pbv = UIScrollView(frame: UIScreen.main.bounds)
        pbv.backgroundColor = .white
        return pbv
    }()
    
    lazy var exitButton : UIButton = {
        let eb = UIButton(type: .system)
        eb.setTitle("X", for: .normal)
        eb.addTarget(self, action: #selector(exitButtonPressed), for: .touchUpInside)
        return eb
    }()
    
    var artistName : UILabel = {
        let an = UILabel()
        an.textColor = UIColor.black
        an.text = "More Fatter"
        an.font = UIFont.boldSystemFont(ofSize: 40)
        return an
    }()
    
    @objc func exitButtonPressed() {
        print("Exit button pressed")
        self.dismiss(animated: true, completion: nil)
    }
    
    let dollarsRaised: UILabel = {
        let label = UILabel()
        let attributedText = NSMutableAttributedString(string: "Raised\n", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)])
        attributedText.append(NSAttributedString(string: "$1,584", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14)]))
        label.attributedText = attributedText
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    let copiesLeft: UILabel = {
        let label = UILabel()
        let attributedText = NSMutableAttributedString(string: "Copies Left\n", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)])
        attributedText.append(NSAttributedString(string: "25", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14)]))
        label.attributedText = attributedText
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    let collectiblePicture : UIImageView = {
        let artistProfilePic = UIImageView()
        artistProfilePic.image = #imageLiteral(resourceName: "asapCollectible1")
        artistProfilePic.contentMode = .scaleAspectFill
        artistProfilePic.clipsToBounds = true
        return artistProfilePic
    }()
    
    let collectibleName : UILabel = {
        let an = UILabel()
        let collectibleDetailsString = NSMutableAttributedString(string: "Poinsettia", attributes: [NSAttributedString.Key.font: UIFont(name: "Futura", size: 18) ?? UIFont.systemFont(ofSize: 18), NSAttributedString.Key.foregroundColor: UIColor.rgb(red: 0, green: 0, blue: 0)])
        collectibleDetailsString.append(NSAttributedString(string: " | ", attributes: [NSAttributedString.Key.font: UIFont(name: "Futura", size: 18) ?? UIFont.systemFont(ofSize: 18), NSAttributedString.Key.foregroundColor: UIColor.rgb(red: 0, green: 0, blue: 0)]))
        collectibleDetailsString.append(NSAttributedString(string: "Unreleased Track", attributes: [NSAttributedString.Key.font: UIFont(name: "Futura", size: 18) ?? UIFont.systemFont(ofSize: 18), NSAttributedString.Key.foregroundColor: UIColor.rgb(red: 70, green: 69, blue: 70)]))
        an.attributedText = collectibleDetailsString
        return an
    }()
    
    var aboutHeaderLabel : UILabel = {
        let ahl = UILabel()
        ahl.textColor = UIColor.black
        ahl.text = "About"
        ahl.font = UIFont.boldSystemFont(ofSize: 20)
        return ahl
    }()
    
    var aboutText : UILabel = {
        let ahl = UILabel()
        ahl.textColor = UIColor.black
        ahl.text = "Writing for the court, Chief Justice John Roberts recalled the trial of Aaron Burr for treason, when Chief Justice John Marshall ordered President Jefferson to turn over evidence the former vice president sought in his defense. Two hundred years ago, a great jurist of our Court established that no citizen, not even the President, is categorically above the common duty to produce evidence when called upon in a criminal proceeding,” Chief Justice Roberts wrote."
        ahl.numberOfLines = 0
        ahl.font = UIFont.boldSystemFont(ofSize: 12)
        return ahl
    }()
    
    var verifiedOwnersLabel : UILabel = {
        let vol = UILabel()
        vol.textColor = UIColor.black
        vol.text = "Verified Owners"
        vol.font = UIFont.boldSystemFont(ofSize: 20)
        return vol
    }()
    
    let permanentBuySection : UIView = {
        let pbs = UIView()
        pbs.backgroundColor = UIColor.white
        return pbs
    }()
    
    let buyButton : UIButton = {
        let bb = UIButton(type: .system)
        bb.backgroundColor = .black
        bb.setTitle("Buy Collectible", for: .normal)
        bb.setTitleColor(.white, for: .normal)
        return bb
    }()
    
    let priceLabel : UILabel = {
        let pl = UILabel()
        pl.text = "$20.00\nPer Share"
        pl.numberOfLines = 0
        pl.textAlignment = .center
        return pl
    }()
    
    
    func getVideo() {
        let videoURL = URL(string: "http://techslides.com/demos/sample-videos/small.3gp")
        let player = AVPlayer(url: videoURL!)
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.videoView.bounds
        self.videoView.layer.addSublayer(playerLayer)
        player.play()
    }
    
    //MARK: Initializer
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal

        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.register(CollectibleProfileLedgerCell.self, forCellWithReuseIdentifier: collectionViewCellId)
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = UIColor.white

        
        view.addSubview(profileBackgroundView)
        profileBackgroundView.contentSize = CGSize(width: view.frame.width, height: 6000)
        profileBackgroundView.isScrollEnabled = true
        
        profileBackgroundView.addSubview(exitButton)
        exitButton.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 30, height: 30)
        
        profileBackgroundView.addSubview(artistName)
        artistName.anchor(top: profileBackgroundView.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 30, paddingLeft: 25, paddingBottom: 0, paddingRight: 0, width: 0, height: 30)
        
        profileBackgroundView.addSubview(collectibleName)
        collectibleName.anchor(top: artistName.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 15, paddingLeft: 25, paddingBottom: 0, paddingRight: 0, width: 0, height: 20)

        view.addSubview(videoView)
        videoView.anchor(top: collectibleName.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 25, paddingLeft: 25, paddingBottom: 0, paddingRight: 25, width: 0, height: 180)
        
        addAvailabilityStatsStackView()

        view.addSubview(aboutHeaderLabel)
        aboutHeaderLabel.anchor(top: videoView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 80, paddingLeft: 25, paddingBottom: 0, paddingRight: 25, width: 0, height: 25)

        view.addSubview(aboutText)
        aboutText.anchor(top: aboutHeaderLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 20, paddingLeft: 25, paddingBottom: 0, paddingRight: 25, width: 0, height: 200)
        
        view.addSubview(verifiedOwnersLabel)
        verifiedOwnersLabel.anchor(top: aboutText.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 20, paddingLeft: 25, paddingBottom: 0, paddingRight: 25, width: 0, height: 15)
        
        view.addSubview(collectionView)
        collectionView.anchor(top: verifiedOwnersLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: 0, height: 100)
        
        detailsTableView = UITableView(frame: self.view.frame, style: .plain)
        detailsTableView.register(CollectibleDetailsTableViewCell.self, forCellReuseIdentifier: tableViewCellId)
        detailsTableView.dataSource = self
        view.addSubview(detailsTableView)
        detailsTableView.isScrollEnabled = false
        detailsTableView.allowsSelection = false
        detailsTableView.anchor(top: collectionView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 10, paddingLeft: 25, paddingBottom: 0, paddingRight: 25, width: 0, height: 150)
        
        view.addSubview(permanentBuySection)
        permanentBuySection.anchor(top: nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 100)
        
        permanentBuySection.addSubview(priceLabel)
        priceLabel.anchor(top: permanentBuySection.topAnchor, left: permanentBuySection.leftAnchor, bottom: permanentBuySection.bottomAnchor, right: nil, paddingTop: 20, paddingLeft: 20, paddingBottom: 20, paddingRight: 0, width: 200, height: 0)
        
        permanentBuySection.addSubview(buyButton)
        buyButton.anchor(top: permanentBuySection.topAnchor, left: nil, bottom: permanentBuySection.bottomAnchor, right: permanentBuySection.rightAnchor, paddingTop: 20, paddingLeft: 0, paddingBottom: 20, paddingRight: 20, width: 200, height: 0)
        
         self.navigationController?.navigationBar.tintColor = UIColor.black
        
    }
    
    func addAvailabilityStatsStackView() {
        let availabilityStatsStackView = UIStackView(arrangedSubviews: [dollarsRaised, copiesLeft])
        availabilityStatsStackView.distribution = .fillEqually
        view.addSubview(availabilityStatsStackView)
        availabilityStatsStackView.anchor(top: videoView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 10, paddingLeft: 25, paddingBottom: 0, paddingRight: 25, width: 0, height: 50)
    }

    //Replace with backend eventually
    var collectorProfileImages : [UIImage?] = [UIImage(named: "benProfilePic.png"),UIImage(named: "mickProfilePic.png"),UIImage(named: "tylerProfilePic.png"),UIImage(named: "brooksProfilePic.png"),UIImage(named: "benProfilePic.png"),UIImage(named: "mickProfilePic.png"),UIImage(named: "tylerProfilePic.png"),UIImage(named: "brooksProfilePic.png"),UIImage(named: "benProfilePic.png"),UIImage(named: "benProfilePic.png")]
    var collectorUsername = ["b45", "raghav500", "djtb23","andyWilms","CoCoWinter", "JCole", "DaBaby","Uzi","Kuzi","Snoozy"]
    

    //MARK: TableView
    
    let questions = ["Medium", "Year", "Length"]
    let answers = ["Video", "2020", "3:20"]
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tableViewCellId, for: indexPath) as! CollectibleDetailsTableViewCell
        cell.detailQuestion.text = questions[indexPath.row]
        cell.detailAnswer.text = answers[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questions.count
    }
    
    
    //MARK: Collection View
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionViewCellId, for: indexPath) as! CollectibleProfileLedgerCell
        cell.collectorProfileImages.image = collectorProfileImages[indexPath.row]
        cell.collectorUsername.text = collectorUsername[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.width - 1) / 2
        return CGSize(width: width, height: width)
    }
}
