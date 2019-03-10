//
//  CardView.swift
//  Stylit
//
//  Created by Lucas Wotton on 3/10/19.
//  Copyright © 2019 Lucas Wotton. All rights reserved.
//

import Foundation
import UIKit

class CardView: UIView {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// Setup subviews
extension CardView {
    private func setupSubviews() {
        let imageView = UIImageView(image: dataSource[Int(index)].image)
        imageView.backgroundColor = .white
        imageView.layer.cornerRadius = 8.0
        imageView.clipsToBounds = true
        // TODO: Add shadows?
        
        return imageView

    }
    
    private func setupLayout() {
        
    }
}
