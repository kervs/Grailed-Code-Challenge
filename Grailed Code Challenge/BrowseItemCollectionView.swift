//
//  ItemCollectionView.swift
//  Grailed Code Challenge
//
//  Created by Kervins Valcourt on 1/18/17.
//  Copyright © 2017 Grailed. All rights reserved.
//

import UIKit

let BrowsePackHeaderViewIdentifier = "browsePackHeaderViewIdentifier"
let cellReuseIdentifer = "cellReuseIdentifier"

class ItemCollectionView: UICollectionView {

    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: ItemCollectionView.provideCollectionViewLayout())

        collectionView?.registerClass(BrowsePackHeaderView.self, forSupplementaryViewOfKind: CSStickyHeaderParallaxHeader, withReuseIdentifier: BrowsePackHeaderViewIdentifier)
        collectionView?.register(BrowseItemViewCell.self, forCellWithReuseIdentifier: cellReuseIdentifer)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    class func provideCollectionViewLayout() -> UICollectionViewFlowLayout {
        let screenWidth = UIScreen.main.bounds.size.width
        let layout = CSStickyHeaderFlowLayout()

        let topMargin = CGFloat(0.0)
        layout.parallaxHeaderMinimumReferenceSize = CGSizeMake(screenWidth, 118)
        layout.parallaxHeaderReferenceSize = CGSizeMake(screenWidth, UIScreen.mainScreen().bounds.size.height/4 * 3 - 4)
        layout.parallaxHeaderAlwaysOnTop = true

        layout.disableStickyHeaders = false
        layout.itemSize = CGSizeMake(UIScreen.mainScreen().bounds.width - 20, cellHeight)
        layout.minimumLineSpacing = 7.0
        layout.minimumInteritemSpacing = 7.0
        layout.sectionInset = UIEdgeInsetsMake(topMargin, 0.0, 0.0, 0.0)

        return layout
    }
    
}
