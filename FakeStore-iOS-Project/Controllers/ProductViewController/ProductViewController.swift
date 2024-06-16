//
//  ProductViewController.swift
//  FakeStore-iOS-Project
//
//  Created by Moses Kh. on 10/06/2024.
//

import UIKit

class ProductViewController: UIViewController {
    
    // MARK: - Properties
    
    var productId: Int
    var sections = [ProductTableSection]()
    
    // MARK: - UI Elements
    
    let productTableView: UITableView = ProductTableView()
    private let tableHeaderView: ProductImageHeader = ProductImageHeader(
        frame: CGRect(origin: .zero, size: CGSize(width: .zero, height: ProductImageHeader.baseHeight))
    )
    
    // MARK: - Initializers
    
    init(productId: Int) {
        self.productId = productId
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
        setupProductTableView()
        setupRefreshControl()
        fetchProduct()
    }
    
    // MARK: - View Configuration
    
    private func setupProductTableView(){
        productTableView.dataSource = self
        productTableView.delegate = self
        
        view.addSubview(productTableView)
        productTableView.leading(to: view)
        productTableView.trailing(to: view)
        productTableView.safeTop(to: view)
        productTableView.bottom(to: view)
    }
    
    private func setupViewController() {
        view.backgroundColor = .systemBackground
        let shareButton = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"), style: .done, target: self, action: #selector(didTapShareButton))
        navigationItem.setRightBarButton(shareButton, animated: false)
    }
    
    private func setupRefreshControl() {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
        productTableView.refreshControl = refreshControl
    }
    
    // MARK: - Actions
    
    @objc private func didTapShareButton() {
        let shareText = "Check out this cool product: https://fakestoreapi.com/products/\(productId)"
        let activityViewController = UIActivityViewController(activityItems: [shareText], applicationActivities: nil)
        present(activityViewController, animated: true, completion: nil)
    }
    
    @objc private func handleRefresh() {
        DispatchQueue.global().async {
            CachingManager.shared.invalidateCache(forKey: "product:\(self.productId)")
            self.sections.removeAll()
            DispatchQueue.main.async {
                self.productTableView.tableHeaderView = nil
                self.productTableView.reloadData()
                self.fetchProduct()
                self.productTableView.refreshControl?.endRefreshing()
            }
        }
    }
    
    // MARK: - Data Fetching
    
    private func fetchProduct() {
        if let cachedProduct: Product = CachingManager.shared.getCachedData(forKey: "product:\(productId)") {
            updateProductDescription(with: cachedProduct)
            fetchSuggestedProducts(for: cachedProduct)
        } else {
            getProduct()
        }
    }
    
    private func getProduct() {
        LoadingIndicatorPresenter.shared.showLoadingIndicator(on: view)
        APICaller.shared.getProduct(productId: productId) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let updatedProduct):
                DispatchQueue.main.async {
                    self.updateProductDescription(with: updatedProduct)
                    self.fetchSuggestedProducts(for: updatedProduct)
                    self.productTableView.reloadData()
                    LoadingIndicatorPresenter.shared.hideLoadingIndicator()
                }
                CachingManager.shared.cacheData(updatedProduct, forKey: "product:\(self.productId)")
            case .failure(let error):
                let message = (error as? APICaller.APIError)?.errorDescription ?? error.localizedDescription
                DispatchQueue.main.async {
                    LoadingIndicatorPresenter.shared.hideLoadingIndicator()
                    AlertPresenter.presentErrorAlert(from: self, message: message) {
                        self.fetchProduct()
                    }
                }
            }
        }
    }
    
    private func fetchSuggestedProducts(for product: Product) {
        APICaller.shared.getSuggestedProductsFor(product) { [weak self] (result: Result<[Product], Error>) in
            guard let self = self else { return }
            switch result {
            case .success(let products):
                let suggestedProducts = products.filter { $0.id != self.productId }
                self.sections.append(.suggestedProducts(model: suggestedProducts))
                DispatchQueue.main.async {
                    self.productTableView.reloadData()
                }
            case .failure(let error):
                print("Failed to fetch product: \(String(describing: (error as? APICaller.APIError)?.errorDescription))")
            }
        }
    }
    
    private func updateProductDescription(with product: Product) {
        sections.append(.productDescription(model: [
            .title(title: product.title, description: product.description),
            .rating(rate: product.rating, price: product.price)
        ]))
        productTableView.tableHeaderView = tableHeaderView
        tableHeaderView.configure(with: product.image)
    }
}
