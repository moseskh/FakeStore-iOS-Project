//
//  NetworkStatusView.swift
//  FakeStore-iOS-Project
//
//  Created by Moses Kh. on 16/06/2024.
//

import UIKit

class NetworkStatusView: UIView {
    
    // MARK: - UI Elements

    private let statusLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .sans(ofSize: 15, weight: .medium)
        label.textColor = .white
        return label
    }()
    
    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle

    override func layoutSubviews() {
        layer.masksToBounds = true
        layer.cornerRadius = frame.height * 0.25
    }
    
    
    // MARK: - Layout Setup

    private func setupView() {
        addSubview(statusLabel)
        statusLabel.centerY(to: self)
        statusLabel.leading(to: self)
        statusLabel.trailing(to: self)
    }
    
    // MARK: - View Presentation

    func updateStatus(isConnected: Bool) {
        statusLabel.text = isConnected ? "Connected" : "No Internet Connection"
        backgroundColor = isConnected ? .systemGreen : .systemRed
    }
    
    func show(in view: UIView) {
        frame = CGRect(x: 0, y: view.frame.height, width: view.frame.width, height: 50)
        view.addSubview(self)
        UIView.animate(withDuration: 0.5) {
            self.frame.origin.y = view.frame.height - 50
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) { [weak self] in
            self?.hide()
        }
    }
    
    func hide() {
        UIView.animate(withDuration: 0.5, animations: {
            self.frame.origin.y = self.superview?.frame.height ?? UIScreen.main.bounds.height
        }) { _ in
            self.removeFromSuperview()
        }
    }
}
