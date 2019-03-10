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
    
    let cardImageView = UIImageView()
    
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
        cardImageView.backgroundColor = .white
        cardImageView.layer.cornerRadius = 8.0
        cardImageView.clipsToBounds = true
        self.addSubview(cardImageView)
        
        // TODO: Add shadows?
    }
    
    private func setupLayout() {
        cardImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
