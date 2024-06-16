//
//  ProductsListCollectionViewCell.swift
//  FakeStore-iOS-Project
//
//  Created by Moses Kh. on 09/06/2024.
//

import UIKit
import SDWebImage

class ProductsListCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Identifier
    
    static let identifier = "ProductsCollectionViewCell"
    
    // MARK: - UI Elements
    
    lazy private var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "title"
        label.font = .sans(ofSize: 15, weight: .regular)
        label.textColor = .label
        label.numberOfLines = 3
        return label
    }()
    
    lazy private var categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "category"
        label.font = .sans(ofSize: 14, weight: .medium)
        label.textColor = .secondaryLabel
        return label
    }()
    
    lazy private var priceLabel: UILabel = {
        let label = UILabel()
        label.text = "0$"
        label.font = .sans(ofSize: 16, weight: .bold)
        label.numberOfLines = 3
        label.textColor = .systemRed
        return label
    }()
    
    lazy private var iconView: UIImageView = {
        let icon = UIImageView()
        icon.contentMode = .scaleToFill
        icon.image = UIImage(systemName: "house")
        return icon
    }()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Lifecycle
    
    override func layoutSubviews() {
        layer.masksToBounds = true
        layer.cornerRadius = bounds.height * 0.1
    }
    
    // MARK: - Layout Setup
    
    private func setupCell() {
        backgroundColor = .systemBackground
    }
    
    private func setupLayout(){
        addSubview(iconView)
        iconView.leading(to: self, constant: 20)
        iconView.height(of: self, multiplier: 0.5)
        iconView.centerY(to: self)
        iconView.widthEqualHeight()
        
        addSubview(titleLabel)
        titleLabel.top(to: self, constant: 20)
        titleLabel.leadingToAnchor(to: iconView.trailingAnchor, constant: 20)
        titleLabel.trailing(to: self, constant: 15)
        
        
        addSubview(categoryLabel)
        categoryLabel.topToAnchor(to: titleLabel.bottomAnchor, constant: 5)
        categoryLabel.leadingToAnchor(to: iconView.trailingAnchor, constant: 20)
        
        addSubview(priceLabel)
        priceLabel.bottom(to: self, constant: 15)
        priceLabel.leadingToAnchor(to: iconView.trailingAnchor, constant: 20)
    }
    
    // MARK: - Configuration
    
    func configure(with model: Product) {
        iconView.sd_setImage(with: URL(string: model.image), placeholderImage: UIImage(systemName: "photo"))
        titleLabel.text = model.title
        categoryLabel.text = model.category.capitalized
        priceLabel.text = "\(String(format: "%.2f", model.price))$"
    }
}
