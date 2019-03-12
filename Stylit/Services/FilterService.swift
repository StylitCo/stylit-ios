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
    
    
    private static var chosenTags: Set<ClothingTag> = [.Hat, .Outerwear, .Pants, .Shirt, .Shoes]
    
    private static var unswipedItems: [Item] = initItems()
    
    static func initItems() -> [Item] {
        var items: [Item] = []
        for index in 1...5 {
            let shoesTags: Set<ClothingTag> = [.Shoes]
            let shirtTags: Set<ClothingTag> = [.Shirt]
            let pantsTags: Set<ClothingTag> = [.Pants]
            
            if (index == 1) {
                items.append(Item(image: UIImage(named: "shoes\(index)")!, title: "Huarache", description: "The technology inside Nike Huaraches was originally developed for running.", brand: "Nike", price: 130, tags: shoesTags))
                items.append(Item(image: UIImage(named: "shirt\(index)")!, title: "Flannel", description: "A heavyweight organic flannel for cool weather wear", brand: "Patagonia", price: 54, tags: shirtTags))
                items.append(Item(image: UIImage(named: "pant\(index)")!, title: "Track Pants", description: "Athletic wear", brand: "Yeezy", price: 120, tags: pantsTags))
            } else if (index == 2) {
                items.append(Item(image: UIImage(named: "shoes\(index)")!, title: "Louis Vuitton Inspired", description: "Skateboarding shoes", brand: "Vans", price: 200, tags: shoesTags))
                items.append(Item(image: UIImage(named: "shirt\(index)")!, title: "Yeezus Tour Merch", description: "RARE Yeezus Tour Merchandise Kanye West TOUR t-shirt.", brand: "Yeezy", price: 175, tags: shirtTags))
                items.append(Item(image: UIImage(named: "pant\(index)")!, title: "Black Joggers", description: "Joggers in cotton twill with an elasticized drawstring waistband and mock fly", brand: "H&M", price: 25, tags: pantsTags))
            } else if (index == 3) {
                items.append(Item(image: UIImage(named: "shoes\(index)")!, title: "SF Air Force One", description: "A hoops icon toughens up with the Nike SF Air Force One", brand: "Nike", price: 150, tags: shoesTags))
                items.append(Item(image: UIImage(named: "shirt\(index)")!, title: "Rainbow Shirt", description: "This oversize shirt has a colorful rainbow print", brand: "Gucci", price: 490, tags: shirtTags))
                items.append(Item(image: UIImage(named: "pant\(index)")!, title: "Jean Joggers", description: "Joggers in cotton twill with an elasticized drawstring waistband and mock fly", brand: "H&M", price: 25, tags: pantsTags))
            } else if (index == 4) {
                items.append(Item(image: UIImage(named: "shoes\(index)")!, title: "Yeezy Boost 350 V2", description: "This model takes the popular Yeezy model in a monochromatic direction", brand: "Adidas", price: 255, tags: shoesTags))
                items.append(Item(image: UIImage(named: "shirt\(index)")!, title: "Pink Polo", description: "In lightweight, breathable cotton mesh, this Polo shirt is just a classic", brand: "Ralph Lauren", price: 85, tags: shirtTags))
                items.append(Item(image: UIImage(named: "pant\(index)")!, title: "Biker Jeans", description: "Freshen up your street-inspired style with help from the H&M Biker Jeans", brand: "H&M", price: 30, tags: pantsTags))
            } else {
                items.append(Item(image: UIImage(named: "shoes\(index)")!, title: "Gucci Low-Tops", description: "The retro-looking design is inspired by a Gucci sneaker from the 1970s, with Web stripe along the sides.", brand: "Gucci", price: 650, tags: shoesTags))
                items.append(Item(image: UIImage(named: "shirt\(index)")!, title: "White Bogo Tee", description: "White Supreme Box Logo T-Shirt", brand: "Supreme", price: 95, tags: shirtTags))
                items.append(Item(image: UIImage(named: "pant\(index)")!, title: "Distressed Ripped Jeans", description: "Heavily distressed details, regular waist, and button fly. Skinny legs.", brand: "H&M", price: 50, tags: pantsTags))
            }
            
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


