//
//  ProductTableViewControllerDataSource.swift
//  FakeStore-iOS-Project
//
//  Created by Moses Kh. on 13/06/2024.
//

import UIKit

extension ProductViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch sections[section] {
        case .suggestedProducts:
            return 1
        case .productDescription(model: let model):
            return model.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch sections[indexPath.section] {
        case .suggestedProducts(let products):
            let cell = tableView.dequeueReusableCell(withIdentifier: SuggestedProductsTableViewCell.identifier, for: indexPath) as! SuggestedProductsTableViewCell
            cell.configure(with: products)
            cell.delegate = self
            return cell
        case .productDescription(let model):
            switch model[indexPath.row] {
            case .title(let title, let description):
                let cell = tableView.dequeueReusableCell(withIdentifier: ProductTitleTableViewCell.identifier, for: indexPath) as! ProductTitleTableViewCell
                cell.configure(title: title, description: description)
                return cell
            case .rating(let rate, let price):
                let cell = tableView.dequeueReusableCell(withIdentifier: ProductRatingTableViewCell.identifier, for: indexPath) as! ProductRatingTableViewCell
                cell.configure(rate: rate, price: price)
                return cell
            }
        }
    }
}
