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
    
    private let mainLabel = UILabel()
    private let separatorView = UIView()
    private let separatorView2 = UIView()
    
    private let profileImage = UIImageView()
    private let backgroundProfileView = UIView()
    private let name = UILabel()
    private let age = UILabel()
    
    private let shirtSizeLabel = UILabel()
    private let shirtSize = UILabel()
    
    private let waistSizeLabel = UILabel()
    private let waistSize = UILabel()
    
    private let pantLengthLabel = UILabel()
    private let pantLength = UILabel()
    
    private let shoeSizeLabel = UILabel()
    private let shoeSize = UILabel()
    
    private let heightLabel = UILabel()
    private let height = UILabel()
    
    private let weightLabel = UILabel()
    private let weight = UILabel()
    
    private let collectionView = CollectionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hero.isEnabled = true
        view.backgroundColor = UIColor.purple

//        setupCollection()
        setupSubViews()
        setupLayout()
        
    }
    
    private func setupSubViews() {
        let purple = UIColor(red:0.54, green:0.17, blue:0.89, alpha:1.0)
        let homeImage = UIImage(named: "Home")
        homeButton.setImage(homeImage, for: .normal)
        homeButton.tintColor = purple
        homeButton.addTarget(self, action: #selector(LikesViewController.homeButtonTapped(_:)),                             for: .touchUpInside)
        view.addSubview(homeButton)
        
        // top label
        mainLabel.text = "Profile"
        mainLabel.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        mainLabel.numberOfLines = 1
        mainLabel.textAlignment = .left
        mainLabel.textColor = purple
        view.addSubview(mainLabel)
        
        backgroundProfileView.backgroundColor = UIColor(red:0.54, green:0.17, blue:0.89, alpha:1.0)
        backgroundProfileView.clipsToBounds = true
        backgroundProfileView.layer.cornerRadius = 67
        view.addSubview(backgroundProfileView)
        
        profileImage.image = UIImage(named: "Sake")
        profileImage.clipsToBounds = true
        profileImage.layer.cornerRadius = 65
        profileImage.contentMode = .scaleAspectFit
        backgroundProfileView.addSubview(profileImage)
        
        name.text = "Sake"
        name.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        name.textAlignment = .center
        view.addSubview(name)
        
        heightLabel.text = "Height"
        heightLabel.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        view.addSubview(heightLabel)
        
        height.text = "6'4\""
        height.font = UIFont.systemFont(ofSize: 18, weight: .light)
        view.addSubview(height)
        
        weightLabel.text = "Weight"
        weightLabel.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        view.addSubview(weightLabel)
        
        weight.text = "205 lbs"
        weight.font = UIFont.systemFont(ofSize: 18, weight: .light)
        view.addSubview(weight)
        
        shirtSizeLabel.text = "Shirt Size"
        shirtSizeLabel.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        view.addSubview(shirtSizeLabel)
        
        shirtSize.text = "XL"
        shirtSize.font = UIFont.systemFont(ofSize: 18, weight: .light)
        view.addSubview(shirtSize)
        
        separatorView.backgroundColor = .lightGray
        view.addSubview(separatorView)
        
        separatorView2.backgroundColor = .lightGray
        view.addSubview(separatorView2)
        
        waistSizeLabel.text = "Waist"
        waistSizeLabel.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        view.addSubview(waistSizeLabel)
        
        waistSize.text = "34"
        waistSize.font = UIFont.systemFont(ofSize: 18, weight: .light)
        view.addSubview(waistSize)
        
        pantLengthLabel.text = "Pant Length"
        pantLengthLabel.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        view.addSubview(pantLengthLabel)
        
        pantLength.text = "36"
        pantLength.font = UIFont.systemFont(ofSize: 18, weight: .light)
        view.addSubview(pantLength)
        
        shoeSizeLabel.text = "Shoe Size"
        shoeSizeLabel.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        view.addSubview(shoeSizeLabel)
        
        shoeSize.text = "14"
        shoeSize.font = UIFont.systemFont(ofSize: 18, weight: .light)
        view.addSubview(shoeSize)
        
        view.backgroundColor = .white
    }
    
    private func setupLayout() {
        homeButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(40)
            make.width.equalTo(40)
        }
        
        mainLabel.snp.makeConstraints { make in
            make.centerY.equalTo(homeButton.snp.centerY)
            make.leading.equalToSuperview().offset(30)
        }
        
        backgroundProfileView.snp.makeConstraints { make in
            make.top.equalTo(mainLabel.snp.bottom).offset(50)
            make.width.equalTo(134)
            make.height.equalTo(134)
            make.centerX.equalToSuperview()
        }
        
        profileImage.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(130)
            make.height.equalTo(130)
        }
        
        name.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalTo(profileImage.snp.bottom).offset(10)
        }
        
        heightLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(30)
            make.width.equalTo(140)
            make.top.equalTo(name.snp.bottom).offset(40)
        }
        
        height.snp.makeConstraints { make in
            make.centerX.equalTo(heightLabel.snp.centerX)
            make.width.equalTo(140)
            make.top.equalTo(heightLabel.snp.bottom).offset(10)
        }
        
        weightLabel.snp.makeConstraints { make in
            make.centerX.equalTo(name.snp.centerX).offset(44)
            make.width.equalTo(140)
            make.top.equalTo(name.snp.bottom).offset(40)
        }
        
        weight.snp.makeConstraints { make in
            make.width.equalTo(140)
            make.centerX.equalTo(weightLabel.snp.centerX)
            make.top.equalTo(weightLabel.snp.bottom).offset(10)
        }

        
        separatorView.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalTo(weight.snp.bottom).offset(20)
        }
        
        waistSizeLabel.snp.makeConstraints { make in
            make.centerX.equalTo(height.snp.centerX)
            make.width.equalTo(140)
            make.top.equalTo(separatorView.snp.bottom).offset(20)
        }
        
        waistSize.snp.makeConstraints { make in
            make.centerX.equalTo(waistSizeLabel.snp.centerX)
            make.width.equalTo(140)
            make.top.equalTo(waistSizeLabel.snp.bottom).offset(10)
        }
        
        pantLengthLabel.snp.makeConstraints { make in
            make.centerX.equalTo(weightLabel.snp.centerX)
            make.width.equalTo(140)
            make.top.equalTo(separatorView.snp.bottom).offset(20)
        }
        
        pantLength.snp.makeConstraints { make in
            make.centerX.equalTo(pantLengthLabel.snp.centerX)
            make.width.equalTo(140)
            make.top.equalTo(pantLengthLabel.snp.bottom).offset(10)
        }
        
        separatorView2.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalTo(pantLength.snp.bottom).offset(20)
        }
        
        shirtSizeLabel.snp.makeConstraints { make in
            make.width.equalTo(140)
            make.centerX.equalTo(waistSizeLabel.snp.centerX)
            make.top.equalTo(separatorView2.snp.bottom).offset(20)
        }
        
        shirtSize.snp.makeConstraints { make in
            make.width.equalTo(140)
            make.centerX.equalTo(shirtSizeLabel.snp.centerX)
            make.top.equalTo(shirtSizeLabel.snp.bottom).offset(10)
        }
        
        shoeSizeLabel.snp.makeConstraints { make in
            make.centerX.equalTo(pantLengthLabel.snp.centerX)
            make.width.equalTo(140)
            make.top.equalTo(separatorView2.snp.bottom).offset(20)
        }
        
        shoeSize.snp.makeConstraints { make in
            make.centerX.equalTo(shoeSizeLabel.snp.centerX)
            make.width.equalTo(140)
            make.top.equalTo(shoeSizeLabel.snp.bottom).offset(10)
        }
//
//        collectionView.snp.makeConstraints { make in
//            make.top.equalTo(homeButton.snp.bottom).offset(40)
//            make.bottom.equalToSuperview()
//            make.width.equalToSuperview()
//            make.leading.equalToSuperview()
//        }
    }
    
//    private func setupCollection() {
//        let likesData = LikesService.getLikedItems()
//
//        var data: [Int] = []
//        if !likesData.isEmpty {
//            for i in 0..<likesData.count {
//                data.append(i)
//            }
//        }
//
//        let dataSource = ArrayDataSource(data: data)
//        self.arrayDataSource = dataSource
//        let viewSource = ClosureViewSource(viewUpdater: { (view: LikeCellView, data: Int, index: Int) in
//            view.setImageIndex(atIndex: data)
//            view.buttonDelegate = self
//            view.layer.cornerRadius = 10.0
//            view.clipsToBounds = true
//
//        })
//        let sizeSource = { (index: Int, data: Int, collectionSize: CGSize) -> CGSize in
//            return CGSize(width: self.view.frame.width - 20, height: 150)
//        }
//        let provider = BasicProvider(
//            dataSource: dataSource,
//            viewSource: viewSource,
//            sizeSource: sizeSource
//        )
//
//        provider.layout = FlowLayout(spacing: 5, justifyContent: .center)
//        provider.animator = DeleteAnimator()
//
//        collectionView.backgroundColor = UIColor.clear
//
//        //lastly assign this provider to the collectionView to display the content
//        collectionView.provider = provider
//    }
    
    @objc func homeButtonTapped(_ sender: UIButton) {
        // animate transition
        let vc = HomeViewController()
        vc.hero.isEnabled = true
        vc.hero.modalAnimationType = .slide(direction: .left)
        dismiss(animated: true, completion: nil)
    }
    
}

//extension LikesViewController: CartCellButtonDelegate {
//
//    func didTapRemoveButton(atIndex index: Int) {
//        LikesService.removeItemFromLikes(atIndex: index)
//        let likesData = LikesService.getLikedItems()
//
//        var data: [Int] = []
//        if !likesData.isEmpty {
//            for i in 0..<likesData.count {
//                data.append(i)
//            }
//        }
//
//        self.arrayDataSource?.data = data
//    }
//}
