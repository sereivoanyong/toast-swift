//
//  DefaultToastView.swift
//  Toast
//
//  Created by Bastiaan Jansen on 29/06/2021.
//

import Foundation
import UIKit

public class IconAppleToastView : UIStackView {
    let viewConfig: ToastViewConfiguration
    private lazy var vStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 2
        
        return stackView
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        var constrainsts: [NSLayoutConstraint] = []
        if viewConfig.imageSize.width != UIView.noIntrinsicMetric {
            constrainsts.append(imageView.widthAnchor.constraint(equalToConstant: viewConfig.imageSize.width))
        }
        if viewConfig.imageSize.height != UIView.noIntrinsicMetric {
            constrainsts.append(imageView.heightAnchor.constraint(equalToConstant: viewConfig.imageSize.height))
        }
        NSLayoutConstraint.activate(constrainsts)
        
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        UILabel()
    }()
    
    private lazy var subtitleLabel: UILabel = {
        UILabel()
    }()
    
    public static var defaultImageTint: UIColor {
        if #available(iOS 13.0, *) {
            return .label
        } else {
            return .black
        }
    }
    
    public init(
        image: UIImage? = nil,
        imageTint: UIColor? = defaultImageTint,
        title: NSAttributedString,
        subtitle: NSAttributedString? = nil,
        viewConfig: ToastViewConfiguration
    ) {
        self.viewConfig = viewConfig
        super.init(frame: CGRect.zero)
        commonInit()

        if let image {
            imageView.tintColor = imageTint
            imageView.image = image
            addArrangedSubview(imageView)
        }

        vStack.alignment = viewConfig.textAlignment

        titleLabel.attributedText = title
        titleLabel.numberOfLines = viewConfig.titleNumberOfLines
        vStack.addArrangedSubview(titleLabel)
        
        if let subtitle {
            subtitleLabel.attributedText = subtitle
            subtitleLabel.numberOfLines = viewConfig.subtitleNumberOfLines
            vStack.addArrangedSubview(subtitleLabel)
        }

        addArrangedSubview(vStack)
    }

    public init(
        image: UIImage? = nil,
        imageTint: UIColor? = defaultImageTint,
        title: String,
        subtitle: String? = nil,
        viewConfig: ToastViewConfiguration
    ) {
        self.viewConfig = viewConfig
        super.init(frame: CGRect.zero)
        commonInit()

        if let image {
            imageView.tintColor = imageTint
            imageView.image = image
            addArrangedSubview(imageView)
        }

        vStack.alignment = viewConfig.textAlignment

        titleLabel.font = .systemFont(ofSize: 14, weight: .bold)
        titleLabel.text = title
        titleLabel.numberOfLines = viewConfig.titleNumberOfLines
        vStack.addArrangedSubview(titleLabel)
        
        if let subtitle {
            subtitleLabel.font = .systemFont(ofSize: 12)
            subtitleLabel.textColor = .secondaryLabel
            subtitleLabel.text = subtitle
            subtitleLabel.numberOfLines = viewConfig.subtitleNumberOfLines
            vStack.addArrangedSubview(subtitleLabel)
        }

        addArrangedSubview(vStack)
    }

    public init(
        image: UIImage? = nil,
        imagePreferredSymbolConfiguration: UIImage.SymbolConfiguration? = nil,
        imageTintColor: UIColor? = defaultImageTint,
        imageContentMode: UIView.ContentMode = .scaleAspectFill,
        title: String,
        subtitle: String? = nil,
        buttonConfiguration: UIButton.Configuration?,
        buttonAction: UIAction?,
        viewConfig: ToastViewConfiguration
    ) {
        self.viewConfig = viewConfig
        super.init(frame: CGRect.zero)
        commonInit()

        if let image {
            imageView.contentMode = imageContentMode
            imageView.preferredSymbolConfiguration = imagePreferredSymbolConfiguration
            imageView.tintColor = imageTintColor
            imageView.image = image
            addArrangedSubview(imageView)
            setCustomSpacing(viewConfig.imageToTextPadding, after: imageView)
        }

        vStack.alignment = viewConfig.textAlignment

        titleLabel.font = .systemFont(ofSize: 14, weight: .bold)
        titleLabel.text = title
        titleLabel.numberOfLines = viewConfig.titleNumberOfLines
        vStack.addArrangedSubview(titleLabel)

        if let subtitle {
            subtitleLabel.font = .systemFont(ofSize: 12)
            subtitleLabel.textColor = .secondaryLabel
            subtitleLabel.text = subtitle
            subtitleLabel.numberOfLines = viewConfig.subtitleNumberOfLines
            vStack.addArrangedSubview(subtitleLabel)
        }

        addArrangedSubview(vStack)

        if let buttonConfiguration {
            let button = UIButton(configuration: buttonConfiguration, primaryAction: buttonAction)
            addArrangedSubview(button)
            setCustomSpacing(viewConfig.textToButtonPadding, after: vStack)

            button.translatesAutoresizingMaskIntoConstraints = false
            var constrainsts: [NSLayoutConstraint] = []
            if viewConfig.buttonSize.width != UIView.noIntrinsicMetric {
                constrainsts.append(button.widthAnchor.constraint(equalToConstant: viewConfig.buttonSize.width))
            }
            if viewConfig.buttonSize.height != UIView.noIntrinsicMetric {
                constrainsts.append(button.heightAnchor.constraint(equalToConstant: viewConfig.buttonSize.height))
            }
            NSLayoutConstraint.activate(constrainsts)
        }
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        axis = .horizontal
        alignment = .center
        distribution = .fill
    }
}
