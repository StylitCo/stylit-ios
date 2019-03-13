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
import PMSuperButton
import SCLAlertView

class CartViewController: UIViewController {
    
    private let homeButton = UIButton()
    private let collectionView = CollectionView()
    private let checkoutButton = PMSuperButton()
    private let totalLabel = UILabel()
    private let priceLabel = UILabel()
    
    private let mainLabel = UILabel()
    
    private var arrayDataSource: ArrayDataSource<Int>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
                
        setupSubViews()
        setupLayout()
    }
    
    private func setupSubViews() {
        
        let purple = UIColor(red:0.54, green:0.17, blue:0.89, alpha:1.0)
        
        priceLabel.textColor = purple
        priceLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        priceLabel.textAlignment = .natural
        updatePriceLabel()
        
        totalLabel.textColor = purple
        totalLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        totalLabel.textAlignment = .natural
        totalLabel.text = "Total"
        
        checkoutButton.setTitle("Checkout", for: .normal)
        checkoutButton.setTitleColor(.white, for: .normal)
        checkoutButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        checkoutButton.backgroundColor = purple
        checkoutButton.ripple = true
        checkoutButton.addTarget(self, action: #selector(CartViewController.checkoutButtonTapped(_:)),                             for: .touchUpInside)
       
        
        let homeImage = UIImage(named: "Home")
        
        homeButton.setImage(homeImage, for: .normal)
        homeButton.tintColor = purple
        homeButton.addTarget(self, action: #selector(CartViewController.homeButtonTapped(_:)),                             for: .touchUpInside)
        
        setupCollection()
        
        view.addSubview(homeButton)
        view.addSubview(collectionView)
        view.addSubview(checkoutButton)
        
        
        // top label
        mainLabel.text = "Your Cart"
        mainLabel.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        mainLabel.numberOfLines = 1
        mainLabel.textAlignment = .right
        mainLabel.textColor = purple
        
        view.addSubview(mainLabel)
        view.addSubview(totalLabel)
        view.addSubview(priceLabel)
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
            make.bottom.equalTo(totalLabel.snp.top).offset(-5)
        }
        checkoutButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-20)
            make.bottom.equalToSuperview().offset(-50)
            make.height.equalTo(50)
        }
        mainLabel.snp.makeConstraints { make in
            make.centerY.equalTo(homeButton.snp.centerY)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        totalLabel.snp.makeConstraints { make in
            make.leading.equalTo(homeButton.snp.leading)
            make.bottom.equalTo(checkoutButton.snp.top).offset(-30)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.trailing.equalTo(checkoutButton.snp.trailing)
            make.bottom.equalTo(checkoutButton.snp.top).offset(-30)
        }
    }
    
    private func setupCollection() {
        let cartData = CartService.getCartItems()
        
        var data: [Int] = []
        if !cartData.isEmpty {
            for i in 0..<cartData.count {
                data.append(i)
            }
        }
        
        let dataSource = ArrayDataSource(data: data)
        self.arrayDataSource = dataSource
        let viewSource = ClosureViewSource(viewUpdater: { (view: CartCellView, data: Int, index: Int) in
            view.setItemIndex(atIndex: data)
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
            sizeSource: sizeSource,
            layout: FlowLayout(spacing: 5, justifyContent: .center)
        )
        
        provider.animator = DeleteAnimator()
        
        collectionView.backgroundColor = UIColor.clear
        
        //lastly assign this provider to the collectionView to display the content
        collectionView.provider = provider
    }
    
    private func updatePriceLabel() {
        if (CartService.getCartPrice() < 1000) {
            priceLabel.text = "$\(CartService.getCartPrice()).00"
        } else {
            priceLabel.text = "$\(CartService.getCartPrice()/1000),\(CartService.getCartPrice()%1000).00"
        }
    }
    
    @objc func homeButtonTapped(_ sender: UIButton) {
        // animate transition
        dismiss(animated: true, completion: nil)
    }
    
    @objc func checkoutButtonTapped(_ sender: UIButton) {
        let appearance = SCLAlertView.SCLAppearance(
            showCloseButton: false,
            showCircularIcon: false
        )
        let alertView = SCLAlertView(appearance: appearance)
        
        alertView.addButton("Cancel", backgroundColor: .red) {
            print("cancel button tapped")
        }
        
        alertView.addButton("Purchase", backgroundColor: UIColor(red:0.54, green:0.17, blue:0.89, alpha:1.0)) {
            CartService.clear()
            self.updatePriceLabel()
            self.setupCollection()
        }
        
        alertView.showSuccess("Confirm Checkout", subTitle: "Total: $\(CartService.getCartPrice())")
    }
    
}

extension CartViewController: CartCellButtonDelegate {
    
    func didTapRemoveButton(atIndex index: Int) {
        CartService.removeItemFromCart(atIndex: index)
        let cartData = CartService.getCartItems()
        
        var data: [Int] = []
        if !cartData.isEmpty {
            for i in 0..<cartData.count {
                data.append(i)
            }
        }
        
        updatePriceLabel()
        
        self.arrayDataSource?.data = data
    }
}
