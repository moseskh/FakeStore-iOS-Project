//
//  Product.swift
//  FakeStore-iOS-Project
//
//  Created by Moses Kh. on 09/06/2024.
//

import Foundation

struct Product: Codable {
    let id: Int
    let title: String
    let price: Double
    let category: String
    let description: String
    let image: String
    let rating: Rating
}
