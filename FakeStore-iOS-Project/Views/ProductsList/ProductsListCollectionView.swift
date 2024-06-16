//
//  ProductsListCollectionView.swift
//  FakeStore-iOS-Project
//
//  Created by Moses Kh. on 10/06/2024.
//

import UIKit

class ProductsListCollectionView: UICollectionView {
    
    init() {
        let layout = ProductsListCollectionViewLayout()
        super.init(frame: .zero, collectionViewLayout: layout)
        configureCollectionView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureCollectionView()
    }
    
    private func configureCollectionView() {
        register(ProductsListCollectionViewCell.self, forCellWithReuseIdentifier: ProductsListCollectionViewCell.identifier)
        backgroundColor = .secondarySystemBackground
        showsHorizontalScrollIndicator = false
    }
}

class ProductsListCollectionViewLayout: UICollectionViewFlowLayout {
    
    override init() {
        super.init()
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupLayout()
    }
    
    private func setupLayout() {
        scrollDirection = .vertical
        itemSize = CGSize(width: UIScreen.main.bounds.width * 0.9, height: 150)
        minimumLineSpacing = 20
        sectionInset = UIEdgeInsets(top: 15, left: 0, bottom: 15, right: 0)
    }
}
