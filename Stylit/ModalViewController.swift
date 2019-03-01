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
    
    private let pulldownImage = UIImageView()
    private let separatorView = UIView()

    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private let nameLabel = UILabel()
    private let brandLabel = UILabel()
    private let priceLabel = UILabel()
    private let detailsLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSubviews()
        setupLayout()
    }
    
    private func setupSubviews() {
        pulldownImage.image = UIImage(named: "Pulldown")
        pulldownImage.backgroundColor = .white
        
        separatorView.backgroundColor = UIColor.purple
        
        brandLabel.font = UIFont.systemFont(ofSize: 18, weight: .light)
        brandLabel.textAlignment = .left
        brandLabel.textColor = UIColor.lightGray
        
        detailsLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        detailsLabel.textAlignment = .left
        detailsLabel.numberOfLines = 0
        
        priceLabel.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        priceLabel.textAlignment = .left
        
        nameLabel.font = UIFont.systemFont(ofSize: 40, weight: .semibold)
        nameLabel.textAlignment = .left
        
        contentView.addSubview(nameLabel)
        contentView.addSubview(brandLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(detailsLabel)
        
        scrollView.addSubview(contentView)
        
        view.backgroundColor = .white
        view.clipsToBounds = true
        view.layer.cornerRadius = 50
        view.addSubview(pulldownImage)
        view.addSubview(separatorView)
        view.addSubview(scrollView)
    }
    
    private func setupLayout() {
        pulldownImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(15)
            make.centerX.equalToSuperview()
            make.width.equalTo(40)
            make.height.equalTo(40)
        }
        
        separatorView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-15)
            make.top.equalTo(pulldownImage.snp.bottom).offset(10)
            
            make.height.equalTo(1)
        }
        
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
            make.bottom.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalTo(view.snp.width)
        }
        
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(separatorView.snp.bottom)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-10)
        }
    }
    
    
    public func setItem(item: Item) {
        nameLabel.text = item.title
        brandLabel.text = item.brand
        priceLabel.text = "$\(item.price)"
        detailsLabel.text = item.description
    }
    
}
