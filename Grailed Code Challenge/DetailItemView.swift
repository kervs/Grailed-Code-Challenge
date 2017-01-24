//
//  DetailItemView.swift
//  Grailed Code Challenge
//
//  Created by Kervins Valcourt on 1/18/17.
//  Copyright © 2017 Grailed. All rights reserved.
//

import UIKit
import CSStickyHeaderFlowLayout
import SnapKit


class DetailItemView: UICollectionView {

    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: DetailItemView.provideCollectionViewLayout())

        backgroundColor = UIColor.white
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    class func provideCollectionViewLayout() -> UICollectionViewFlowLayout {
        let screenWidth = UIScreen.main.bounds.size.width

        let layout = CSStickyHeaderFlowLayout()
        layout.parallaxHeaderMinimumReferenceSize = CGSize(width: screenWidth, height: 118)
        layout.parallaxHeaderReferenceSize = CGSize(width: screenWidth, height: UIScreen.main.bounds.size.height/4)
        layout.parallaxHeaderAlwaysOnTop = true
        layout.disableStickyHeaders = false
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width - 20, height: 75)
        layout.minimumLineSpacing = 7.0
        layout.minimumInteritemSpacing = 7.0
        layout.sectionInset = UIEdgeInsetsMake(0.0, 0.0, 0.0, 0.0)

        return layout
    }
    
}
