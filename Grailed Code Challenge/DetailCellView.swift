//
//  DetailCellView.swift
//  Grailed Code Challenge
//
//  Created by Kervins Valcourt on 1/19/17.
//  Copyright © 2017 Grailed. All rights reserved.
//

import UIKit
import SnapKit

class DetailCellView: UICollectionViewCell {
    var title: UILabel

    override init(frame: CGRect) {
        title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false

        super.init(frame: frame)

        addSubview(title)

        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupLayout() {
        title.snp.makeConstraints { view -> Void in
            view.top.equalToSuperview()
            view.bottom.equalToSuperview()
            view.left.equalToSuperview()
            view.right.equalToSuperview()
        }
    }
}
