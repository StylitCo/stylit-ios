//
//  CartCell.swift
//  Stylit
//
//  Created by Lucas Wotton on 2/24/19.
//  Copyright © 2019 Lucas Wotton. All rights reserved.
//

import Foundation
import UIKit

class CartCellView: UIView {
    let itemImageView = UIImageView()
    let buyButton = UIButton()
    let removeButton = UIButton()
    
    let titleLabel = UILabel()
    let priceLabel = UILabel()
    
    var cartIndex = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setImageIndex(i: Int) {
        cartIndex = i
        print(cartIndex)
        
        var cartData = CartService.getCartImages()
        itemImageView.image = cartData[cartIndex]
    }
}

private extension CartCellView {
    
    func setupSubviews() {
        itemImageView.image = UIImage(named: "StylishMan")
//        itemImageView.image = cartImage
        itemImageView.layer.masksToBounds = true
        itemImageView.layer.cornerRadius = 25
        
        self.addSubview(itemImageView)
        
        buyButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        buyButton.titleLabel?.textAlignment = .natural
        buyButton.setTitle("Buy Now", for: .normal)
        buyButton.setTitleColor(.white, for: .normal)
        buyButton.backgroundColor = .purple
        buyButton.clipsToBounds = true
        buyButton.layer.cornerRadius = 10
//        buyButton.addTarget(self, action: #selector(EventPostCollectionViewCell.attendButtonPressed(_:)), for: .touchUpInside)
        self.addSubview(buyButton)
        
        removeButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        removeButton.titleLabel?.textAlignment = .natural
        removeButton.setTitle("Remove", for: .normal)
        removeButton.setTitleColor(.white, for: .normal)
        removeButton.backgroundColor = .darkGray
        removeButton.clipsToBounds = true
        removeButton.layer.cornerRadius = 10
        //        buyButton.addTarget(self, action: #selector(EventPostCollectionViewCell.attendButtonPressed(_:)), for: .touchUpInside)
        self.addSubview(removeButton)
        
        titleLabel.textColor = .black
        titleLabel.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        titleLabel.textAlignment = .natural
        titleLabel.text = "Item Title"
        
        priceLabel.textColor = .black
        priceLabel.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        priceLabel.textAlignment = .natural
        priceLabel.text = "Item Price"
        
//        self.addSubview(itemImageView)
        self.addSubview(titleLabel)
        self.addSubview(priceLabel)
        
        backgroundColor = UIColor.lightGray
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 12)
        layer.shadowRadius = 10
        layer.shadowOpacity = 0.1
    }
    
    func setupLayout() {
        itemImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(5)
            make.top.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().offset(-10)
            make.width.equalTo(100)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(itemImageView.snp.trailing).offset(20)
            make.top.equalToSuperview().offset(20)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.leading.equalTo(titleLabel.snp.leading)
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
        }
        
        buyButton.snp.makeConstraints { make in
            make.leading.equalTo(itemImageView.snp.trailing).offset(20)
            make.bottom.equalToSuperview().offset(-15)
            make.width.equalTo(100)
        }
        
        removeButton.snp.makeConstraints { make in
            make.leading.equalTo(buyButton.snp.trailing).offset(15)
            make.bottom.equalToSuperview().offset(-15)
            make.width.equalTo(100)
        }
    }
}
