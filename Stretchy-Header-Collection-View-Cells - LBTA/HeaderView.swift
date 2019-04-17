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
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        label.text = "Tinder firestone MVVM"
        return label
    }()
    
    let descriptionLable: UILabel = {
        let label = UILabel()
        label.text = "46 Lessons Avalable"
        label.textColor = UIColor(white: 0.9, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        return label
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 4
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(imageView)
        imageView.fillSuperview()
        
        addSubview(stackView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(descriptionLable)
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30).isActive = true
        stackView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        configeUI()
    }
    
    var animation: UIViewPropertyAnimator!
    
    fileprivate func configeUI() {
        animation = UIViewPropertyAnimator(duration: 3.0, curve: .linear, animations: { [weak self] in
            let visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .regular))
            self?.addSubview(visualEffectView)
            visualEffectView.fillSuperview()
        })
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
