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
    private static var likedImages = [UIImage]()
    private static var dislikedImages = [UIImage]()
    
    static func likeImage(likedImage: UIImage) {
        likedImages.append(likedImage)
    }
    
    static func dislikeImage(dislikedImage: UIImage) {
        dislikedImages.append(dislikedImage)
    }
    
    static func getLikedImages() -> [UIImage] {
        return likedImages
    }
    
    static func getDislikedImages() -> [UIImage] {
        return dislikedImages
    }
}
