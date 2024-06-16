//
//  ProductTableView.swift
//  FakeStore-iOS-Project
//
//  Created by Moses Kh. on 15/06/2024.
//

import UIKit

class ProductTableView: UITableView {
    
    init() {
        super.init(frame: .zero, style: .plain)
        setupTableView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupTableView()
    }
    
    private func setupTableView() {
        separatorStyle = .none
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .secondarySystemBackground
        if #available(iOS 15.0, *) {
            sectionHeaderTopPadding = 0
        }
        
        registerCells()
    }
    
    private func registerCells() {
        register(ProductRatingTableViewCell.self, forCellReuseIdentifier: ProductRatingTableViewCell.identifier)
        register(ProductTitleTableViewCell.self, forCellReuseIdentifier: ProductTitleTableViewCell.identifier)
        register(SuggestedProductsTableViewCell.self, forCellReuseIdentifier: SuggestedProductsTableViewCell.identifier)
        register(ProductTableSectionHeaderView.self, forHeaderFooterViewReuseIdentifier: ProductTableSectionHeaderView.reuseIdentifier)
    }
}
