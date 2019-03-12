//
//  CardOverlayView.swift
//  Stylit
//
//  Created by Lucas Wotton on 3/10/19.
//  Copyright © 2019 Lucas Wotton. All rights reserved.
//

import UIKit
import Koloda

private let overlayRightImageName = "tinder-heart"
private let overlayLeftImageName = "tinder-x"
private let overlayUpImageName = "addtocart-new"

class CardOverlayView: OverlayView {
    
    let overlayImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var overlayState: SwipeResultDirection? {
        didSet {
            switch overlayState {
            case .left?:
                overlayImageView.image = UIImage(named: overlayLeftImageName)
                let skyBlue = UIColor(red:0.00, green:0.75, blue:1.00, alpha:1.0)
                overlayImageView.tintColor = skyBlue
                
                overlayImageView.snp.remakeConstraints { make in
                    make.trailing.equalToSuperview().offset(-20)
                    make.height.equalTo(120)
                    make.width.equalTo(120)
                    make.bottom.equalToSuperview().offset(-20)
                }
            case .right?:
                overlayImageView.image = UIImage(named: overlayRightImageName)
                let red = UIColor(red:0.87, green:0.63, blue:0.87, alpha:1.0)
                overlayImageView.tintColor = red

                overlayImageView.snp.remakeConstraints { make in
                    make.leading.equalToSuperview().offset(20)
                    make.height.equalTo(120)
                    make.width.equalTo(120)
                    make.bottom.equalToSuperview().offset(-20)
                }
            case .up?:
                overlayImageView.image = UIImage(named: overlayUpImageName)
                let gray = UIColor(red:0.71, green:0.75, blue:0.94, alpha:1.0)
                overlayImageView.tintColor = gray

                overlayImageView.snp.remakeConstraints { make in
                    make.bottom.equalToSuperview().offset(-20)
                    make.height.equalTo(100)
                    make.width.equalTo(100)
                    make.centerX.equalToSuperview()
                }
            default:
                overlayImageView.image = nil
            }
        }
    }
}

// Setup subviews
extension CardOverlayView {
    func setupSubviews() {
        overlayImageView.contentMode = .scaleAspectFit
        self.addSubview(overlayImageView)
    }
    
    func setupLayout() {
        // image layout setup is done in overlayState didSet function
    }
}
