//
//  ToastViewConfiguration.swift
//  Toast
//
//  Created by Thomas Maw on 12/9/2023.
//

import Foundation
import UIKit

@MainActor public struct ToastViewConfiguration {
    public let minHeight: CGFloat
    public let minWidth: CGFloat
    
    public var background: Toast.Background
    
    public let titleNumberOfLines: Int
    public let subtitleNumberOfLines: Int
    
    public let cornerRadius: CGFloat?

    public let textAlignment: UIStackView.Alignment

    public var imageSize: CGSize = CGSize(width: 28, height: 28)
    public var buttonSize: CGSize = CGSize(width: UIView.noIntrinsicMetric, height: 32)
    public var imageToTextPadding: CGFloat = 8
    public var textToButtonPadding: CGFloat = 12
    public var insets: NSDirectionalEdgeInsets = NSDirectionalEdgeInsets(top: 10, leading: 25, bottom: 10, trailing: 25)

    @available(iOS 13.0, *)
    public init(
        minHeight: CGFloat = 58,
        minWidth: CGFloat = 150,
        darkBackgroundColor: UIColor = UIColor(red: 0.13, green: 0.13, blue: 0.13, alpha: 1.00),
        lightBackgroundColor: UIColor = UIColor(red: 0.99, green: 0.99, blue: 0.99, alpha: 1.00),
        titleNumberOfLines: Int = 1,
        subtitleNumberOfLines: Int = 1,
        cornerRadius: CGFloat? = nil,
        textAlignment: UIStackView.Alignment = .center
    ) {
        self.minHeight = minHeight
        self.minWidth = minWidth
        self.background = .color(color: UIColor(dynamicProvider: { traitCollection in
            return traitCollection.userInterfaceStyle == .dark ? darkBackgroundColor : lightBackgroundColor
        }))
        self.titleNumberOfLines = titleNumberOfLines
        self.subtitleNumberOfLines = subtitleNumberOfLines
        self.cornerRadius = cornerRadius
        self.textAlignment = textAlignment
    }

    public init(
        minHeight: CGFloat = 58,
        minWidth: CGFloat = 150,
        backgroundColor: UIColor = UIColor(red: 0.99, green: 0.99, blue: 0.99, alpha: 1.00),
        titleNumberOfLines: Int = 1,
        subtitleNumberOfLines: Int = 1,
        cornerRadius: CGFloat? = nil,
        textAlignment: UIStackView.Alignment = .center
    ) {
        self.minHeight = minHeight
        self.minWidth = minWidth
        self.background = .color(color: backgroundColor)
        self.titleNumberOfLines = titleNumberOfLines
        self.subtitleNumberOfLines = subtitleNumberOfLines
        self.cornerRadius = cornerRadius
        self.textAlignment = textAlignment
    }

    public init(
        minimumWidth: CGFloat = 150,
        minimumHeight: CGFloat = 58,
        background: Toast.Background,
        titleNumberOfLines: Int = 1,
        subtitleNumberOfLines: Int = 1,
        cornerRadius: CGFloat? = nil,
        textAlignment: UIStackView.Alignment = .center
    ) {
        self.minWidth = minimumWidth
        self.minHeight = minimumHeight
        self.background = background
        self.titleNumberOfLines = titleNumberOfLines
        self.subtitleNumberOfLines = subtitleNumberOfLines
        self.cornerRadius = cornerRadius
        self.textAlignment = textAlignment
    }
}
