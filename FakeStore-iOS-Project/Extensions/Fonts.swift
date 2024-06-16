//
//  Fonts.swift
//  FakeStore-iOS-Project
//
//  Created by Moses Kh. on 09/06/2024.
//

import UIKit

extension UIFont {
    
    enum FontWeight: String {
        case regular = "Regular"
        case medium = "Medium"
        case bold = "Bold"
    }
    
    static func sans(ofSize size: CGFloat, weight: FontWeight) -> UIFont {
        guard let font = UIFont(name: "OpenSans-\(weight.rawValue)", size: size) else {
            return UIFont.systemFont(ofSize: size, weight: UIFont.Weight(weight))
        }
        return UIFontMetrics.default.scaledFont(for: font)
    }
}

private extension UIFont.Weight {
    init(_ fontWeight: UIFont.FontWeight) {
        switch fontWeight {
        case .regular:
            self = .regular
        case .medium:
            self = .medium
        case .bold:
            self = .bold
        }
    }
}
