//
//  FilterViewController.swift
//  Stylit
//
//  Created by Kavi Ramamurthy on 3/6/19.
//  Copyright © 2019 Lucas Wotton. All rights reserved.
//

import Foundation
import UIKit
import DynamicButton

class FilterViewController: UIViewController {
    
    private let shirtsLabel = UILabel()
    let db = DynamicButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        shirtsLabel.text = "Shirts"
        shirtsLabel.backgroundColor = .white
        shirtsLabel.textAlignment = .center
        view.addSubview(shirtsLabel)
        shirtsLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalTo(50)
            make.width.equalToSuperview()
        }
        
        db.lineWidth = 3
        db.strokeColor = .black
        db.highlightStokeColor = .gray
        
        db.addTarget(self, action: #selector(FilterViewController.shirtsButtonTapped(_:)),                             for: .touchUpInside)
        
        view.addSubview(db)
        db.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalTo(50)
            make.width.equalTo(50)
        }
    }
    
    @objc func shirtsButtonTapped(_ sender: UIButton) {
        if FilterService.getTags().contains("shirts") {
            FilterService.deleteTag(item: "shirts")
            db.setStyle(.close, animated: true)
        } else {
            FilterService.addTag(item: "shirts")
            db.setStyle(.checkMark, animated: true)
        }
    }
}
