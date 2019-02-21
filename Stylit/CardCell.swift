//
//  CardCell.swift
//  Stylit
//
//  Created by Lucas Wotton on 2/20/19.
//  Copyright © 2019 Lucas Wotton. All rights reserved.
//

import UIKit
import Foundation
import VerticalCardSwiper

class MyCardCell: CardCell {
    
    struct Constants {
        static let name = "MyCardCell"
    }

    private var cardImageView = UIImageView()
    
    private let containerView = UIView()
    
    var setImage: UIImage! {
        didSet {
            updateUI()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setRandomBackgroundColor() {
        
        let randomRed: CGFloat = CGFloat(arc4random()) / CGFloat(UInt32.max)
        let randomGreen: CGFloat = CGFloat(arc4random()) / CGFloat(UInt32.max)
        let randomBlue: CGFloat = CGFloat(arc4random()) / CGFloat(UInt32.max)
        
        self.backgroundColor = UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
    }
    
    override func layoutSubviews() {
        
        self.layer.cornerRadius = 12
        
        super.layoutSubviews()
    }
}


// MARK: Setup subviews
extension MyCardCell {
    private func setupSubviews() {
        containerView.addSubview(cardImageView)
        
        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = 16.0
        contentView.addSubview(containerView)
    }
    
    private func setupLayout() {
        cardImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func updateUI() {
        cardImageView.image = setImage
        cardImageView.layer.cornerRadius = 16.0
        cardImageView.clipsToBounds = true
    }
}
