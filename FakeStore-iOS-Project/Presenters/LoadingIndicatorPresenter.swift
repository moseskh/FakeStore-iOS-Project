//
//  LoadingIndicatorPresenter.swift
//  FakeStore-iOS-Project
//
//  Created by Moses Kh. on 15/06/2024.
//

import UIKit

final class LoadingIndicatorPresenter {
    
    static let shared = LoadingIndicatorPresenter()
    
    private var loadingIndicator: UIActivityIndicatorView?
    private var overlayView: UIView?
    
    private init() { }
    
    func showLoadingIndicator(on view: UIView) {
        DispatchQueue.main.async {
            self.createOverlay(on: view)
            self.createLoadingIndicator(on: self.overlayView!)
            self.loadingIndicator?.startAnimating()
        }
    }
    
    func hideLoadingIndicator() {
        DispatchQueue.main.async {
            self.loadingIndicator?.stopAnimating()
            self.clearOverlay()
        }
    }
    
    private func createOverlay(on view: UIView) {
        let overlayView = UIView()
        
        view.addSubview(overlayView)
        overlayView.leading(to: view)
        overlayView.trailing(to: view)
        overlayView.safeTop(to: view)
        overlayView.bottom(to: view)
        
        self.overlayView = overlayView
    }
    
    private func createLoadingIndicator(on view: UIView) {
        let loadingIndicator = UIActivityIndicatorView(style: .large)
        loadingIndicator.hidesWhenStopped = true
        
        view.addSubview(loadingIndicator)
        loadingIndicator.centerX(to: view)
        loadingIndicator.centerY(to: view)
        
        self.loadingIndicator = loadingIndicator
    }
    
    private func clearOverlay() {
        self.loadingIndicator?.removeFromSuperview()
        self.overlayView?.removeFromSuperview()
        self.loadingIndicator = nil
        self.overlayView = nil
    }
}
