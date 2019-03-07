//
//  LikesService.swift
//  Stylit
//
//  Created by Lucas Wotton on 2/26/19.
//  Copyright © 2019 Lucas Wotton. All rights reserved.
//

import Foundation
import UIKit

class LikesService {
    // TODO: Make network calls instead of storing locally
    private static var likedItems = [Item]()
    private static var dislikedItems = [Item]()
    
    static func likeItem(likedItem: Item) {
        likedItems.append(likedItem)
    }
    
    static func removeItemFromLikes(atIndex index: Int) {
        likedItems.remove(at: index)
    }
    
    static func dislikeItem(dislikedItem: Item) {
        dislikedItems.append(dislikedItem)
    }
    
    static func getLikedItems() -> [Item] {
        return likedItems
    }
    
    static func getDislikedItems() -> [Item] {
        return dislikedItems
    }
}
