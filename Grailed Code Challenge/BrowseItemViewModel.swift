//
//  BrowseItemViewModel.swift
//  Grailed Code Challenge
//
//  Created by Kervins Valcourt on 1/17/17.
//  Copyright © 2017 Grailed. All rights reserved.
//

import UIKit
import Alamofire


class BrowseViewModel: NSObject {
    weak var delegate: BrowseViewModelDelegate?
    var items: [Item]

    override init() {
        items = []

        super.init()
    }

    func fetchData() {
        Alamofire.request("https://www.grailed.com/api/listings/grailed?page=%7B1,2,3...%7D").responseJSON(completionHandler: { response in
            switch response.result {
            case .success(let JSON):
                guard let response = JSON as? NSDictionary,
                let data = response.object(forKey: "data") as? [[String: AnyObject]] else {
                    return
                }

                for itemData in data {
                    let item = Item(data: itemData)
                    self.items.append(item)

                }
                self.delegate?.browseViewModelDidUpdateItems(self, items: self.items)

            case .failure(let error):
                print("Request failed with error: \(error)")
            }
        })

            

    }

    func loadItemDataAndIncreaseDataAmount() {
        items += items

    }
}
protocol BrowseViewModelDelegate: class {
    func browseViewModelDidUpdateItems(_ browseViewModel: BrowseViewModel, items: [Item?])
}
