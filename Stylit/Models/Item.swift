//
//  Item.swift
//  Stylit
//
//  Created by sakethn on 2/28/19.
//  Copyright © 2019 Lucas Wotton. All rights reserved.
//

import Foundation
import UIKit

class Item {
    let image: UIImage
    let title: String
    let description: String
    let brand: String
    let price: Int
    
    init(image: UIImage, title: String, description: String, brand: String, price: Int) {
        self.image = image
        self.title = title
        self.description = description
        self.brand = brand
        self.price = price
    }
    
}
