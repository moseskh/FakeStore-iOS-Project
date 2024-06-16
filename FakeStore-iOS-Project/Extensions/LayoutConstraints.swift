//
//  LayoutConstraints.swift
//  FakeStore-iOS-Project
//
//  Created by Moses Kh. on 09/06/2024.
//

import UIKit

extension UIView {
    
    // MARK: - TOP
    func top(to view: UIView, constant: CGFloat = 0) {
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: view.topAnchor, constant: constant)
        ])
    }
    
    func topToAnchor(to anchor: NSLayoutYAxisAnchor, constant: CGFloat = 0) {
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: anchor, constant: constant)
        ])
    }
    
    func safeTop(to view: UIView, constant: CGFloat = 0) {
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: constant)
        ])
    }
    
    
    // MARK: - LEADING
    func leading(to view: UIView, constant: CGFloat = 0) {
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: constant)
        ])
    }
    
    func leadingToAnchor(to anchor: NSLayoutXAxisAnchor, constant: CGFloat = 0) {
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.leadingAnchor.constraint(equalTo: anchor, constant: constant)
        ])
    }
    
    
    // MARK: - TRAILING
    func trailing(to view: UIView, constant: CGFloat = 0) {
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -constant)
        ])
    }
    
    func trailingToAnchor(to anchor: NSLayoutXAxisAnchor, constant: CGFloat = 0) {
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.trailingAnchor.constraint(equalTo: anchor, constant: -constant)
        ])
    }
    
    
    // MARK: - BOTTOM
    func bottom(to view: UIView, constant: CGFloat = 0) {
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -constant)
        ])
    }
    
    func bottomToAnchor(to anchor: NSLayoutYAxisAnchor, constant: CGFloat = 0) {
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.bottomAnchor.constraint(equalTo: anchor, constant: -constant)
        ])
    }
    
    func safeBottom(to view: UIView, constant: CGFloat = 0) {
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -constant)
        ])
    }
    
    
    // MARK: - CENTER Y
    func centerY(to view: UIView, constant: CGFloat = 0) {
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: constant)
        ])
    }
    
    
    // MARK: - CENTER X
    func centerX(to view: UIView, constant: CGFloat = 0) {
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: constant)
        ])
    }
    
    
    // MARK: - HEIGHT
    func heightConstant(constant: CGFloat) {
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: constant)
        ])
    }
    
    func height(of view: UIView, multiplier: CGFloat = 1) {
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: multiplier)
        ])
    }
    
    func heightEqualWidth() {
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalTo: self.widthAnchor)
        ])
    }
    
    // MARK: - WIDTH
    func widthConstant(constant: CGFloat) {
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.widthAnchor.constraint(equalToConstant: constant)
        ])
    }
    
    func width(of view: UIView, multiplier: CGFloat = 1) {
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: multiplier)
        ])
    }
    
    func widthEqualHeight() {
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.widthAnchor.constraint(equalTo: self.heightAnchor)
        ])
    }
}
