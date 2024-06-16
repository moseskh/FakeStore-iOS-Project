//
//  ProductTableSection.swift
//  FakeStore-iOS-Project
//
//  Created by Moses Kh. on 13/06/2024.
//

import Foundation

enum ProductTableSection {
    case productDescription(model: [ProductDetailsTableSection])
    case suggestedProducts(model: [Product])
}

enum ProductDetailsTableSection {
    case title(title: String, description: String)
    case rating(rate: Rating, price: Double)
}


