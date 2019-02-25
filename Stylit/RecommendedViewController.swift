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
    
    let collectionView = CollectionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hero.isEnabled = true
        view.backgroundColor = UIColor.blue
        
        setupSubViews()
        setupLayout()
        
        likesButton.hero.id = "hello"
    }
    
    // this could return a random image maybe
    private func cellImage() -> UIImageView {
        let image = UIImage(named: "StylishMan")
        let imageView = UIImageView(image: image)
        
        return imageView
    }
    
    private func setupCollection() {
        var data: [Int] = []
        for i in 1...50 {
            data.append(i)
        }
        
        let dataSource = ArrayDataSource(data: data)
        let viewSource = ClosureViewSource(viewUpdater: { (view: UIView, data: Int, index: Int) in
            let imageView = self.cellImage()
            imageView.frame = CGRect(x: 0, y: 0, width: 150, height: 300)
            imageView.layer.masksToBounds = true
            imageView.layer.cornerRadius = 25
            view.addSubview(imageView)
            view.bringSubviewToFront(imageView)
            view.backgroundColor = .white
            view.layer.masksToBounds = true
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
        
        view.addSubview(collectionView)
        
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
        
        collectionView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.bottom.equalToSuperview()
            make.width.equalToSuperview()
            make.leading.equalToSuperview()
        }
    }
    
    @objc func homeButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func likesButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
