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
    func didTapRemoveButton(atIndex index: Int)
}

class CartCellView: UIView {
    let itemImageView = UIImageView()
    let removeButton = PMSuperButton()
    private let separator = UIView()
    
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
        let lightGray = UIColor(red:0.66, green:0.66, blue:0.66, alpha:0.1)
        let darkGray = UIColor(red:0.50, green:0.50, blue:0.50, alpha:1.0)
        itemImageView.image = UIImage(named: "StylishMan")
        itemImageView.layer.masksToBounds = true
        itemImageView.layer.cornerRadius = 25
        self.addSubview(itemImageView)
        
        let removeImage = UIImage(named: "trash")
        
        
        removeButton.setImage(removeImage, for: .normal)
        removeButton.tintColor = darkGray
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
        
        separator.backgroundColor = darkGray
        self.addSubview(separator)
        
        self.addSubview(titleLabel)
        self.addSubview(priceLabel)
        
        backgroundColor = .white
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 12)
        layer.shadowRadius = 10
        layer.shadowOpacity = 0.1
    }
    
    func setupLayout() {
        itemImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(15)
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
            make.trailing.equalToSuperview().offset(-15)
            make.top.equalTo(titleLabel.snp.top)
            make.width.equalTo(25)
            make.height.equalTo(23)
        }
        
        separator.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-20)
            make.bottom.equalToSuperview()
            make.height.equalTo(2)
        }
        
    }
}

// Button functions
extension CartCellView {
    
    @objc func removeButtonPressed(_ sender: UIButton) {
        guard let index = self.cartIndex else { fatalError("Index is not defined") }
        buttonDelegate?.didTapRemoveButton(atIndex: index)
    }
}
