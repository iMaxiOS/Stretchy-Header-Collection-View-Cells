//
//  StretchyHeaderController.swift
//  Stretchy-Header-Collection-View-Cells - LBTA
//
//  Created by Maxim Granchenko on 4/15/19.
//  Copyright © 2019 Maxim Granchenko. All rights reserved.
//

import UIKit

class StretchyHeaderController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    struct Storyboard {
        static let reuseID = "reuseID"
        static let headerID = "headerID"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionViewLayout()
        setupcollectionView()
    }
    
    fileprivate func setupcollectionView() {
        collectionView.backgroundColor = .white
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
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: Storyboard.headerID, for: indexPath)
        return header
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
