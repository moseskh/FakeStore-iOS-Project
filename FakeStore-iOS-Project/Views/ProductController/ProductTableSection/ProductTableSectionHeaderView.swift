//
//  ProductTableSectionHeaderView.swift
//  FakeStore-iOS-Project
//
//  Created by Moses Kh. on 12/06/2024.
//

import UIKit

class ProductTableSectionHeaderView: UITableViewHeaderFooterView {
    
    // MARK: - Identifier
    
    static let reuseIdentifier: String = "ProductTableSectionHeaderView"
    
    // MARK: - UI Elements
    
    lazy private var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .sans(ofSize: 17, weight: .medium)
        label.textColor = .label
        return label
    }()
    
    // MARK: - Initialization
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Layout Setup
    
    private func setupConstraints() {
        addSubview(titleLabel)
        
        titleLabel.leading(to: self, constant: 15)
        titleLabel.trailing(to: self, constant: 25)
        titleLabel.centerY(to: self)
    }
    
    // MARK: - Configuration
    
    func setTitle(_ title: String) {
        titleLabel.text = title
    }
}
