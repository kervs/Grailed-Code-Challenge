//
//  ItemCollectionView.swift
//  Grailed Code Challenge
//
//  Created by Kervins Valcourt on 1/18/17.
//  Copyright © 2017 Grailed. All rights reserved.
//

import UIKit
import CSStickyHeaderFlowLayout
import SnapKit

let BrowseItemHeaderViewIdentifier = "browseHeaderViewIdentifier"
let cellReuseIdentifer = "cellReuseIdentifier"

class BrowseItemCollectionView: UICollectionView {

    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: BrowseItemCollectionView.provideCollectionViewLayout())

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    class func provideCollectionViewLayout() -> UICollectionViewFlowLayout {
        let screenWidth = UIScreen.main.bounds.size.width
        
        let layout = CSStickyHeaderFlowLayout()
        layout.parallaxHeaderMinimumReferenceSize = CGSize(width: screenWidth, height: 40)
        layout.parallaxHeaderReferenceSize = CGSize(width: screenWidth, height: UIScreen.main.bounds.size.height/4 * 1.2)
        layout.parallaxHeaderAlwaysOnTop = true
        layout.disableStickyHeaders = false
        layout.itemSize = CGSize(width: (UIScreen.main.bounds.width - 30) / 2, height: 205.0)
        layout.minimumLineSpacing = 7.0
        layout.minimumInteritemSpacing = 7.0
        layout.sectionInset = UIEdgeInsetsMake(0.0, 10.0, 0.0, 10.0)

        return layout
    }
    
}
