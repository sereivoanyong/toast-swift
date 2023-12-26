//
//  ToastHelper.swift
//  Toast
//
//  Created by Bas Jansen on 16/09/2023.
//

import UIKit

enum ToastHelper {

    public static func topController() -> UIViewController? {
        if var topController = keyWindow()?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            return topController
        }
        return nil
    }

    private static func keyWindow() -> UIWindow? {
        for scene in UIApplication.shared.connectedScenes {
            guard let windowScene = scene as? UIWindowScene else {
                continue
            }
            if windowScene.windows.isEmpty {
                continue
            }
            guard let window = windowScene.windows.first(where: { $0.isKeyWindow }) else {
                continue
            }
            return window
        }
        return nil
    }
}
