//
//  StretchyHeaderLayout.swift
//  Stretchy-Header-Collection-View-Cells - LBTA
//
//  Created by Maxim Granchenko on 4/16/19.
//  Copyright © 2019 Maxim Granchenko. All rights reserved.
//

import UIKit

class StretchyHeaderLayout: UICollectionViewFlowLayout {
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let layoutAttributed = super.layoutAttributesForElements(in: rect)
        
        layoutAttributed?.forEach({ (attribute) in
            
            if attribute.representedElementKind == UICollectionView.elementKindSectionHeader && attribute.indexPath.section == 0 {
                
                guard let collectionView = collectionView else { return }
                let contentOffSetY = collectionView.contentOffset.y
                if contentOffSetY > 0 {
                    return
                }
                let width = collectionView.frame.width
                let height = attribute.frame.height - contentOffSetY
                
                attribute.frame = CGRect(x: 0, y: contentOffSetY, width: width, height: height)
            }
        })
        return layoutAttributed
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
}
