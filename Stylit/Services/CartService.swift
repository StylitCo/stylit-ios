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
    private static var currentPrice: Int = 0
    
    static func addItemToCart(item: Item) -> Bool {
        if (cartItems.contains(item)) {
            return false
        }
        cartItems.append(item)
        currentPrice += item.price
        return true
    }
    
    static func removeItemFromCart(atIndex index: Int) {
        let item = cartItems.remove(at: index)
        currentPrice -= item.price
    }
    
    static func getCartItems() -> [Item] {
        return cartItems
    }
    
    static func getCartPrice() -> Int {
        return currentPrice
    }
}
