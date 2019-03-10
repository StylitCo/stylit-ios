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
    
    private var dataSource: [Item] = []
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = FilterService.getItems()
        kolodaView.dataSource = self
        kolodaView.delegate = self
        self.modalTransitionStyle = UIModalTransitionStyle.flipHorizontal
        setupSubviews()
        setupLayout()
    }
}

// MARK: Setup subviews
extension HomeViewController {
    private func setupSubviews() {
        let purple = UIColor(red:0.54, green:0.17, blue:0.89, alpha:1.0)
        let gray = UIColor(red:0.71, green:0.75, blue:0.94, alpha:1.0)
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
        dislikeButton.addTarget(self, action: #selector(HomeViewController.dislikeButtonTapped(_:)), for: .touchUpInside)
        
        
        let addToCartImage = UIImage(named: "addtocart-new")
        addToCartButton.setImage(addToCartImage, for: .normal)
        addToCartButton.imageEdgeInsets = UIEdgeInsets(top: 25, left: 25, bottom: 25, right: 25)
        addToCartButton.tintColor = gray
        addToCartButton.ripple = true
        addToCartButton.cornerRadius = 41
        addToCartButton.animatedScaleWhenHighlighted = 1.2
        addToCartButton.animatedScaleWhenSelected = 1.2
        addToCartButton.borderColor = lightGray
        addToCartButton.borderWidth = 10
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
        FilterService.refreshItems()
        dataSource = FilterService.getItems()
        kolodaView.resetCurrentCardIndex()
    }
    
    func koloda(_ koloda: KolodaView, didSelectCardAt index: Int) {
        let itemModalViewController = ItemModalViewController()
        let item = dataSource[index]
        itemModalViewController.setItem(item: item)
        itemModalViewController.hero.isEnabled = true
        itemModalViewController.hero.modalAnimationType = .selectBy(presenting:.slide(direction: .up), dismissing:.slide(direction: .down))
        present(itemModalViewController, animated: true, completion: nil)
    }
    
    func koloda(_ koloda: KolodaView, allowedDirectionsForIndex index: Int) -> [SwipeResultDirection] {
        return [.left, .right, .up]
    }
    
    func koloda(_ koloda: KolodaView, viewForCardOverlayAt index: Int) -> OverlayView? {
        let cardOverlayView = CardOverlayView()
        return cardOverlayView
    }
    
    func kolodaShouldTransparentizeNextCard(_ koloda: KolodaView) -> Bool {
        return false
    }
}

// Koloda datasource delegate
extension HomeViewController: KolodaViewDataSource {
    
    func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {
        let item = dataSource[index]
        let card = CardView()
        card.updateCard(with: item)
        return card
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
            FilterService.dislikeItem(swipedItem: swipedItem)
        } else if direction == .right {
            FilterService.likeItem(swipedItem: swipedItem)
        } else if direction == .up {
            CartService.addItemToCart(item: swipedItem)
        } else {
            print("Unexpected direction: \(direction)")
        }
        
    }
}

extension HomeViewController: FilterViewDelegate {
    func applyFilters() {
        dataSource = FilterService.getItems()
        kolodaView.resetCurrentCardIndex()
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
        kolodaView.swipe(.up)
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
        let vc = FilterViewController()
        vc.filterDelegate = self
        vc.hero.isEnabled = true
        vc.hero.modalAnimationType = .selectBy(presenting: .slide(direction: .down), dismissing: .slide(direction: .up))
        present(vc, animated: true, completion: nil)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
