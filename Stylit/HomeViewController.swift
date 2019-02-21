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
import VerticalCardSwiper

private var numberOfCards: Int = 5

class HomeViewController: UIViewController {
    
    private let stylitLabel = UILabel()
    private let separatorView = UIView()
    private let headerView = UIView()
    
    private let cardSwiper = VerticalCardSwiper()
    
    
    private let buttonView = UIView()
    private let dislikeButton = UIButton()
    private let likeButton = UIButton()
    
    // navigation
    private let cartButton = UIButton()
    private let feedButton = UIButton()
    
    private let cardView = UIView()
    
    private var cardDataSource: [UIImage] = {
        var array: [UIImage] = []
        for index in 0..<5 {
            array.append(UIImage(named: "StylishMan")!)
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
        setupSubviews()
        setupLayout()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
}

// MARK: Setup subviews
extension HomeViewController {
    private func setupSubviews() {
        cardSwiper.delegate = self
        cardSwiper.datasource = self
        cardSwiper.register(MyCardCell.self, forCellWithReuseIdentifier: MyCardCell.Constants.name)
        
        stylitLabel.text = "Stylit"
        stylitLabel.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        stylitLabel.numberOfLines = 1
        stylitLabel.textAlignment = .center
        headerView.addSubview(stylitLabel)
        
        separatorView.backgroundColor = .lightGray
        headerView.addSubview(separatorView)
        
        view.addSubview(headerView)
        
//        kolodaView.backgroundColor = .purple
        
        let likeImage = UIImage(named: "Like")
        likeButton.setImage(likeImage, for: .normal)
        //likeButton.setImage(likeImage?.maskWithColor(color: .red), for: .selected)
        likeButton.addTarget(self, action: #selector(HomeViewController.likeButtonTapped(_:)), for: .touchUpInside)
        
        let dislikeImage = UIImage(named: "Dislike")
        dislikeButton.setImage(dislikeImage, for: .normal)
        dislikeButton.addTarget(self, action: #selector(HomeViewController.dislikeButtonTapped(_:)), for: .touchUpInside)
        
        let cartImage = UIImage(named: "Cart")
        cartButton.setImage(cartImage, for: .normal)
        cartButton.addTarget(self, action: #selector(HomeViewController.cartButtonTapped(_:)),                             for: .touchUpInside)
        
        let feedImage = UIImage(named: "Grid")
        feedButton.setImage(feedImage, for: .normal)
        feedButton.addTarget(self, action: #selector(HomeViewController.feedButtonTapped(_:)),                             for: .touchUpInside)

//        likeButton.backgroundColor = .red
//        dislikeButton.backgroundColor = .blue
        
        view.addSubview(cardSwiper)
        view.addSubview(dislikeButton)
        view.addSubview(likeButton)
        view.addSubview(cartButton)
        view.addSubview(feedButton)

        // set up gradient background
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [UIColor.purple.cgColor, UIColor.white.cgColor]
        view.layer.insertSublayer(gradient, at: 0)
//        view.backgroundColor = .purple
    }
    
    private func setupLayout() {
        cardSwiper.snp.makeConstraints { make in
            if #available(iOS 11, *) {
                make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin).offset(50)
            } else {
                make.top.equalTo(view.snp.topMargin).offset(50)
            }
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
        }
        
        dislikeButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview().offset(-90)
            make.top.equalTo(cardSwiper.snp.bottom).offset(50)
            make.height.equalTo(80)
            make.width.equalTo(80)
            make.bottom.equalToSuperview().offset(-50)
        }

        likeButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview().offset(90)
            make.top.equalTo(cardSwiper.snp.bottom).offset(50)
            make.height.equalTo(80)
            make.width.equalTo(80)
            make.bottom.equalToSuperview().offset(-50)
        }
        
        cartButton.snp.makeConstraints { make in
            make.bottom.equalTo(cardSwiper.snp.top).offset(-10)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(40)
            make.width.equalTo(40)
        }
        
        feedButton.snp.makeConstraints { make in
            make.bottom.equalTo(cardSwiper.snp.top).offset(-10)
            make.leading.equalToSuperview().offset(20)
            make.height.equalTo(40)
            make.width.equalTo(40)
        }
    }
}

// Koloda view delegate
//extension HomeViewController: KolodaViewDelegate {
//    func kolodaDidRunOutOfCards(_ koloda: KolodaView) {
//        let position = kolodaView.currentCardIndex
//        for _ in 1...4 {
//            cardDataSource.append(UIImage(named: "StylishMan")!)
//        }
//        kolodaView.insertCardAtIndexRange(position..<position + 4, animated: true)
//    }
//
//    func koloda(_ koloda: KolodaView, didSelectCardAt index: Int) {
//        print("selected!")
//        // TODO: Do something when selected
//    }
//}

// Vertical Card Swiper Delegate
extension HomeViewController: VerticalCardSwiperDelegate {
    
    
}

extension HomeViewController: VerticalCardSwiperDatasource {
    func cardForItemAt(verticalCardSwiperView: VerticalCardSwiperView, cardForItemAt index: Int) -> CardCell {
        
        if let cardCell = verticalCardSwiperView.dequeueReusableCell(withReuseIdentifier: MyCardCell.Constants.name, for: index) as? MyCardCell {
            
            let image = cardDataSource[index]
            
            cardCell.setRandomBackgroundColor()
            cardCell.setImage = image
            return cardCell
        }
        return CardCell()
    }

    
    func numberOfCards(verticalCardSwiperView: VerticalCardSwiperView) -> Int {
        return cardDataSource.count
    }
}

// button functions
extension HomeViewController {
    @objc func likeButtonTapped(_ sender: UIButton) {
//        kolodaView.swipe(.right)
    }
    
    @objc func dislikeButtonTapped(_ sender: UIButton) {
//        kolodaView.swipe(.left)
    }
    
    @objc func cartButtonTapped(_ sender: UIButton) {
        print("cart button tapped")
    }
    
    @objc func feedButtonTapped(_ sender: UIButton) {
        print("feed button tapped")
    }
}
