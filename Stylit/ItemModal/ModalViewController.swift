//
//  ModalViewController.swift
//  Stylit
//
//  Created by Kavi Ramamurthy on 2/24/19.
//  Copyright © 2019 Lucas Wotton. All rights reserved.
//

import UIKit
import SnapKit
import PMSuperButton

class ItemModalViewController: UIViewController {
    
    private let pulldownButton = PMSuperButton()
    
    let itemImageView = UIImageView()
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
        pulldownButton.setImage(UIImage(named: "down-arrow"), for: .normal)
        pulldownButton.tintColor = .purple
        pulldownButton.animatedScaleWhenHighlighted = 1.2
        pulldownButton.addTarget(self, action: #selector(ItemModalViewController.pulldownButtonTapped(_:)),                             for: .touchUpInside)

        itemImageView.contentMode = .scaleAspectFit
        
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
        
        contentView.addSubview(itemImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(brandLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(detailsLabel)
        
        scrollView.addSubview(contentView)
        
        view.backgroundColor = .white
        view.addSubview(pulldownButton)
        view.addSubview(separatorView)
        view.addSubview(scrollView)
    }
    
    private func setupLayout() {
        pulldownButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin).offset(10)
            make.centerX.equalToSuperview()
            make.width.equalTo(80)
            make.height.equalTo(80)
        }
        
        separatorView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-15)
            make.top.equalTo(pulldownButton.snp.bottom)
            make.height.equalTo(1)
        }
        
        itemImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalToSuperview()
            make.height.equalTo(400)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
            make.top.equalTo(itemImageView.snp.bottom).offset(10)
        }
        
        brandLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
            make.top.equalTo(nameLabel.snp.bottom).offset(5)
        }

        priceLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
            make.top.equalTo(brandLabel.snp.bottom).offset(5)
        }
        
        detailsLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
            make.top.equalTo(priceLabel.snp.bottom).offset(20)
            make.bottom.equalToSuperview().offset(-10)
        }
        
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalTo(view.snp.width)
        }
        
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(separatorView.snp.bottom).offset(10)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-10)
        }
    }
    
    
    public func setItem(item: Item) {
        itemImageView.image = item.image
        nameLabel.text = item.title
        brandLabel.text = item.brand
        priceLabel.text = "$\(item.price)"
        detailsLabel.text = item.description
    }
    
}

extension ItemModalViewController {
    @objc func pulldownButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
