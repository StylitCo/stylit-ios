//
//  LikesViewController.swift
//  Stylit
//
//  Created by Kavi Ramamurthy on 2/20/19.
//  Copyright © 2019 Lucas Wotton. All rights reserved.
//

import UIKit
import SnapKit
import Hero

class LikesViewController: UIViewController {
    
    private let homeButton = UIButton()
    private let recommendedButton = UIButton()
    
    private let mainLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.purple
        
        setupSubViews()
        setupLayout()
    }
    
    private func setupSubViews() {
        
        let homeImage = UIImage(named: "Home")
        homeButton.setImage(homeImage, for: .normal)
        homeButton.tintColor = .white
        homeButton.addTarget(self, action: #selector(LikesViewController.homeButtonTapped(_:)),                             for: .touchUpInside)
        
        let glassImage = UIImage(named: "magnifying_glass")
        recommendedButton.setImage(glassImage, for: .normal)
        recommendedButton.tintColor = .white
        recommendedButton.addTarget(self, action: #selector(LikesViewController.recommendedButtonTapped(_:)),                             for: .touchUpInside)

        view.addSubview(homeButton)
        view.addSubview(recommendedButton)
        
        // top label
        mainLabel.text = "Likes"
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
        
        recommendedButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(50)
            make.leading.equalToSuperview().offset(20)
            make.height.equalTo(40)
            make.width.equalTo(40)
        }
        
        mainLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(homeButton.snp.centerY)
        }
    }
    
    @objc func homeButtonTapped(_ sender: UIButton) {
        // animate transition
        let vc = HomeViewController()
        vc.hero.isEnabled = true
        vc.hero.modalAnimationType = .uncover(direction: .left)
        present(vc, animated: true, completion: nil)
    }
    
    @objc func recommendedButtonTapped(_ sender: UIButton) {
        // animate transition
        let vc = RecommendedViewController()
        vc.hero.isEnabled = true
        vc.hero.modalAnimationType = .zoom
        present(vc, animated: true, completion: nil)
    }
}

class RecommendedViewController: UIViewController {
    
    private let homeButton = UIButton()
    private let likesButton = UIButton()
    
    private let mainLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.blue
        
        setupSubViews()
        setupLayout()
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
            make.leading.equalToSuperview().offset(20)
            make.height.equalTo(40)
            make.width.equalTo(40)
        }
        
        mainLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(homeButton.snp.centerY)
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
        vc.hero.modalAnimationType = .zoom
        present(vc, animated: true, completion: nil)
    }
}
