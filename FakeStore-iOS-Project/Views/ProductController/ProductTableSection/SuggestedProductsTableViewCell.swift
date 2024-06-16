//
//  SuggestedProductsTableViewCell.swift
//  FakeStore-iOS-Project
//
//  Created by Moses Kh. on 12/06/2024.
//

import UIKit

protocol didTapSuggestProduct: AnyObject {
    func didTapProduct(product: Product)
}

class SuggestedProductsTableViewCell: UITableViewCell {
    
    // MARK: - Identifier
    
    static let identifier = "SuggestedProductsTableViewCell"
    
    // MARK: - Properties
    
    var prodcuts: [Product] = []
    weak var delegate: didTapSuggestProduct?
    
    // MARK: - UI Elements
    
    lazy var suggestedProductsCollectionView: UICollectionView = SuggestedProductsCollectionView()
    
    // MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
        configureCollectionView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Layout Setup
    
    private func setupCell() {
        backgroundColor = .secondarySystemBackground
        contentView.isUserInteractionEnabled = true
    }
    
    private func configureCollectionView(){
        suggestedProductsCollectionView.dataSource = self
        suggestedProductsCollectionView.delegate = self
        
        addSubview(suggestedProductsCollectionView)
        suggestedProductsCollectionView.leading(to: self)
        suggestedProductsCollectionView.top(to: self)
        suggestedProductsCollectionView.trailing(to: self)
        suggestedProductsCollectionView.bottom(to: self)
    }
    
    // MARK: - Configuration
    
    func configure(with products: [Product]) {
        self.prodcuts = products
    }
}


// MARK: - UICollectionViewDelegate, UICollectionViewDataSource

extension SuggestedProductsTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return prodcuts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SuggestedProductCollectionViewCell.identifier, for: indexPath) as? SuggestedProductCollectionViewCell else {
            fatalError("Unable to dequeue ProductsCollectionViewCell")
        }
        
        let product = prodcuts[indexPath.row]
        cell.configure(with: product)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        delegate?.didTapProduct(product: prodcuts[indexPath.row])
    }
}
