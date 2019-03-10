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
        
        brandLabel.font = UIFont.systemFont(ofSize: 18, weight: .light)
        brandLabel.textAlignment = .natural
        brandLabel.textColor = .black
        hoverView.addSubview(brandLabel)
        
        priceLabel.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        priceLabel.textAlignment = .natural
        priceLabel.textColor = .black
        hoverView.addSubview(priceLabel)
        
        nameLabel.font = UIFont.systemFont(ofSize: 26, weight: .semibold)
        nameLabel.textAlignment = .natural
        nameLabel.textColor = .black
        hoverView.addSubview(nameLabel)
        
        hoverView.backgroundColor = .white
        hoverView.layer.cornerRadius = 8.0
        hoverView.clipsToBounds = true
        hoverView.layer.borderColor = UIColor.black.cgColor
        hoverView.layer.borderWidth = 2
        cardImageView.addSubview(hoverView)
        
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
            make.bottom.equalToSuperview()
        }
        
        hoverView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().offset(-10)
            make.height.equalTo(100)
        }

        nameLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.bottom.equalTo(brandLabel.snp.top).offset(-5)
        }

        brandLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.bottom.equalTo(priceLabel.snp.top).offset(-5)
        }

        priceLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.bottom.equalToSuperview().offset(-5)
        }
    }
}
