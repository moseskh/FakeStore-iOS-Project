//
//  ProductsListCollectionViewDataSource.swift
//  FakeStore-iOS-Project
//
//  Created by Moses Kh. on 13/06/2024.
//

import UIKit

extension ProductsListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductsListCollectionViewCell.identifier, for: indexPath) as? ProductsListCollectionViewCell else {
            fatalError("Unable to dequeue ProductsCollectionViewCell")
        }
        
        if let product = products?[indexPath.row] {
            cell.configure(with: product)
        }
        return cell
    }
}
