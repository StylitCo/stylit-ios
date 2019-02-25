//
//  ModalViewController.swift
//  Stylit
//
//  Created by Kavi Ramamurthy on 2/24/19.
//  Copyright © 2019 Lucas Wotton. All rights reserved.
//

import UIKit
import Presentr
import SnapKit

class ModalViewController: UIViewController {
    
    var num: Int!
    var label = UILabel()
    
    var nameLabel = UILabel()
    var brandLabel = UILabel()
    var priceLabel = UILabel()
    var detailsLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
//        label.text = "\(num ?? -1)"
//        view.addSubview(label)
//        label.snp.makeConstraints { make in
//            make.centerX.equalToSuperview()
//            make.centerY.equalToSuperview()
//        }
        
        setupSubviews()
        setupLayout()
    }
    
    private func setupSubviews() {
        view.addSubview(nameLabel)
        view.addSubview(brandLabel)
        view.addSubview(priceLabel)
        view.addSubview(detailsLabel)
    }
    
    private func setupLayout() {
        brandLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
            make.top.equalToSuperview().offset(20)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
            make.top.equalTo(brandLabel.snp.bottom)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
            make.top.equalTo(nameLabel.snp.bottom).offset(5)
        }
        
        detailsLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
            make.top.equalTo(priceLabel.snp.bottom).offset(20)
        }
    }
    
    public func setItemName(name: String) {
        nameLabel = UILabel()
        nameLabel.text = name
        nameLabel.font = UIFont.systemFont(ofSize: 40, weight: .semibold)
        nameLabel.textAlignment = .left
    }
    
    public func setItemBrand(brand: String) {
        brandLabel = UILabel()
        brandLabel.text = brand
        brandLabel.font = UIFont.systemFont(ofSize: 18, weight: .light)
        brandLabel.textAlignment = .left
        brandLabel.textColor = UIColor.lightGray
    }
    
    public func setItemPrice(price: String) {
        priceLabel = UILabel()
        priceLabel.text = "$\(price)"
        priceLabel.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        priceLabel.textAlignment = .left
    }
    
    public func setItemDetails(details: String) {
        detailsLabel = UILabel()
        detailsLabel.text = "\(details)"
        detailsLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        detailsLabel.textAlignment = .left
        detailsLabel.numberOfLines = 0
    }
    
}
