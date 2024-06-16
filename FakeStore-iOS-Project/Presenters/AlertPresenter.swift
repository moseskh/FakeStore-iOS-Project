//
//  AlertPresenter.swift
//  FakeStore-iOS-Project
//
//  Created by Moses Kh. on 13/06/2024.
//

import UIKit

final class AlertPresenter {
    
    static func presentErrorAlert(from viewController: UIViewController, message: String, retryHandler: @escaping () -> Void) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        
        let retryAction = UIAlertAction(title: "Retry", style: .default) { _ in
            retryHandler()
        }
        alert.addAction(retryAction)
        
        if shouldShowBackAction(in: viewController) {
            let backAction = UIAlertAction(title: "Back", style: .cancel) { _ in
                viewController.navigationController?.popViewController(animated: true)
            }
            alert.addAction(backAction)
        }
        
        viewController.present(alert, animated: true, completion: nil)
    }
    
    private static func shouldShowBackAction(in viewController: UIViewController) -> Bool {
        if let navigationController = viewController.navigationController {
            return navigationController.viewControllers.first != viewController
        }
        return false
    }
}
