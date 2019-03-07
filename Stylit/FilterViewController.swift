//
//  FilterViewController.swift
//  Stylit
//
//  Created by Kavi Ramamurthy on 3/6/19.
//  Copyright © 2019 Lucas Wotton. All rights reserved.
//

import Foundation
import UIKit

class FilterViewController: UIViewController {
    
    private let label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = "hello"
        label.backgroundColor = .white
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
}
