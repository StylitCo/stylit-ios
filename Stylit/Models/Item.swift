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
    let tags: Set<ClothingTag>
    
    init(image: UIImage, title: String, description: String, brand: String, price: Int, tags: Set<ClothingTag>) {
        self.image = image
        self.title = title
        self.description = description
        self.brand = brand
        self.price = price
        self.tags = tags
    }
}

extension Item: Equatable {
    static func == (lhs: Item, rhs: Item) -> Bool {
        // TODO: Add tags in as a necessary equality attribute?
        return lhs.image == rhs.image && lhs.title == rhs.title && lhs.description == rhs.description && lhs.brand == rhs.brand && lhs.price == rhs.price
    }
}
