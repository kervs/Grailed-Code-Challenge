//
//  BrowseItemsViewController.swift
//  Grailed Code Challenge
//
//  Created by Kervins Valcourt on 1/17/17.
//  Copyright © 2017 Grailed. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import SnapKit
import CSStickyHeaderFlowLayout

class BrowseItemsViewController: UIViewController,
    UICollectionViewDelegate,
    UICollectionViewDataSource,
    BrowseViewModelDelegate {
    private var browseItemCollectionView: BrowseItemCollectionView
    private var viewModel: BrowseViewModel

    init(viewModel: BrowseViewModel = BrowseViewModel()) {
        self.viewModel = viewModel

        browseItemCollectionView = BrowseItemCollectionView()
        browseItemCollectionView.translatesAutoresizingMaskIntoConstraints = false
        browseItemCollectionView.backgroundColor = UIColor.white

        super.init(nibName: nil, bundle: nil)

        self.viewModel.delegate = self

        browseItemCollectionView.dataSource = self
        browseItemCollectionView.delegate = self

        browseItemCollectionView.register(BrowseViewHeader.self, forSupplementaryViewOfKind: CSStickyHeaderParallaxHeader, withReuseIdentifier: BrowseItemHeaderViewIdentifier)
        browseItemCollectionView.register(BrowseItemViewCell.self, forCellWithReuseIdentifier: cellReuseIdentifer)

        view.addSubview(browseItemCollectionView)

        setupLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.fetchData()
    }

    func setupLayout() {
        browseItemCollectionView.snp.makeConstraints { view -> Void in
            view.top.equalToSuperview()
            view.bottom.equalToSuperview()
            view.left.equalToSuperview()
            view.right.equalToSuperview()
        }
    }

    // MARK: UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let cell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: BrowseItemHeaderViewIdentifier, for: indexPath) as? BrowseViewHeader else {
                return UICollectionReusableView()
        }

        cell.imageView.image = #imageLiteral(resourceName: "Grailed")

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.items.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if viewModel.items.count == 0 {
            return UICollectionViewCell()
        }

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifer, for: indexPath as IndexPath) as? BrowseItemViewCell else {
                return UICollectionViewCell()
        }

        if viewModel.items.count >= indexPath.row {
            let item = viewModel.items[indexPath.row]

            if let url = item.mainPhoto?.url {

                Alamofire.request(url).responseImage { response in
                    if let image = response.result.value {
                        cell.imageView.image = image
                    }
                }
            }
            
            cell.layer.shouldRasterize = true
            cell.layer.rasterizationScale = UIScreen.main.scale
            cell.titleLabel.text = item.designerNames
            cell.subtitleLabel.text = String(item.price)
        }


        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if viewModel.items.count >= indexPath.row {
            let item = viewModel.items[indexPath.row]
            let vc = DetailViewItemViewController(item)
            navigationController?.pushViewController(vc, animated: true)
        } else {
            return
        }
    }

    func browseViewModelDidUpdateItems(_ browseViewModel: BrowseViewModel, items: [Item?]){
        browseItemCollectionView.reloadData()
    }
}
