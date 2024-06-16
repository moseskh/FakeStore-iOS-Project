//
//  ProductRatingTableViewCell.swift
//  FakeStore-iOS-Project
//
//  Created by Moses Kh. on 12/06/2024.
//

import UIKit
import Cosmos

class ProductRatingTableViewCell: UITableViewCell {
    
    // MARK: - Identifier
    
    static let identifier = "ProductRatingTableViewCell"
    
    // MARK: - UI Elements
    
    lazy private var cosmosView: CosmosView = {
        var view = CosmosView()
        view.settings.updateOnTouch = false
        view.settings.fillMode = .precise
        view.settings.starSize = 25
        view.settings.filledImage = UIImage(named: "star.filled")?.withRenderingMode(.alwaysTemplate)
        view.settings.emptyImage = UIImage(named: "star.empty")?.withRenderingMode(.alwaysTemplate)
        view.settings.textFont = .sans(ofSize: 17, weight: .medium)
        return view
    }()
    
    lazy private var priceLabel: UILabel = {
        let label = UILabel()
        label.text = "0$"
        label.font = .sans(ofSize: 19, weight: .bold)
        label.textColor = .label
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
        backgroundColor = .systemBackground
    }
    
    private func setupLayout() {
        addSubview(cosmosView)
        cosmosView.centerY(to: self)
        cosmosView.leading(to: self, constant: 25)
        
        addSubview(priceLabel)
        priceLabel.centerY(to: self)
        priceLabel.trailing(to: self, constant: 25)
    }
    
    // MARK: - Configuration
    
    func configure(rate: Rating, price: Double) {
        cosmosView.rating = rate.rate
        cosmosView.text = "(\(rate.count))"
        priceLabel.text = "\(String(format: "%.2f", price))$"
    }
}
