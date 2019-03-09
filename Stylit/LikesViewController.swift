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
    
    private let collectionView = CollectionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hero.isEnabled = true
        view.backgroundColor = UIColor.purple

        setupCollection()
        setupSubViews()
        setupLayout()
        
        recommendedButton.hero.id = "hello"
    }
    
    private func setupSubViews() {
        let purple = UIColor(red:0.54, green:0.17, blue:0.89, alpha:1.0)
        let lightPurple = UIColor(red:0.85, green:0.44, blue:0.84, alpha:1.0)
        let homeImage = UIImage(named: "Home")
        homeButton.setImage(homeImage, for: .normal)
        homeButton.tintColor = purple
        homeButton.addTarget(self, action: #selector(LikesViewController.homeButtonTapped(_:)),                             for: .touchUpInside)
        
        let glassImage = UIImage(named: "Star")
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
        mainLabel.textColor = purple
        
        view.addSubview(mainLabel)
        
        view.addSubview(collectionView)
        
        view.backgroundColor = .white
    }
    
    private func setupLayout() {
        homeButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(40)
            make.width.equalTo(40)
        }
        
        recommendedButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin)
            make.leading.equalToSuperview().offset(20)
            make.height.equalTo(40)
            make.width.equalTo(40)
        }
        
        mainLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(homeButton.snp.centerY)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(recommendedButton.snp.bottom).offset(40)
            make.bottom.equalToSuperview()
            make.width.equalToSuperview()
            make.leading.equalToSuperview()
        }
    }
    
    // this could return a random image maybe
    private func cellImage() -> UIImageView {
        let image = UIImage(named: "StylishMan")
        let imageView = UIImageView(image: image)
        
        return imageView
    }
    
    private func setupCollection() {
        var likesData = LikesService.getLikedImages()
        
        var data: [Int] = []
        if !likesData.isEmpty {
            for i in 0..<likesData.count {
                data.append(i)
            }
        }
        
        let dataSource = ArrayDataSource(data: data)
        let viewSource = ClosureViewSource(viewUpdater: { (view: UIView, data: Int, index: Int) in
            let imageView = UIImageView(image: likesData[data])
            imageView.frame = CGRect(x: 0, y: 0, width: 150, height: 300)
            imageView.layer.masksToBounds = true
            imageView.layer.cornerRadius = 25
            view.addSubview(imageView)
            view.backgroundColor = .white
            view.layer.cornerRadius = 25
            
            view.layer.shadowPath =
                UIBezierPath(roundedRect: view.bounds,
                             cornerRadius: view.layer.cornerRadius).cgPath
            view.layer.shadowColor = UIColor.black.cgColor
            view.layer.shadowOpacity = 0.5
            view.layer.shadowOffset = CGSize(width: 2, height: 2)
            view.layer.shadowRadius = 1
            view.layer.masksToBounds = false
        })
        let sizeSource = { (index: Int, data: Int, collectionSize: CGSize) -> CGSize in
            return CGSize(width: 150, height: 300)
        }
        let provider = BasicProvider(
            dataSource: dataSource,
            viewSource: viewSource,
            sizeSource: sizeSource
        )
        
        provider.layout = FlowLayout(spacing: 25, justifyContent: .center)
        provider.animator = WobbleAnimator()
        
        collectionView.backgroundColor = UIColor.clear
        
        //lastly assign this provider to the collectionView to display the content
        collectionView.provider = provider
    }
    
    @objc func homeButtonTapped(_ sender: UIButton) {
        // animate transition
        let vc = HomeViewController()
        vc.hero.isEnabled = true
        vc.hero.modalAnimationType = .slide(direction: .left)
        dismiss(animated: true, completion: nil)
    }
    
    @objc func recommendedButtonTapped(_ sender: UIButton) {
        // animate transition
        let vc = RecommendedViewController()
        vc.hero.isEnabled = true
        vc.hero.modalAnimationType = .fade
        present(vc, animated: true, completion: nil)
    }
}

