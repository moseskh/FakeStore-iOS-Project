//
//  ProductsListViewController.swift
//  FakeStore-iOS-Project
//
//  Created by Moses Kh. on 09/06/2024.
//

import UIKit

class ProductsListViewController: UIViewController {
    
    // MARK: - Properties
    
    var products: [Product]?
    private let cacheKey = "cachedProductsList"
    
    // MARK: - UI Elements
    
    let productsListCollectionView: UICollectionView = ProductsListCollectionView()
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
        setupRefreshControl()
        fetchProducts()
        setupLayout()
    }
    
    // MARK: - View Configuration
    
    private func setupViewController() {
        view.backgroundColor = .systemBackground
        let imageView = UIImageView(image: UIImage(named: "appLogo")?.withRenderingMode(.alwaysOriginal))
        imageView.contentMode = .scaleAspectFit
        navigationItem.titleView = imageView
    }
    
    private func setupRefreshControl() {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
        productsListCollectionView.refreshControl = refreshControl
    }
    
    private func setupLayout() {
        productsListCollectionView.delegate = self
        productsListCollectionView.dataSource = self
        
        view.addSubview(productsListCollectionView)
        productsListCollectionView.leading(to: view)
        productsListCollectionView.trailing(to: view)
        productsListCollectionView.safeTop(to: view)
        productsListCollectionView.bottom(to: view)
    }
    
    // MARK: - Actions
    
    @objc private func handleRefresh() {
        DispatchQueue.global().async {
            self.products?.removeAll()
            CachingManager.shared.invalidateCache(forKey: self.cacheKey)
            DispatchQueue.main.async {
                self.productsListCollectionView.reloadData()
                self.retrieveProducts()
                self.productsListCollectionView.refreshControl?.endRefreshing()
            }
        }
    }
    
    // MARK: - Data Fetching
    
    private func fetchProducts() {
        if let cachedProducts: [Product] = CachingManager.shared.getCachedData(forKey: cacheKey) {
            self.products = cachedProducts
            self.productsListCollectionView.reloadData()
        } else {
            retrieveProducts()
        }
    }
    
    private func retrieveProducts() {
        LoadingIndicatorPresenter.shared.showLoadingIndicator(on: view)
        APICaller.shared.getProductsList { [weak self] (result: Result<[Product], Error>) in
            guard let self = self else { return }
            switch result {
            case .success(let products):
                self.products = products
                DispatchQueue.main.async {
                    self.productsListCollectionView.reloadData()
                    LoadingIndicatorPresenter.shared.hideLoadingIndicator()
                }
                CachingManager.shared.cacheData(products, forKey: self.cacheKey)
            case .failure(let error):
                DispatchQueue.main.async {
                    LoadingIndicatorPresenter.shared.hideLoadingIndicator()
                    let message = (error as? APICaller.APIError)?.errorDescription ?? error.localizedDescription
                    AlertPresenter.presentErrorAlert(from: self, message: message) {
                        self.retrieveProducts()
                    }
                }
            }
        }
    }
}
