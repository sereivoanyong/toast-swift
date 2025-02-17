//
//  ToastConfiguration.swift
//  Toast
//
//  Created by Bastiaan Jansen on 28/06/2021.
//

import UIKit

public struct ToastConfiguration {

    public let direction: Toast.Direction
    public let dismissables: [Toast.Dismissable]
    public let animationTime: TimeInterval
    public let enteringAnimation: Toast.AnimationType
    public let exitingAnimation: Toast.AnimationType
    public let background: Toast.Background

    /// Creates a new Toast configuration object.
    /// - Parameters:
    ///   - direction: The position the toast will be displayed.
    ///   - dismissBy: Choose when the toast dismisses.
    ///   - animationTime:Duration of the animation
    ///   - enteringAnimation: The entering animation of the toast.
    ///   - exitingAnimation: The exiting animation of the toast.
    public init(
        direction: Toast.Direction = .top,
        dismissBy: [Toast.Dismissable] = [.time(time: 4.0), .swipe(direction: .natural)],
        animationTime: TimeInterval = 0.2,
        enteringAnimation: Toast.AnimationType = .default,
        exitingAnimation: Toast.AnimationType = .default,
        background: Toast.Background = .none
    ) {
        self.direction = direction
        self.dismissables = dismissBy
        self.animationTime = animationTime
        self.enteringAnimation = enteringAnimation.isDefault ? Self.defaultEnteringAnimation(with: direction) : enteringAnimation
        self.exitingAnimation = exitingAnimation.isDefault ? Self.defaultExitingAnimation(with: direction) : exitingAnimation
        self.background = background
    }
}

// MARK: Default animations
extension ToastConfiguration {

    private static func defaultEnteringAnimation(with direction: Toast.Direction) -> Toast.AnimationType {
        switch direction {
        case .top:
            return .custom(
                transformation: CGAffineTransform(scaleX: 0.9, y: 0.9).translatedBy(x: 0, y: -100)
            )
        case .bottom:
            return .custom(
                transformation: CGAffineTransform(scaleX: 0.9, y: 0.9).translatedBy(x: 0, y: 100)
            )
        case .center:
            return .custom(
                transformation: CGAffineTransform(scaleX: 0.5, y: 0.5)
            )
        }
    }
    
    private static func defaultExitingAnimation(with direction: Toast.Direction) -> Toast.AnimationType {
        self.defaultEnteringAnimation(with: direction)
    }
}
