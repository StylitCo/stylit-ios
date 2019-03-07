//
//  FeedViewController.swift
//  Stylit
//
//  Created by Lucas Wotton on 2/18/19.
//  Copyright © 2019 Lucas Wotton. All rights reserved.
//

import UIKit
import SnapKit
import Koloda
import Hero
import Presentr
import PMSuperButton
import PKHUD

private var numberOfCards: Int = 5

class HomeViewController: UIViewController {
    
    // logo
    
    private let logoView = UIImageView()
    
    // labels
    
    private let stylitLabel = UILabel()
    private let separatorView = UIView()
    private let headerView = UIView()
    
    // card stack
    
    private let kolodaView = KolodaView()
    
    // buttons
    
    private let buttonView = UIView()
    private let dislikeButton = PMSuperButton()
    private let likeButton = PMSuperButton()
    private let addToCartButton = PMSuperButton()
    
    // navigation
    private let cartButton = UIButton()
    private let feedButton = UIButton()
    
    // card view
    private let cardView = UIView()
    
    // categories
    private let categoriesMenuTab = UIButton()
    
    private var dataSource: [Item] = {
        var array: [Item] = []
        for index in 1...10 {
            array.append(Item(image: UIImage(named: "shoes\(index)")!, title: "Shoe", description: "Some fresh shoes", brand: "Balenciaga", price: 100, tags: ["shoe", "fresh"]))
            array.append(Item(image: UIImage(named: "shirt\(index)")!, title: "Shirt", description: "A fresh shirt", brand: "Bape", price: 100, tags: ["shirt", "fresh"]))
            array.append(Item(image: UIImage(named: "pant\(index)")!, title: "Pants", description: "Some fresh pants", brand: "Supreme", price: 100, tags: ["pant", "fresh"]))
        }
        
        return array
    }()
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        FilterService.addItem(items: dataSource)
        
        kolodaView.delegate = self
        self.modalTransitionStyle = UIModalTransitionStyle.flipHorizontal
        setupSubviews()
        setupLayout()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        dataSource = FilterService.getItems()
        kolodaView.dataSource = self
    }
}

// MARK: Setup subviews
extension HomeViewController {
    private func setupSubviews() {
        let purple = UIColor(red:0.54, green:0.17, blue:0.89, alpha:1.0)
        let gray = UIColor(red:0.71, green:0.75, blue:0.94, alpha:1.0)
        let lightPurple = UIColor(red:0.85, green:0.44, blue:0.84, alpha:1.0)
        let lightGray = UIColor(red:0.66, green:0.66, blue:0.66, alpha:0.1)
        // set up logo
        logoView.image = UIImage(named: "StylitAppIcon")
        logoView.tintColor = purple
        logoView.contentMode = UIView.ContentMode.scaleAspectFit
        
        view.addSubview(logoView)
        
        stylitLabel.text = "Stylit"
        stylitLabel.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        stylitLabel.numberOfLines = 1
        stylitLabel.textAlignment = .center
        headerView.addSubview(stylitLabel)
        
        separatorView.backgroundColor = .lightGray
        headerView.addSubview(separatorView)
        
        view.addSubview(headerView)
        
        let likeImage = UIImage(named: "tinder-heart")
        likeButton.setImage(likeImage, for: .normal)
        likeButton.imageEdgeInsets = UIEdgeInsets(top: 21, left: 10, bottom: 20, right: 10)
        likeButton.ripple = true
        likeButton.tintColor = UIColor(red:0.87, green:0.63, blue:0.87, alpha:1.0)
        likeButton.cornerRadius = 41
        likeButton.animatedScaleWhenHighlighted = 1.2
        likeButton.animatedScaleWhenSelected = 1.2
        likeButton.borderColor = lightGray
        likeButton.borderWidth = 10
        likeButton.gradientEnabled = true
        likeButton.gradientHorizontal = true
        likeButton.gradientStartColor = UIColor.white
        likeButton.gradientEndColor = UIColor.white
        likeButton.addTarget(self, action: #selector(HomeViewController.likeButtonTapped(_:)), for: .touchUpInside)
        
        let dislikeImage = UIImage(named: "tinder-x")
        dislikeButton.setImage(dislikeImage, for: .normal)
        dislikeButton.backgroundColor = .white
        dislikeButton.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        let skyBlue = UIColor(red:0.00, green:0.75, blue:1.00, alpha:1.0)
        dislikeButton.tintColor = skyBlue
        dislikeButton.ripple = true
        dislikeButton.cornerRadius = 41
        dislikeButton.borderColor = lightGray
        dislikeButton.borderWidth = 10
        dislikeButton.animatedScaleWhenHighlighted = 1.2
        dislikeButton.animatedScaleWhenSelected = 1.2
        dislikeButton.gradientEnabled = true
        dislikeButton.gradientHorizontal = true
        dislikeButton.addTarget(self, action: #selector(HomeViewController.dislikeButtonTapped(_:)), for: .touchUpInside)
        
        
        let addToCartImage = UIImage(named: "superlike")
        addToCartButton.setImage(addToCartImage, for: .normal)
        addToCartButton.imageEdgeInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        addToCartButton.tintColor = gray
        addToCartButton.ripple = true
        addToCartButton.cornerRadius = 41
        addToCartButton.animatedScaleWhenHighlighted = 1.2
        addToCartButton.animatedScaleWhenSelected = 1.2
        addToCartButton.borderColor = lightGray
        addToCartButton.borderWidth = 10
        addToCartButton.gradientEnabled = true
        addToCartButton.gradientHorizontal = true
        addToCartButton.gradientStartColor = UIColor.white
        addToCartButton.gradientEndColor = UIColor.white
        addToCartButton.addTarget(self, action: #selector(HomeViewController.addToCartButtonTapped(_:)), for: .touchUpInside)
        
        let cartImage = UIImage(named: "Cart")
        cartButton.setImage(cartImage, for: .normal)
        cartButton.tintColor = purple
        cartButton.addTarget(self, action: #selector(HomeViewController.cartButtonTapped(_:)),                             for: .touchUpInside)
        
        let feedImage = UIImage(named: "Grid")
        feedButton.setImage(feedImage, for: .normal)
        feedButton.tintColor = purple
        feedButton.addTarget(self, action: #selector(HomeViewController.feedButtonTapped(_:)),                             for: .touchUpInside)

        view.addSubview(kolodaView)
        view.addSubview(dislikeButton)
        view.addSubview(likeButton)
        view.addSubview(addToCartButton)
        view.addSubview(cartButton)
        view.addSubview(feedButton)
        
        // set up categories tab
        categoriesMenuTab.setImage(UIImage(named: "down-arrow"), for: .normal)
        categoriesMenuTab.tintColor = purple
        categoriesMenuTab.addTarget(self, action: #selector(HomeViewController.filterButtonTapped(_:)),                             for: .touchUpInside)
        
        view.addSubview(categoriesMenuTab)

        // set up gradient background
        view.backgroundColor = .white
    }
    
    private func setupLayout() {
        logoView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin)
            make.centerX.equalToSuperview().offset(1)
            make.height.equalTo(45)
        }
        
        cartButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(40)
            make.width.equalTo(40)
        }
        
        feedButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin)
            make.leading.equalToSuperview().offset(20)
            make.height.equalTo(40)
            make.width.equalTo(40)
        }
        
        categoriesMenuTab.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin).offset(40)
            make.centerX.equalToSuperview()
            make.width.equalTo(30)
            make.height.equalTo(30)
        }
        
        kolodaView.snp.makeConstraints { make in
            make.top.equalTo(feedButton.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
        }
        
        dislikeButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview().offset(-120)
            make.top.equalTo(kolodaView.snp.bottom).offset(50)
            make.height.equalTo(80)
            make.width.equalTo(80)
            make.bottom.equalToSuperview().offset(-50)
        }

        likeButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview().offset(120)
            make.top.equalTo(kolodaView.snp.bottom).offset(50)
            make.height.equalTo(80)
            make.width.equalTo(80)
            make.bottom.equalToSuperview().offset(-50)
        }
        
        addToCartButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(kolodaView.snp.bottom).offset(50)
            make.height.equalTo(80)
            make.width.equalTo(80)
            make.bottom.equalToSuperview().offset(-50)
        }
    }
}

// Koloda view delegate
extension HomeViewController: KolodaViewDelegate {
    func kolodaDidRunOutOfCards(_ koloda: KolodaView) {
        let position = kolodaView.currentCardIndex
        for _ in 1...4 {
            dataSource.append(Item(image: UIImage(named: "StylishMan")!, title: "Stylish Man", description: "A Stylish Man", brand: "Palace", price: 100, tags: ["man", "stylish"]))
        }
        kolodaView.insertCardAtIndexRange(position..<position + 4, animated: true)
    }
    
    func koloda(_ koloda: KolodaView, didSelectCardAt index: Int) {
        print("selected!")

        let presenter: Presentr = Util.getPresentr()
        let controller = ModalViewController()
        let item = dataSource[index]
        controller.num = index
        
        controller.setItem(item: item)
        
        customPresentViewController(presenter, viewController: controller, animated: true, completion: nil)
    }
}

// Koloda datasource delegate
extension HomeViewController: KolodaViewDataSource {
    
    func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {
        let imageView = UIImageView(image: dataSource[Int(index)].image)
        imageView.backgroundColor = .white
        imageView.layer.cornerRadius = 8.0
        imageView.clipsToBounds = true
        // TODO: Add shadows?
        
        return imageView
    }
    
    func kolodaSpeedThatCardShouldDrag(_ koloda: KolodaView) -> DragSpeed {
        return .default
    }
    
    func kolodaNumberOfCards(_ koloda: KolodaView) -> Int {
        return dataSource.count
    }
    
    func koloda(_ koloda: KolodaView, didSwipeCardAt index: Int, in direction: SwipeResultDirection) {
        let swipedItem = dataSource[index]
        if direction == .left {
            LikesService.dislikeItem(dislikedItem: swipedItem)
        } else if direction == .right {
            LikesService.likeItem(likedItem: swipedItem)
        } else {
            fatalError("Unexpected direction: \(direction)")
        }
    }
}

// button functions
extension HomeViewController {
    @objc func likeButtonTapped(_ sender: UIButton) {
        kolodaView.swipe(.right)
    }
    
    @objc func dislikeButtonTapped(_ sender: UIButton) {
        kolodaView.swipe(.left)
    }
    
    @objc func addToCartButtonTapped(_ sender: UIButton) {
        let item = dataSource[kolodaView.currentCardIndex]
        if CartService.addImageToCart(item: item) {
            HUD.flash(.label("Added to Cart"), delay: 0.2)
        } else {
            HUD.flash(.label("Item Already in Cart"), delay: 0.2)
        }
    }
    
    @objc func cartButtonTapped(_ sender: UIButton) {
        // animate transition
        let vc = CartViewController()
        vc.hero.isEnabled = true
        vc.hero.modalAnimationType = .selectBy(presenting:.slide(direction: .left), dismissing:.slide(direction: .right))
        present(vc, animated: true, completion: nil)
    }
    
    @objc func feedButtonTapped(_ sender: UIButton) {
        // animate transition
        let vc = LikesViewController()
        vc.hero.isEnabled = true
        vc.hero.modalAnimationType = .selectBy(presenting:.slide(direction: .right), dismissing:.slide(direction: .left))
        present(vc, animated: true, completion: nil)
    }
    
    @objc func filterButtonTapped(_ sender: UIButton) {
        let presenter: Presentr = Util.getPresentr2()
        let controller = FilterViewController()
        
        customPresentViewController(presenter, viewController: controller, animated: true, completion: nil)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
