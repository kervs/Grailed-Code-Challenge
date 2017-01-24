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
    private var webservice: Webservice
    weak var delegate: BrowseViewModelDelegate?
    var items: [Item]

    override init() {
        items = []
        webservice = Webservice()
        super.init()
    }

    func fetchData() {
        webservice.load(Item.all) { result in
            if let items = result {
                self.items = items
            }
            self.delegate?.browseViewModelDidUpdateItems(self)
        }
    }

    func loadItemDataAndIncreaseDataAmount() {
        items += items
    }
}

protocol BrowseViewModelDelegate: class {
    func browseViewModelDidUpdateItems(_ browseViewModel: BrowseViewModel)
}
