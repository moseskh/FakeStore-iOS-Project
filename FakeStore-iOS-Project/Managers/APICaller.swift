//
//  APICaller.swift
//  FakeStore-iOS-Project
//
//  Created by Moses Kh. on 09/06/2024.
//

import Foundation

final class APICaller {
    
    static let shared = APICaller()
    
    private init() { }
    
    struct Constants {
        static let baseAPIURL = "https://fakestoreapi.com"
        static let productsKey = "products"
        static let categoriesKey = "products/category"
    }
    
    enum APIError: Error, LocalizedError {
        case invalidURL
        case requestFailed
        case decodingFailed
        
        var errorDescription: String? {
            switch self {
            case .invalidURL:
                return "The URL provided was invalid. Please try again."
            case .requestFailed:
                return "The request failed. Please check your network connection and try again."
            case .decodingFailed:
                return "There was an error processing the response. Please try again later."
            }
        }
    }
    
    func getProductsList(completion: @escaping (Result<[Product], Error>) -> Void) {
        performRequest(with: "\(Constants.baseAPIURL)/\(Constants.productsKey)", completion: completion)
    }
    
    func getSuggestedProductsFor(_ product: Product, completion: @escaping (Result<[Product], Error>) -> Void) {
        performRequest(with: "\(Constants.baseAPIURL)/\(Constants.categoriesKey)/\(product.category)", completion: completion)
    }
    
    func getProduct(productId: Int, completion: @escaping (Result<Product, Error>) -> Void) {
        performRequest(with: "\(Constants.baseAPIURL)/\(Constants.productsKey)/\(productId)", completion: completion)
    }
    
    private func performRequest<T: Decodable>(with urlString: String, completion: @escaping (Result<T, Error>) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(APIError.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(APIError.requestFailed))
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedData))
            } catch {
                completion(.failure(APIError.decodingFailed))
            }
        }
        
        task.resume()
    }
}
