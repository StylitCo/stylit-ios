//
//  RecommendedViewController.swift
//  Stylit
//
//  Created by Kavi Ramamurthy on 2/22/19.
//  Copyright © 2019 Lucas Wotton. All rights reserved.
//

import UIKit
import Hero
import SnapKit

class RecommendedViewController: UIViewController {
    
    private let homeButton = UIButton()
    private let likesButton = UIButton()
    
    private let mainLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dismiss(animated: true, completion: nil)
        self.hero.isEnabled = true
        view.backgroundColor = UIColor.blue
        
        setupSubViews()
        setupLayout()
        
        likesButton.hero.id = "hello"
    }
    
    private func setupSubViews() {
        
        let homeImage = UIImage(named: "Home")
        homeButton.setImage(homeImage, for: .normal)
        homeButton.tintColor = .white
        homeButton.addTarget(self, action: #selector(LikesViewController.homeButtonTapped(_:)),                             for: .touchUpInside)
        
        let heartImage = UIImage(named: "heart")
        likesButton.setImage(heartImage, for: .normal)
        likesButton.tintColor = .white
        likesButton.addTarget(self, action: #selector(RecommendedViewController.likesButtonTapped(_:)),                             for: .touchUpInside)
        
        view.addSubview(homeButton)
        view.addSubview(likesButton)
        
        // top label
        mainLabel.text = "For You"
        mainLabel.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        mainLabel.numberOfLines = 1
        mainLabel.textAlignment = .left
        mainLabel.textColor = UIColor.white
        
        view.addSubview(mainLabel)
    }
    
    private func setupLayout() {
        homeButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(50)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(40)
            make.width.equalTo(40)
        }
        
        likesButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(50)
            //            make.leading.equalToSuperview().offset(20)
            make.trailing.equalTo(homeButton.snp.leading).offset(-10)
            make.height.equalTo(40)
            make.width.equalTo(40)
        }
        
        mainLabel.snp.makeConstraints { make in
            //            make.centerX.equalToSuperview()
            make.centerY.equalTo(homeButton.snp.centerY)
            make.leading.equalToSuperview().offset(20)
        }
    }
    
    @objc func homeButtonTapped(_ sender: UIButton) {
        // animate transition
        let vc = HomeViewController()
        vc.hero.isEnabled = true
        vc.hero.modalAnimationType = .uncover(direction: .left)
        present(vc, animated: true, completion: nil)
    }
    
    @objc func likesButtonTapped(_ sender: UIButton) {
        // animate transition
        let vc = LikesViewController()
        vc.hero.isEnabled = true
        vc.hero.modalAnimationType = .fade
        present(vc, animated: true, completion: nil)
    }
}
