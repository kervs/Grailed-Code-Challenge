//
//  Item.swift
//  Grailed Code Challenge
//
//  Created by Kervins Valcourt on 1/17/17.
//  Copyright © 2017 Grailed. All rights reserved.
//

import Foundation

class Item: NSObject {
    var id: String = ""
    var title: String = ""
    var createdAt: String = ""
    var itemDescription: String = ""
    var designerNames: String = ""
    var followerCount: Int = 0
    var price: Int = 0
    var sold: Bool = false
    var photos: [Image] = []
    var mainPhoto: Image?
    var category: String?
    var subcategory: String?


    init (data: [String : AnyObject]) {
        if let idString = data["id"] as? Int {
            id = String(idString)
        }

        if let titleString = data["title"] as? String {
            title = titleString
        }

        if let createdAtString = data["created_at"] as? String {
            createdAt = createdAtString
        }

        if let itemDescriptionString = data["description"] as? String {
            itemDescription = itemDescriptionString
        }

        if let designerNamesString = data["designer_names"] as? String {
            designerNames = designerNamesString
        }

        if let followers = data["follower_count"] as? Int {
            followerCount = followers
        }

        if let pricePoint = data["price"] as? Int {
            price = pricePoint
        }

        if let imageURLs = data["photos"] as? [[String : AnyObject]] {
            for urlData in imageURLs {
                let image = Image(data: urlData)
                photos.append(image)

            }

            if let firstPhoto = photos.first {
                mainPhoto = firstPhoto
            }
        }
    }

}
