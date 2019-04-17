//
//  StretchyHeaderController.swift
//  Stretchy-Header-Collection-View-Cells - LBTA
//
//  Created by Maxim Granchenko on 4/15/19.
//  Copyright © 2019 Maxim Granchenko. All rights reserved.
//

import UIKit

class StretchyHeaderController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    var headerView: HeaderView!
    
    struct Storyboard {
        static let reuseID = "reuseID"
        static let headerID = "headerID"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionViewLayout()
        setupСollectionView()
    }
    
    fileprivate func setupСollectionView() {
        collectionView.backgroundColor = .white
        collectionView.contentInsetAdjustmentBehavior = .never
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: Storyboard.reuseID)
        collectionView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: Storyboard.headerID)
    }
    
    fileprivate func setupCollectionViewLayout() {
        //layout costaminazed
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            let padding: CGFloat = 16
            layout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        }
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentOffSet = scrollView.contentOffset.y
        
        if contentOffSet > 0 {
            headerView.animation.fractionComplete = 0
            return
        }
        
        headerView?.animation.fractionComplete = abs(contentOffSet) / 100
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: Storyboard.headerID, for: indexPath) as? HeaderView
        return headerView!
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 300)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 18
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Storyboard.reuseID, for: indexPath)
        cell.backgroundColor = .black
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width - 32, height: 50)
    }
    
    
}
