//
//  HeaderView.swift
//  Stretchy-Header-Collection-View-Cells - LBTA
//
//  Created by Maxim Granchenko on 4/15/19.
//  Copyright © 2019 Maxim Granchenko. All rights reserved.
//

import UIKit

class HeaderView: UICollectionReusableView {
    
    let imageView: UIImageView = {
        let im = UIImageView(image: #imageLiteral(resourceName: "instagram"))
        im.contentMode = .scaleAspectFill
        return im
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(imageView)
        imageView.fillSuperview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
