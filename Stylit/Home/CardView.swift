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
    
    private let cardImageView = UIImageView()
    
    private let hoverView = UIView()
    private let separatorView = UIView()
    private let nameLabel = UILabel()
    private let brandLabel = UILabel()
    private let priceLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateCard(with item: Item) {
        self.cardImageView.image = item.image
        self.nameLabel.text = item.title
        self.brandLabel.text = item.brand
        self.priceLabel.text = "$\(item.price)"
    }
}

// Setup subviews
extension CardView {
    private func setupSubviews() {
        cardImageView.contentMode = .scaleAspectFit
        self.addSubview(cardImageView)
        
        separatorView.backgroundColor = UIColor.lightGray
        self.addSubview(separatorView)
        
        brandLabel.font = UIFont.systemFont(ofSize: 20, weight: .light)
        brandLabel.textAlignment = .natural
        brandLabel.textColor = .gray
        self.addSubview(brandLabel)
        
        priceLabel.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        priceLabel.textAlignment = .natural
        priceLabel.textColor = .black
        self.addSubview(priceLabel)
        
        nameLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        nameLabel.textAlignment = .natural
        nameLabel.textColor = .black
        self.addSubview(nameLabel)
        
        self.backgroundColor = .white
        self.layer.cornerRadius = 8.0
        self.clipsToBounds = true
        
        // TODO: Add shadows?
    }
    
    private func setupLayout() {
        cardImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(280)
        }
        
        separatorView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(332)
            make.height.equalTo(1)
            make.bottom.equalTo(nameLabel.snp.top).offset(-10)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.bottom.equalTo(brandLabel.snp.top).offset(-5)
        }

        brandLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.bottom.equalTo(priceLabel.snp.top).offset(-5)
        }

        priceLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().offset(-5)
        }
    }
}
