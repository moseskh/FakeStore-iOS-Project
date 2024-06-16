//
//  ProductImageHeader.swift
//  FakeStore-iOS-Project
//
//  Created by Moses Kh. on 11/06/2024.
//

import UIKit
import SDWebImage

class ProductImageHeader: UITableViewHeaderFooterView {
    
    // MARK: - Constants
    
    static let baseHeight: CGFloat = 300
    
    // MARK: - UI Elements
    
    lazy private var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    // MARK: - Initialization
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemBackground
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with image: String){
        imageView.sd_setImage(with: URL(string: image))
    }
    
    // MARK: - layout Setup
    
    private func setupLayout() {
        contentView.addSubview(imageView)
        
        imageView.leading(to: self)
        imageView.trailing(to: self)
        imageView.top(to: self, constant: 10)
        imageView.bottom(to: self, constant: 10)
    }
}
