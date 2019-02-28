//
//  CartService.swift
//  Stylit
//
//  Created by Lucas Wotton on 2/26/19.
//  Copyright © 2019 Lucas Wotton. All rights reserved.
//

import UIKit

class CartService {
    // TODO: Make network calls instead of storing locally
    private static var cartImages = [UIImage]()
    
    static func addImageToCart(cartImage: UIImage) -> Int {
        if (cartImages.contains(cartImage)) {
            return 0
        }
        cartImages.append(cartImage)
        return 1
    }
    
    static func getCartImages() -> [UIImage] {
        return cartImages
    }
}
