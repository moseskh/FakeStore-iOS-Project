//
//  ProductTitleTableViewCell.swift
//  FakeStore-iOS-Project
//
//  Created by Moses Kh. on 12/06/2024.
//

import UIKit

class ProductTitleTableViewCell: UITableViewCell {
    
    // MARK: - Identifier
    
    static let identifier = "ProductTitleTableViewCell"
    
    // MARK: - UI Elements
    
    lazy private var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "title"
        label.font = .sans(ofSize: 17, weight: .bold)
        label.textColor = .label
        label.numberOfLines = 0
        return label
    }()
    
    lazy private var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "description"
        label.font = .sans(ofSize: 15, weight: .regular)
        label.numberOfLines = 0
        label.textColor = .systemGray
        return label
    }()
    
    // MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Layout Setup
    
    private func setupCell() {
        selectionStyle = .none
        backgroundColor = .secondarySystemBackground
    }
    private func setupLayout() {
        addSubview(titleLabel)
        titleLabel.top(to: self, constant: 15)
        titleLabel.leading(to: self, constant: 15)
        titleLabel.trailing(to: self, constant: 15)
        
        addSubview(descriptionLabel)
        descriptionLabel.topToAnchor(to: titleLabel.bottomAnchor, constant: 10)
        descriptionLabel.leading(to: self, constant: 15)
        descriptionLabel.trailing(to: self, constant: 15)
        descriptionLabel.bottom(to: self, constant: 15)
    }
    
    // MARK: - Configuration
    
    func configure(title: String, description: String) {
        titleLabel.text = title
        descriptionLabel.text = description
    }
}
