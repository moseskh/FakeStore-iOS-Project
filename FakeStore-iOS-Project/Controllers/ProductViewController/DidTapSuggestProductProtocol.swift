//
//  DidTapSuggestProductProtocol.swift
//  FakeStore-iOS-Project
//
//  Created by Moses Kh. on 13/06/2024.
//

import UIKit

extension ProductViewController: didTapSuggestProduct {
    func didTapProduct(product: Product) {
        let vc = ProductViewController(productId: product.id)
        navigationController?.pushViewController(vc, animated: true)
    }
}
