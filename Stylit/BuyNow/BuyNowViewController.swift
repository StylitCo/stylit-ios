//
//  BuyNowViewController.swift
//  Stylit
//
//  Created by Saketh Nimmagadda on 3/10/19.
//  Copyright © 2019 Lucas Wotton. All rights reserved.
//

import UIKit
import SnapKit
import Hero
import CollectionKit

class BuyNowViewController: UIViewController {
    private let backButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        setupSubViews()
        setupLayout()
    }
    
    private func setupSubViews() {
        let backImage = UIImage(named: "back")
        let purple = UIColor(red:0.54, green:0.17, blue:0.89, alpha:1.0)
        backButton.setImage(backImage, for: .normal)
        backButton.tintColor = purple
        backButton.addTarget(self, action: #selector(BuyNowViewController.backButtonTapped(_:)), for: .touchUpInside)
        
        view.addSubview(backButton)
    }
    
    private func setupLayout() {
        backButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin)
            make.leading.equalToSuperview().offset(20)
            make.height.equalTo(50)
            make.width.equalTo(100)
        }
        
    }
    
    @objc func backButtonTapped(_ sender: UIButton) {
        // animate transition
        dismiss(animated: true, completion: nil)
    }
}
