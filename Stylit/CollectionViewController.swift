//
//  CollectionViewController.swift
//  Stylit
//
//  Created by Kavi Ramamurthy on 2/22/19.
//  Copyright © 2019 Lucas Wotton. All rights reserved.
//

import UIKit
import CollectionKit

class CollectionViewController: UIViewController {
    let collectionView = CollectionView()
    
    var provider: Provider? {
        get { return collectionView.provider }
        set { collectionView.provider = newValue }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }
}
