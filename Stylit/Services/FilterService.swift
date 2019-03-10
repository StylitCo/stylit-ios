//
//  FilterService.swift
//  Stylit
//
//  Created by Kavi Ramamurthy on 3/6/19.
//  Copyright © 2019 Lucas Wotton. All rights reserved.
//

import Foundation
import UIKit

class FilterService {
    
    
    private static var chosenTags: Set<ClothingTag> = [.Hat, .Hoodies, .Jacket, .Pants, .Shirt, .Shoes, .Sweater]
    
    private static var unswipedItems: [Item] = initItems()
    
    static func initItems() -> [Item] {
        var items: [Item] = []
        for index in 1...2 {
            let shoesTags: Set<ClothingTag> = [.Shoes]
            let shirtTags: Set<ClothingTag> = [.Shirt]
            let pantsTags: Set<ClothingTag> = [.Pants]
            
            items.append(Item(image: UIImage(named: "shoes\(index)")!, title: "Shoe", description: "Some fresh shoes", brand: "Balenciaga", price: 100, tags: shoesTags))
            items.append(Item(image: UIImage(named: "shirt\(index)")!, title: "Shirt", description: "A fresh shirt", brand: "Bape", price: 100, tags: shirtTags))
            items.append(Item(image: UIImage(named: "pant\(index)")!, title: "Pants", description: "Some fresh pants", brand: "Supreme", price: 100, tags: pantsTags))
        }
        return items
    }
    
    static func getItems() -> [Item] {
        var filteredItems = [Item]()
        for item in unswipedItems {
            let itemTags = item.tags
            if chosenTags.intersection(itemTags).count > 0 {
                // this item contains a tag in the chosen filters
                filteredItems.append(item)
            }
        }
        return filteredItems
    }
    
    static func dislikeItem(swipedItem: Item) {
        guard let index = unswipedItems.firstIndex(of: swipedItem) else { fatalError("Disliked item doesn't exist in unswipedItems") }
        unswipedItems.remove(at: index)
        LikesService.dislikeItem(dislikedItem: swipedItem)
    }
    
    static func likeItem(swipedItem: Item) {
        guard let index = unswipedItems.firstIndex(of: swipedItem) else { fatalError("Liked item doesn't exist in unswipedItems") }
        unswipedItems.remove(at: index)
        LikesService.likeItem(likedItem: swipedItem)
    }
    
    static func addItemToCart(swipedItem: Item) {
        // TODO: Add this functionality
        
    }
    
    static func refreshItems() {
        unswipedItems = initItems()
    }

    static func getTags() -> Set<ClothingTag> {
        return chosenTags
    }
    
    static func addTag(tag: ClothingTag) {
        chosenTags.insert(tag)
    }
    
    static func deleteTag(tag: ClothingTag) {
        chosenTags.remove(tag)
    }
}


