//
//  CartCell.swift
//  Stylit
//
//  Created by Lucas Wotton on 2/24/19.
//  Copyright © 2019 Lucas Wotton. All rights reserved.
//

import Foundation
import UIKit
import PMSuperButton

protocol CartCellButtonDelegate {
    func didTapBuyButton(atIndex index: Int)
    func didTapRemoveButton(atIndex index: Int)
}

class CartCellView: UIView {
    let itemImageView = UIImageView()
    let buyButton = PMSuperButton()
    let removeButton = PMSuperButton()
    
    let titleLabel = UILabel()
    let priceLabel = UILabel()
    var cartIndex: Int?
    
    var buttonDelegate: CartCellButtonDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setItemIndex(atIndex index: Int) {
        guard index >= 0 else { fatalError("Negative index passed: \(index)") }
        self.cartIndex = index
        let cartData = CartService.getCartItems()
        let item = cartData[index]
        itemImageView.image = item.image
        titleLabel.text = item.title
        priceLabel.text = "$\(item.price)"
    }
}

private extension CartCellView {
    func setupSubviews() {
        itemImageView.image = UIImage(named: "StylishMan")
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
        buyButton.ripple = true
        buyButton.addTarget(self, action: #selector(CartCellView.buyButtonPressed(_:)), for: .touchUpInside)
        self.addSubview(buyButton)
        
        removeButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        removeButton.titleLabel?.textAlignment = .natural
        removeButton.setTitle("Remove", for: .normal)
        removeButton.setTitleColor(.white, for: .normal)
        removeButton.backgroundColor = UIColor.init(red: 0.61, green: 0.0156, blue: 0.004, alpha: 1.0)
        removeButton.clipsToBounds = true
        removeButton.layer.cornerRadius = 10
        removeButton.ripple = true
        removeButton.addTarget(self, action: #selector(CartCellView.removeButtonPressed(_:)), for: .touchUpInside)
        self.addSubview(removeButton)
        
        titleLabel.textColor = .black
        titleLabel.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        titleLabel.textAlignment = .natural
        titleLabel.text = "Item Title"
        
        priceLabel.textColor = .black
        priceLabel.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        priceLabel.textAlignment = .natural
        priceLabel.text = "Item Price"
        
        self.addSubview(titleLabel)
        self.addSubview(priceLabel)
        
        backgroundColor = UIColor.white
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
        
        removeButton.snp.makeConstraints { make in
            make.leading.equalTo(itemImageView.snp.trailing).offset(20)
            make.bottom.equalToSuperview().offset(-15)
            make.width.equalTo(100)
        }
        
        buyButton.snp.makeConstraints { make in
            make.leading.equalTo(removeButton.snp.trailing).offset(10)
            make.bottom.equalToSuperview().offset(-15)
            make.width.equalTo(100)
        }
    }
}

// Button functions
extension CartCellView {
    @objc func buyButtonPressed(_ sender: UIButton) {
        guard let index = self.cartIndex else { fatalError("Index is not defined") }
        buttonDelegate?.didTapBuyButton(atIndex: index)
    }
    
    @objc func removeButtonPressed(_ sender: UIButton) {
        guard let index = self.cartIndex else { fatalError("Index is not defined") }
        buttonDelegate?.didTapRemoveButton(atIndex: index)
    }
}
