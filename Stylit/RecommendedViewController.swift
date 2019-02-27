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
import CollectionKit

class RecommendedViewController: UIViewController {
    
    private let homeButton = UIButton()
    private let likesButton = UIButton()
    
    private let mainLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hero.isEnabled = true
        view.backgroundColor = UIColor.blue
        
        setupBlurb()
        setupSubViews()
        setupLayout()
        
        likesButton.hero.id = "hello"
    }
    
    private func setupBlurb() {
        let topLabel = UILabel()
        topLabel.text = "Recommendations"
        topLabel.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        topLabel.textColor = .darkGray
        topLabel.textAlignment = .center
        
        let midLabel = UILabel()
        midLabel.text = "See clothes and styles \npersonalized to your tastes."
        midLabel.numberOfLines = 2
        midLabel.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        midLabel.textColor = .darkGray
        midLabel.textAlignment = .center
        
        let botLabel = UILabel()
        botLabel.text = "Coming Soon!"
        botLabel.font = UIFont.systemFont(ofSize: 30, weight: .semibold)
        botLabel.textColor = .darkGray
        botLabel.textAlignment = .center
        
        view.addSubview(topLabel)
        view.addSubview(midLabel)
        view.addSubview(botLabel)
        
        topLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(midLabel.snp.top).offset(-10)
        }
        
        midLabel.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        botLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(midLabel.snp.bottom).offset(10)
        }
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
        
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [UIColor.purple.cgColor, UIColor.white.cgColor]
        view.layer.insertSublayer(gradient, at: 0)
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
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    @objc func likesButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
