//
//  messageCell.swift
//  espnFantasyApp
//
//  Created by prog on 12/30/19.
//  Copyright © 2019 prog. All rights reserved.
//

import Foundation
import UIKit
protocol sendDataBack{
    func send()
}
class messageCell: BaseCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    var delegate:sendDataBack?
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
         cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    lazy var topMatch: UILabel = {
        let t = UILabel(text: "All Topics", font: AppFont.Bold().sixteen, textColor: UIColor(red: 0.471, green: 0.471, blue: 0.471, alpha: 1), textAlignment: .left, numberOfLines: 1)
        return t
    }()
    lazy var AllMatchUps: UILabel = {
        let t = UILabel(text: "New Topic", font: AppFont.Medium().sixteen, textColor: UIColor(red: 0.906, green: 0.208, blue: 0.192, alpha: 1), textAlignment: .right, numberOfLines: 1)
        t.isUserInteractionEnabled = true

        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap))
        t.addGestureRecognizer(tap)
           return t
       }()
    
    @objc func handleTap (){
        print("jhjjjh")
        self.delegate?.send()
    }
//    var videos: [Video]?
//
    fileprivate let  cellId = "DashboardcellId"
    fileprivate let supplementaryViewId = "supplementaryViewId"

//    func fetchVideos() {
//        ApiService.shared.fetchVideos { (videos: [Video]) in
//
//            self.videos = videos
//            self.collectionView.reloadData()
//
//        }
//    }
//    lazy var getATeambtn : UIButton = {
//              let b = UIButton(title: "Get a Team", titleColor:   UIColor(red: 0.071, green: 0.631, blue: 0.792, alpha: 1), font: AppFont.Bold().twelve, backgroundColor: .white, target: nil, action: nil)
//           b.withHeight(40)
//                     b.buttonBorder(withRadius:20 , width: 2,color: .white)
//              return b
//          }()
//          lazy var createLeague : UIButton = {
//                 let b = UIButton(title: "Create League", titleColor:   UIColor(red: 0.071, green: 0.631, blue: 0.792, alpha: 1), font: AppFont.Bold().twelve, backgroundColor: .white, target: nil, action: nil)
//              b.withHeight(40)
//               b.buttonBorder(withRadius:20 , width: 2,color: .white)
//                 return b
//             }()
//          lazy var mockDraft : UIButton = {
//                 let b = UIButton(title: "Mock Draft", titleColor:   UIColor(red: 0.071, green: 0.631, blue: 0.792, alpha: 1), font: AppFont.Bold().twelve, backgroundColor: .white, target: nil, action: nil)
//              b.withHeight(40)
//              b.buttonBorder(withRadius:20 , width: 2,color: .white)
//                 return b
//             }()
       
    
    override func setupViews() {
        super.setupViews()
       
        addSubview(topMatch)
        addSubview(AllMatchUps)

        topMatch.anchor(top: safeAreaLayoutGuide.topAnchor, leading: self.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 50 + 50 , left: 20, bottom: 0, right: 0), size: .init(width: 0, height: 40))
        _ = topMatch.widthAnchor.constraint(greaterThanOrEqualToConstant: 60).isActive = true
        AllMatchUps.anchor(top: safeAreaLayoutGuide.topAnchor, leading: nil, bottom: nil, trailing: self.trailingAnchor, padding: .init(top: 50 + 50 , left: 0, bottom: 0, right: 20), size: .init(width: 100, height: 40))
        
//        hstack(topMatch,UIView(),AllMatchUps)
        
// 50 menu bar height
        addSubview(collectionView)
        collectionView.anchor(top: safeAreaLayoutGuide.topAnchor, leading: self.leadingAnchor, bottom: self.bottomAnchor, trailing: self.trailingAnchor, padding: .init(top: 50 + 50 + 40 , left: 0, bottom: 0, right: 0), size: .zero)
//        collectionView.fillSuperview(padding: .init(top: 0, left: 0, bottom: 0, right: 0))
        collectionView.backgroundColor = .white
        
        collectionView.register(messageSubCell.self, forCellWithReuseIdentifier: cellId)
    }
      
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! messageSubCell
 
//        cell.video = videos?[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: frame.width, height: 120)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
 
    
    
}
 
