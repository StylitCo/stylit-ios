//
//  FilterViewController.swift
//  Stylit
//
//  Created by Kavi Ramamurthy on 3/6/19.
//  Copyright © 2019 Lucas Wotton. All rights reserved.
//

import Foundation
import UIKit
import DynamicButton

class FilterViewController: UIViewController {
    
    private let shirtsLabel = UILabel()
    let db = DynamicButton()
    
    let backButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupSubviews()
        setupLayout()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    func setupSubviews() {
        shirtsLabel.text = "Shirts"
        shirtsLabel.backgroundColor = .white
        shirtsLabel.textAlignment = .center
        view.addSubview(shirtsLabel)
        
        db.lineWidth = 3
        db.strokeColor = .black
        db.highlightStokeColor = .gray
        
        db.addTarget(self, action: #selector(FilterViewController.shirtsButtonTapped(_:)),                             for: .touchUpInside)
        
        view.addSubview(db)
        
        // set up back button
        backButton.setImage(UIImage(named: "down-arrow"), for: .normal)
        backButton.tintColor = .purple
        backButton.addTarget(self, action: #selector(FilterViewController.backButtonTapped(_:)),                             for: .touchUpInside)
        
        view.addSubview(backButton)
    }
    
    func setupLayout() {
        shirtsLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalTo(50)
            make.width.equalToSuperview()
        }
        
        db.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalTo(50)
            make.width.equalTo(50)
        }
        
        backButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin).offset(40)
            make.centerX.equalToSuperview()
            make.width.equalTo(30)
            make.height.equalTo(30)
        }
    }
    
    @objc func shirtsButtonTapped(_ sender: UIButton) {
        if FilterService.getTags().contains("shirts") {
            FilterService.deleteTag(item: "shirt")
            db.setStyle(.close, animated: true)
        } else {
            FilterService.addTag(item: "shirt")
            db.setStyle(.checkMark, animated: true)
        }
    }
    
    @objc func backButtonTapped(_ sender: UIButton) {
        let vc = HomeViewController()
        vc.hero.isEnabled = true
        vc.hero.modalAnimationType = .slide(direction: .left)
        dismiss(animated: true, completion: nil)
    }
}
