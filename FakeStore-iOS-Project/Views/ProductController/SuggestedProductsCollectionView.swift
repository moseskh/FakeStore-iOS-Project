//
//  SuggestedProductsCollectionView.swift
//  FakeStore-iOS-Project
//
//  Created by Moses Kh. on 12/06/2024.
//

import UIKit

class SuggestedProductsCollectionView: UICollectionView {
    
    init() {
        let layout = SuggestedProductsCollectionViewLayout()
        super.init(frame: .zero, collectionViewLayout: layout)
        configureCollectionView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureCollectionView()
    }
    
    private func configureCollectionView() {
        register(SuggestedProductCollectionViewCell.self, forCellWithReuseIdentifier: SuggestedProductCollectionViewCell.identifier)
        backgroundColor = .secondarySystemBackground
        showsHorizontalScrollIndicator = false
    }
}

class SuggestedProductsCollectionViewLayout: UICollectionViewFlowLayout {
    
    override init() {
        super.init()
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupLayout()
    }
    
    private func setupLayout() {
        scrollDirection = .horizontal
        itemSize = CGSize(width: UIScreen.main.bounds.width * 0.4, height: 250)
        minimumLineSpacing = 15
        sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
}
