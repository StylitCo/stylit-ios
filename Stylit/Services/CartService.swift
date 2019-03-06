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
    private static var cartItems = [Item]()
    
    static func addImageToCart(item: Item) -> Bool {
        if (cartItems.contains(item)) {
            return false
        }
        cartItems.append(item)
        return true
    }
    
    static func removeImageFromCart(atIndex index: Int) {
        cartItems.remove(at: index)
    }
    
    static func getCartItems() -> [Item] {
        return cartItems
    }
}
