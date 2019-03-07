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
    
    private var arrayDataSource: ArrayDataSource<Int>?
    
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
        
        let homeImage = UIImage(named: "Home")
        homeButton.setImage(homeImage, for: .normal)
        homeButton.tintColor = .white
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
        let likesData = LikesService.getLikedItems()
        
        var data: [Int] = []
        if !likesData.isEmpty {
            for i in 0..<likesData.count {
                data.append(i)
            }
        }
        
        let dataSource = ArrayDataSource(data: data)
        self.arrayDataSource = dataSource
        let viewSource = ClosureViewSource(viewUpdater: { (view: LikeCellView, data: Int, index: Int) in
            view.setImageIndex(atIndex: data)
            view.buttonDelegate = self
            view.layer.cornerRadius = 10.0
            view.clipsToBounds = true
        })
        let sizeSource = { (index: Int, data: Int, collectionSize: CGSize) -> CGSize in
            return CGSize(width: self.view.frame.width - 20, height: 150)
        }
        let provider = BasicProvider(
            dataSource: dataSource,
            viewSource: viewSource,
            sizeSource: sizeSource
        )
        
        provider.layout = FlowLayout(spacing: 5, justifyContent: .center)
        provider.animator = DeleteAnimator()
        
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

extension LikesViewController: CartCellButtonDelegate {
    func didTapBuyButton(atIndex index: Int) {
        print("Currently doing nothing.")
    }
    
    func didTapRemoveButton(atIndex index: Int) {
        LikesService.removeItemFromLikes(atIndex: index)
        let likesData = LikesService.getLikedItems()
        
        var data: [Int] = []
        if !likesData.isEmpty {
            for i in 0..<likesData.count {
                data.append(i)
            }
        }
        
        self.arrayDataSource?.data = data
    }
}
