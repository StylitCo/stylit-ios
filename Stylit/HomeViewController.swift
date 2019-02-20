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

private var numberOfCards: Int = 5

class HomeViewController: UIViewController {
    
    private let stylitLabel = UILabel()
    private let separatorView = UIView()
    private let headerView = UIView()
    
    private let kolodaView = KolodaView()
    
    private let buttonView = UIView()
    private let dislikeButton = UIButton()
    private let likeButton = UIButton()
    
    private let cardView = UIView()
    
    private var dataSource: [UIImage] = {
        var array: [UIImage] = []
        for index in 0..<numberOfCards {
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
        kolodaView.dataSource = self
        kolodaView.delegate = self
        self.modalTransitionStyle = UIModalTransitionStyle.flipHorizontal
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
        stylitLabel.text = "Stylit"
        stylitLabel.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        stylitLabel.numberOfLines = 1
        stylitLabel.textAlignment = .center
        headerView.addSubview(stylitLabel)
        
        separatorView.backgroundColor = .lightGray
        headerView.addSubview(separatorView)
        
        view.addSubview(headerView)
        
        kolodaView.backgroundColor = .purple
        
        let likeImage = UIImage(named: "Like")
        likeButton.setImage(likeImage, for: .normal)
        //likeButton.setImage(likeImage?.maskWithColor(color: .red), for: .selected)
        likeButton.addTarget(self, action: #selector(HomeViewController.likeButtonTapped(_:)), for: .touchUpInside)
        
        let dislikeImage = UIImage(named: "Dislike")
        dislikeButton.setImage(dislikeImage, for: .normal)
        dislikeButton.addTarget(self, action: #selector(HomeViewController.dislikeButtonTapped(_:)), for: .touchUpInside)

        likeButton.backgroundColor = .red
        dislikeButton.backgroundColor = .blue
        
        view.addSubview(kolodaView)
        view.addSubview(dislikeButton)
        view.addSubview(likeButton)
        
        view.backgroundColor = .black
    }
    
    private func setupLayout() {
        kolodaView.snp.makeConstraints { make in
            if #available(iOS 11, *) {
                make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin).offset(20)
            } else {
                make.top.equalTo(view.snp.topMargin).offset(20)
            }
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
        }
        
        dislikeButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview().offset(-50)
            make.top.equalTo(kolodaView.snp.bottom).offset(50)
            make.height.equalTo(40)
            make.width.equalTo(40)
            make.bottom.equalToSuperview().offset(-50)
        }

        likeButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview().offset(50)
            make.top.equalTo(kolodaView.snp.bottom).offset(50)
            make.height.equalTo(40)
            make.width.equalTo(40)
            make.bottom.equalToSuperview().offset(-50)
        }
    }
}

// Koloda view delegate
extension HomeViewController: KolodaViewDelegate {
    func kolodaDidRunOutOfCards(_ koloda: KolodaView) {
        let position = kolodaView.currentCardIndex
        for _ in 1...4 {
            dataSource.append(UIImage(named: "StylishMan")!)
        }
        kolodaView.insertCardAtIndexRange(position..<position + 4, animated: true)
    }
    
    func koloda(_ koloda: KolodaView, didSelectCardAt index: Int) {
        print("selected!")
        // TODO: Do something when selected
    }
}

// Koloda datasource delegate
extension HomeViewController: KolodaViewDataSource {
    
    func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {
        let imageView = UIImageView(image: dataSource[Int(index)])
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
}

// button functions
extension HomeViewController {
    @objc func likeButtonTapped(_ sender: UIButton) {
        kolodaView.swipe(.right)
    }
    
    @objc func dislikeButtonTapped(_ sender: UIButton) {
        kolodaView.swipe(.left)
    }
}
