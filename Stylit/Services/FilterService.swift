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
    
    private static var items = [Item]()
    private static var chosenTags = [String]()
    
    static func addItem(item: Item) {
        items.append(item)
    }
    
    static func addItem(items: [Item]) {
        self.items.append(contentsOf: items)
    }
    
    static func getItems() -> [Item] {
        if chosenTags.isEmpty {
            return items
        } else {
            return getItemsWithTags(tags: chosenTags)
        }
    }
    
    static func getItemsWithTags(tags: [String]) -> [Item] {
        var result = [Item]()
        for item in items {
            for tag in tags {
                if item.tags.contains(tag) {
                    result.append(item)
                    continue
                }
            }
        }
        
        return result;
    }
    
    static func setTags(tags: [String]) {
        chosenTags = tags
    }
    
    static func getTags() -> [String] {
        return chosenTags
    }
    
    static func deleteTag(item: String) {
        var result = [String]()
        for tag in chosenTags {
            if tag != item {
                result.append(tag)
            }
        }
        
        chosenTags = result
    }
    
    static func addTag(item: String) {
        chosenTags.append(item)
    }
    
}


