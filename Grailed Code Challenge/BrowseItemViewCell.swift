//
//  BrowseItemViewCell.swift
//  Grailed Code Challenge
//
//  Created by Kervins Valcourt on 1/17/17.
//  Copyright © 2017 Grailed. All rights reserved.
//

import UIKit
import CSStickyHeaderFlowLayout
import SnapKit

class BrowseItemViewCell: UICollectionViewCell {
    var imageView: UIImageView
    var titleLabel: UILabel
    var subtitleLabel: UILabel
    var highlightColorBorder: UIView
    var itemCount: Int?

    override init(frame: CGRect) {
        imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = UIColor.lightGray
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 2.0
        imageView.clipsToBounds = true

        highlightColorBorder = UIView()
        highlightColorBorder.translatesAutoresizingMaskIntoConstraints = false
        highlightColorBorder.backgroundColor = UIColor.green
        highlightColorBorder.isHidden = true

        titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textAlignment = .left

        subtitleLabel = UILabel()
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.textAlignment = .left

        super.init(frame: frame)

        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        addSubview(highlightColorBorder)

        backgroundColor = UIColor.white
        layer.cornerRadius = 2.0
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.14
        layer.shadowOffset = CGSize(width: 0, height: 1)
        layer.shadowRadius = 1

        setupLayout()
    }

    required convenience init?(coder aDecoder: NSCoder) {
        self.init(frame: CGRect.zero)
    }

    override func prepareForReuse() {
        imageView.image = nil
        highlightColorBorder.isHidden = true
    }

    func setupLayout() {
        imageView.snp.makeConstraints { view -> Void in
            view.width.equalToSuperview()
            view.height.equalTo(self.snp.height).dividedBy(2).offset(20)
            view.centerX.equalToSuperview()
            view.top.equalToSuperview()
        }

        titleLabel.snp.makeConstraints { view -> Void in
            view.top.equalTo(imageView.snp.bottom).offset(15)
            view.left.equalToSuperview().offset(10)
            view.right.equalToSuperview().offset(-14)
        }

        highlightColorBorder.snp.makeConstraints { view -> Void in
            view.width.equalToSuperview()
            view.height.equalTo(4.5)
            view.left.equalToSuperview()
            view.right.equalToSuperview()
        }

        subtitleLabel.snp.makeConstraints { view -> Void in
            view.top.equalTo(titleLabel.snp.bottom)
            view.left.equalTo(titleLabel.snp.left)
            view.right.equalTo(titleLabel.snp.right)
            view.width.equalTo(titleLabel.snp.width)
        }
    }

}

