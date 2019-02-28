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

class CartViewController: UIViewController {
    
    private let homeButton = UIButton()
    private let collectionView = CollectionView()
    
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
        homeButton.addTarget(self, action: #selector(CartViewController.homeButtonTapped(_:)),                             for: .touchUpInside)
        
        setupCollection()
        
        view.addSubview(homeButton)
        view.addSubview(collectionView)
    }
    
    private func setupLayout() {
        homeButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin)
            make.leading.equalToSuperview().offset(20)
            make.height.equalTo(40)
            make.width.equalTo(40)
        }
        
        collectionView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalTo(homeButton.snp.bottom).offset(30)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
    
    private func setupCollection() {
        var cartData = CartService.getCartImages()
        
        var data: [Int] = []
        if !cartData.isEmpty {
            for i in 0..<cartData.count {
                data.append(i)
            }
        }
        
        let dataSource = ArrayDataSource(data: data)
        let width = self.view.frame.width - 20
        let viewSource = ClosureViewSource(viewUpdater: { (view: CartCellView, data: Int, index: Int) in
            view.setImageIndex(i: data)
            // TODO: Do something with data
            print("data: \(data)")
        })
        let sizeSource = { (index: Int, data: Int, collectionSize: CGSize) -> CGSize in
            return CGSize(width: width
                , height: 150)
        }
        let provider = BasicProvider(
            dataSource: dataSource,
            viewSource: viewSource,
            sizeSource: sizeSource,
            layout: FlowLayout(spacing: 25, justifyContent: .center)
        )
        
        provider.animator = WobbleAnimator()
        
        collectionView.backgroundColor = UIColor.clear
        
        //lastly assign this provider to the collectionView to display the content
        collectionView.provider = provider
    }

    
    @objc func homeButtonTapped(_ sender: UIButton) {
        // animate transition
        dismiss(animated: true, completion: nil)
    }
}
