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
import CollectionKit

class LikesViewController: UIViewController {
    
    private let homeButton = UIButton()
    private let recommendedButton = UIButton()
    
    private let mainLabel = UILabel()
    
    let collectionView = CollectionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dismiss(animated: true, completion: nil)
        self.hero.isEnabled = true
        view.backgroundColor = UIColor.purple

        setupCollection()
        setupSubViews()
        setupLayout()
        
        recommendedButton.hero.id = "hello"

        
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
        
        view.addSubview(collectionView)
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
        
        collectionView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.bottom.equalToSuperview()
            make.width.equalToSuperview()
            make.leading.equalToSuperview()
        }
    }
    
    private func setupCollection() {
        let dataSource = ArrayDataSource(data: [1, 2, 3, 4,7,8,9,10,11,14])
        let viewSource = ClosureViewSource(viewUpdater: { (view: UILabel, data: Int, index: Int) in
            view.backgroundColor = .red
            view.text = "\(data)"
        })
        let sizeSource = { (index: Int, data: Int, collectionSize: CGSize) -> CGSize in
            return CGSize(width: 50, height: 50)
        }
        let provider = BasicProvider(
            dataSource: dataSource,
            viewSource: viewSource,
            sizeSource: sizeSource
        )
        
        //lastly assign this provider to the collectionView to display the content
        collectionView.provider = provider
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
        vc.hero.modalAnimationType = .fade
        present(vc, animated: true, completion: nil)
    }
}

