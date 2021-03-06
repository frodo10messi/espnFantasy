//
//  BasketBall.swift
//  espnFantasyApp
//
//  Created by prog on 12/19/19.
//  Copyright © 2019 prog. All rights reserved.
//

import Foundation
//
//  Rugby.swift
//  espnFantasyApp
//
//  Created by prog on 12/19/19.
//  Copyright © 2019 prog. All rights reserved.
//

import Foundation
import UIKit
 class BasketBallHeader: UICollectionReusableView {
   
 
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
         setupShadow(opacity: 1, radius: 14, offset: CGSize(width: 0, height: 1), color:  UIColor(red: 0, green: 0, blue: 0, alpha: 0.17))
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}
class BasketBall: BaseCell
  ,
UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout
{
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.white
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
//
////    var videos: [Video]?
////
    fileprivate let  cellId = "rugbycellId"
    fileprivate let supplementaryViewId = "rugbysupplementaryViewId"

////    func fetchVideos() {
////        ApiService.shared.fetchVideos { (videos: [Video]) in
////
////            self.videos = videos
////            self.collectionView.reloadData()
////
////        }
////    }
//
    override func setupViews() {
        super.setupViews()
    
        backgroundColor = .white
//// 50 menu bar height
        addSubview(collectionView)
        collectionView.anchor(top: safeAreaLayoutGuide.topAnchor, leading: self.leadingAnchor, bottom: self.bottomAnchor, trailing: self.trailingAnchor, padding: .init(top: 50 + 50, left: 0, bottom: 0, right: 0), size: .zero)
         collectionView.backgroundColor = .white
        collectionView.register(BasketBallHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: supplementaryViewId)
        collectionView.register(BasketBallCells.self, forCellWithReuseIdentifier: cellId)
    }
       func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard  let supplementaryView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: supplementaryViewId, for: indexPath) as? BasketBallHeader else{return UICollectionReusableView() }

        return supplementaryView
    }
     
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: frame.width, height: 30)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard  let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? BasketBallCells else{return UICollectionViewCell()}

//        cell.video = videos?[indexPath.item]

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: frame.width, height: 320)
    }
//
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

////    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
////        let videoLauncher = VideoLauncher()
////        videoLauncher.showVideoPlayer()
////    }
//
//
}

 

