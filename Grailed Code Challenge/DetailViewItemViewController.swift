//
//  DetailViewItemViewController.swift
//  Grailed Code Challenge
//
//  Created by Kervins Valcourt on 1/17/17.
//  Copyright © 2017 Grailed. All rights reserved.
//

import UIKit
import Alamofire
import SnapKit
import CSStickyHeaderFlowLayout

class DetailViewItemViewController: UIViewController,
    UICollectionViewDelegate,
    UICollectionViewDataSource {
    private var detailVC: DetailItemView
    private var item: Item

    init(_ shoppingItem: Item) {
        detailVC = DetailItemView()
        detailVC.translatesAutoresizingMaskIntoConstraints = false

        item = shoppingItem

        super.init(nibName: nil, bundle: nil)

        detailVC.delegate = self
        detailVC.dataSource = self

        detailVC.register(BrowseViewHeader.self, forSupplementaryViewOfKind: CSStickyHeaderParallaxHeader, withReuseIdentifier: BrowseItemHeaderViewIdentifier)
        detailVC.register(DetailCellView.self, forCellWithReuseIdentifier: "cell")

        view.backgroundColor = UIColor.white
        view.addSubview(detailVC)

        setupLayout()
    }

    func setupLayout() {
        detailVC.snp.makeConstraints { view -> Void in
            view.top.equalToSuperview()
            view.bottom.equalToSuperview()
            view.left.equalToSuperview()
            view.right.equalToSuperview()
        }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }


    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let cell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: BrowseItemHeaderViewIdentifier, for: indexPath) as? BrowseViewHeader else {
            return UICollectionReusableView()
        }

        if let url = item.mainPhoto?.url {

            Alamofire.request(url).responseImage { response in
                if let image = response.result.value {
                    cell.imageView.image = image
                }
            }
        }


        return cell
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath) as? DetailCellView else {
            return UICollectionViewCell()
        }

        switch indexPath.row {
        case 1:
            cell.title.text = item.title
        case 2:
            cell.title.text = "$ \(item.price)"
        case 3:
            cell.title.text = item.designerNames
        case 4:
            cell.title.text = item.itemDescription

        default: break
            
        }

        return cell
    }
}
