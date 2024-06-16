//
//  SuggestedProductCollectionViewCell.swift
//  FakeStore-iOS-Project
//
//  Created by Moses Kh. on 12/06/2024.
//

import UIKit

class SuggestedProductCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Identifier
    
    static let identifier = "SuggestedProductCollectionViewCell"
    
    // MARK: - UI Elements
    
    lazy private var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "title"
        label.font = .sans(ofSize: 15, weight: .regular)
        label.textColor = .label
        label.numberOfLines = 2
        return label
    }()
    
    lazy private var priceLabel: UILabel = {
        let label = UILabel()
        label.text = "0$"
        label.font = .sans(ofSize: 16, weight: .bold)
        label.textColor = .systemRed
        return label
    }()
    
    lazy private var imageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.image = UIImage(systemName: "photo")
        return image
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
        layer.cornerRadius = bounds.height * 0.05
    }
    
    // MARK: - Layout Setup
    
    private func setupCell() {
        backgroundColor = .systemBackground
    }
    
    private func setupLayout(){
        addSubview(imageView)
        imageView.top(to: self, constant: 5)
        imageView.centerX(to: self)
        imageView.width(of: self, multiplier: 0.9)
        imageView.height(of: self, multiplier: 0.6)
        
        addSubview(titleLabel)
        titleLabel.topToAnchor(to: imageView.bottomAnchor, constant: 10)
        titleLabel.leading(to: self, constant: 15)
        titleLabel.trailing(to: self, constant: 15)
        
        addSubview(priceLabel)
        priceLabel.bottom(to: self, constant: 15)
        priceLabel.leading(to: self, constant: 15)
        priceLabel.trailing(to: self, constant: 15)
    }
    
    // MARK: - Configuration
    
    func configure(with model: Product) {
        imageView.sd_setImage(with: URL(string: model.image), placeholderImage: UIImage(systemName: "photo"))
        titleLabel.text = model.title
        priceLabel.text = "\(String(format: "%.2f", model.price))$"
    }
}
