//
//  ProductTableViewControllerDelegate.swift
//  FakeStore-iOS-Project
//
//  Created by Moses Kh. on 15/06/2024.
//

import UIKit

extension ProductViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch sections[section] {
        case .productDescription:
            return .leastNormalMagnitude
        case .suggestedProducts:
            return 60
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch sections[indexPath.section] {
        case .productDescription(model: let model):
            switch model[indexPath.row] {
            case .title:
                return UITableView.automaticDimension
            case .rating:
                return 65
            }
        case .suggestedProducts:
            return 250
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: ProductTableSectionHeaderView.reuseIdentifier) as? ProductTableSectionHeaderView else {
            return UITableViewHeaderFooterView()
        }
        header.setTitle("Products from the same category")
        return header
    }
}
