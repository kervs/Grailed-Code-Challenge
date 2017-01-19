//
//  Image.swift
//  Grailed Code Challenge
//
//  Created by Kervins Valcourt on 1/19/17.
//  Copyright © 2017 Grailed. All rights reserved.
//

import Foundation

struct Image {
    var id: String = ""
    var url: String = ""

    init (data: [String : AnyObject]) {
        if let idString = data["id"] as? Int {
            id = String(idString)
        }

        if let urlString = data["url"] as? String {
            url = urlString
        }
    }
} 
