//
//  AlertView.swift
//  peer-ios
//
//  Created by Navon Hobby on 1/16/23.
//

import UIKit

@objc protocol AlertViewDelegate: AnyObject {
    @objc optional func alertViewPresent()
    @objc optional func alertViewDisappear()
    @objc optional func alertViewOkPressed()
    @objc optional func cancelTapped()
    @objc optional func confirmTapped()
}

class AlertView: GradientBackgroundView {
    
    // The view controller that the alert view will be displayed in
    weak var viewController: UIViewController?
    
    var alertViewDelegate: AlertViewDelegate?
    var isOkayCallbacked = false
    private let alertView = UIView()
    private let headingLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let okButton = AnimatedButton()
    private let cancelButton = AnimatedButton()
    var okButtonTopConstraint: NSLayoutConstraint!
    var okButtonBottomConstraint: NSLayoutConstraint!
    var alertType: AlertType?
    var headingTitle: String = "" {
        didSet {
            headingLabel.text = headingTitle
        }
    }
    var descriptionTitle: String = "" {
        didSet {
            descriptionLabel.text = descriptionTitle
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch: UITouch? = touches.first
        if touch?.view != alertView {
            hideAlertView()
        }
    }
    override func setupView() {
        super.setupView()
        addAlertView()
        addOkButton()
        addHeadingLabel()
        addDescriptionLabel()
        // Add constraints
        let descriptionBottomConstant = descriptionTitle == "" ? 0 : -LayoutConstants.Spacing.spacing3x
        okButtonTopConstraint = descriptionLabel.bottomAnchor.constraint(equalTo: okButton.topAnchor,
                                                                         constant: descriptionBottomConstant)
        okButtonBottomConstraint = okButton.bottomAnchor.constraint(equalTo: alertView.bottomAnchor,
                                                                    constant: -LayoutConstants.Spacing.spacing3x)
        alertView.translatesAutoresizingMaskIntoConstraints = false
        okButton.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        headingLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            alertView.leadingAnchor.constraint(equalTo: self.leadingAnchor,
                                               constant: LayoutConstants.Spacing.spacing3x),
            alertView.trailingAnchor.constraint(equalTo: self.trailingAnchor,
                                                constant: -LayoutConstants.Spacing.spacing3x),
            alertView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            okButton.leadingAnchor.constraint(equalTo: alertView.leadingAnchor,
                                              constant: LayoutConstants.Spacing.spacing2x3Quarter),
            okButton.trailingAnchor.constraint(equalTo: alertView.trailingAnchor,
                                               constant: -LayoutConstants.Spacing.spacing2x3Quarter),
            okButtonBottomConstraint,
            okButton.heightAnchor.constraint(equalToConstant: LayoutConstants.Height.large),
            headingLabel.topAnchor.constraint(equalTo: alertView.topAnchor,
                                              constant: LayoutConstants.Spacing.spacing3x),
            headingLabel.leadingAnchor.constraint(equalTo: alertView.leadingAnchor,
                                                  constant: LayoutConstants.Spacing.spacing2x3Quarter),
            headingLabel.trailingAnchor.constraint(equalTo: alertView.trailingAnchor,
                                                   constant: -LayoutConstants.Spacing.spacing2x3Quarter),
            descriptionLabel.topAnchor.constraint(equalTo: headingLabel.bottomAnchor,
                                                  constant: LayoutConstants.Spacing.spacing2x),
            descriptionLabel.leadingAnchor.constraint(equalTo: alertView.leadingAnchor,
                                                      constant: LayoutConstants.Spacing.spacing2x3Quarter),
            descriptionLabel.trailingAnchor.constraint(equalTo: alertView.trailingAnchor,
                                                       constant: -LayoutConstants.Spacing.spacing2x3Quarter),
            okButtonTopConstraint
        ])
    }
    func addAlertView() {
        alertView.center = self.center
        alertView.backgroundColor = UIColor.black
        alertView.layer.cornerRadius = 25
        alertView.addSubview(okButton)
        self.bringSubviewToFront(alertView)
        self.addSubview(alertView)
    }
    func addHeadingLabel() {
        headingLabel.text = headingTitle
        headingLabel.textAlignment = .left
        headingLabel.numberOfLines = 0
        headingLabel.font =  UIFontMetrics.default.scaledFont(for: AlertFonts.title3!.applySemibold())
        headingLabel.textColor = .white
        alertView.addSubview(headingLabel)
    }
    func addDescriptionLabel() {
        descriptionLabel.text = descriptionTitle
        descriptionLabel.textAlignment = .left
        descriptionLabel.numberOfLines = 0
        alertView.addSubview(descriptionLabel)
    }
    func addHeadingLabelText() {
        let font = UIFontMetrics.default.scaledFont(for: AlertFonts.title3!.applySemibold())
        let attributedString = NSMutableAttributedString(string: headingTitle)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = CGFloat(0.26 - font.pointSize)
        attributedString.addAttribute(.paragraphStyle, value: paragraphStyle,
                                      range: NSRange(location: 0, length: headingTitle.utf16.count))
        attributedString.addAttribute(.kern, value: -0.52,
                                      range: NSRange(location: 0, length: headingTitle.utf16.count))
        attributedString.addAttribute(.font, value: font,
                                      range: NSRange(location: 0, length: headingTitle.utf16.count))
        headingLabel.attributedText = attributedString
    }
    func addDescriptionLabelText() {
        let attributedString = NSMutableAttributedString(string: descriptionTitle)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = CGFloat(0.5 - AlertFonts.smallBody!.applyMedium().pointSize)
        attributedString.addAttribute(.kern, value: 0.16,
                                      range: NSRange(location: 0, length: descriptionTitle.utf16.count))
        attributedString.addAttribute(.paragraphStyle,
                                      value: paragraphStyle,
                                      range: NSRange(location: 0, length: descriptionTitle.utf16.count))
        attributedString.addAttribute(.font,
                                      value: UIFontMetrics.default.scaledFont(for: AlertFonts.smallBody!.applyMedium()),
                                      range: NSRange(location: 0, length: descriptionTitle.utf16.count))
        attributedString.addAttribute(.foregroundColor,
                                      value: Colors.grayText,
                                      range: NSRange(location: 0, length: descriptionTitle.utf16.count))
        descriptionLabel.attributedText = attributedString
    }
    func addOkButton() {
        okButton.setTitle(NSLocalizedString("OK", comment: ""), for: .normal)
        okButton.setTitleColor(.black, for: .normal)
        okButton.titleLabel?.font = UIFontMetrics.default.scaledFont(for: AlertFonts.smallBody!.applyBold())
        okButton.titleLabel?.setText(NSLocalizedString("OK", comment: ""), spacing: 1)
        okButton.backgroundColor = .white
        okButton.addTarget(self, action: #selector(okTapped), for: .touchUpInside)
        okButton.layer.cornerRadius = 10
        alertView.addSubview(okButton)
    }
    @objc func okTapped() {
        hideAlertView()
        if alertType == .request {
            alertViewDelegate?.confirmTapped?()
        }
    }
    func hideAlertView() {
        ButtonHaptic.generateSoftHaptic()
        showAnimation(fromY: CGPoint(x: UIScreen.main.bounds.width/2, y: self.frame.size.height/2 + 25),
                      toY: CGPoint(x: UIScreen.main.bounds.width - 200, y: -self.frame.size.height/2),
                      isShowing: false,
                      fromZ: CGFloat(-5.0 / 180.0 * .pi), toZ: CGFloat(35.0 / 180.0 * .pi))
    }
    @objc func cancelTapped() {
        hideAlertView()
        alertViewDelegate?.cancelTapped?()
    }
    func show(type: AlertType = .alert, title: String, description: String, gradientOpacity: Float = 0.9, confirmText: String? = nil, cancelText: String? = nil) {
        alertType = type
        gradientLayer.opacity = gradientOpacity
        if alertType == .request {
            configureCancelButton(confirmText: confirmText, cancelText: cancelText)
        }
        ButtonHaptic.generateSoftHaptic()
        dismissKeyboard()
        headingTitle = title
        descriptionTitle = description
        addDescriptionLabelText()
        addHeadingLabelText()
        okButtonTopConstraint.constant = description == "" ?
        LayoutConstants.Spacing.spacing0x : -LayoutConstants.Spacing.spacing3x
        okButtonBottomConstraint.constant = type == .request ?
        -LayoutConstants.Spacing.spacing10x3Quarter : -LayoutConstants.Spacing.spacing3x
        if let alertViewDelegate = self.alertViewDelegate, (alertViewDelegate.alertViewPresent != nil) {
            alertViewDelegate.alertViewPresent!()
        }
        /// Testing displaying view over window, need to remove this commented code when we know it works for all cases
        //if let viewController = viewController {
            //viewController.view.addSubview(self)
        if let window = UIApplication.shared.windows.filter({$0.isKeyWindow}).first {
            window.addSubview(self)
            showAnimation(fromY: CGPoint(x: UIScreen.main.bounds.width - 200, y: -self.frame.size.height/2),
                          toY: CGPoint(x: UIScreen.main.bounds.width / 2, y: self.frame.size.height/2 + 25),
                          isShowing: true,
                          fromZ: CGFloat(35.0 / 180.0 * .pi), toZ: CGFloat(-5.0 / 180.0 * .pi))
        }
    }
    private func configureCancelButton(confirmText: String?, cancelText: String?) {
        okButton.setTitle(confirmText != nil ? confirmText! : NSLocalizedString("Confirm", comment: ""), for: .normal)
        cancelButton.setTitle(cancelText != nil ? cancelText! : NSLocalizedString("Cancel", comment: ""), for: .normal)
        cancelButton.setTitleColor(.white, for: .normal)
        cancelButton.titleLabel?.font = UIFontMetrics.default.scaledFont(for: AlertFonts.smallBody!.applyBold())
        cancelButton.backgroundColor = Colors.midDarkGrey
        cancelButton.addTarget(self, action: #selector(cancelTapped), for: .touchUpInside)
        cancelButton.layer.cornerRadius = 10
        alertView.addSubview(cancelButton)
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cancelButton.leadingAnchor.constraint(equalTo: alertView.leadingAnchor,
                                              constant: LayoutConstants.Spacing.spacing3x),
            cancelButton.trailingAnchor.constraint(equalTo: alertView.trailingAnchor,
                                               constant: -LayoutConstants.Spacing.spacing3x),
            cancelButton.bottomAnchor.constraint(equalTo: alertView.bottomAnchor,
                                             constant: -LayoutConstants.Spacing.spacing3x),
            cancelButton.heightAnchor.constraint(equalToConstant: LayoutConstants.Height.large)
        ])
    }
    func showAnimation(fromY: CGPoint, toY: CGPoint,
                       isShowing: Bool, fromZ: CGFloat, toZ: CGFloat) {
        UIView.animate(withDuration: 0.2) {
            self.alertView.alpha = isShowing ? 1 : 0
        }
        let animation = CABasicAnimation(keyPath: "transform.rotation.z")
        animation.fromValue = fromZ
        animation.toValue = toZ
        animation.duration = 0.2
        let moveAnimation = CABasicAnimation(keyPath: "position")
        moveAnimation.fromValue = fromY
        moveAnimation.toValue = toY
        moveAnimation.duration = 0.2
        let animationGroup = CAAnimationGroup()
        animationGroup.duration = 0.2
        animationGroup.animations = [moveAnimation, animation]
        CATransaction.begin()
        CATransaction.setCompletionBlock {
            if !isShowing {
                self.hide()
            }
        }
        alertView.layer.add(animationGroup, forKey: "dropAndTilt")
        CATransaction.commit()
    }
    func dismissKeyboard() {
        viewController?.view.endEditing(true)
    }
    func hide() {
        /// Testing displaying view over window, need to remove this commented code when we know it works for all cases
        // if let viewController = viewController {
        if let window = UIApplication.shared.windows.filter({$0.isKeyWindow}).first {

            if let alertViewDelegate = self.alertViewDelegate,
                (alertViewDelegate.alertViewOkPressed != nil && isOkayCallbacked) {
                alertViewDelegate.alertViewOkPressed!()
            }

            if let alertViewDelegate = self.alertViewDelegate, (alertViewDelegate.alertViewDisappear != nil) {
                alertViewDelegate.alertViewDisappear!()
            }

            DispatchQueue.main.async {
                /// Testing displaying view over window, need to remove this commented code when we know it works for all cases
                // for view in viewController.view.subviews  where view is Self {
                for view in window.subviews  where view is Self {
                    view.removeFromSuperview()
                    view.layer.removeAllAnimations()
                    return
                }
            }
        }
    }
}
enum AlertType {
    case request
    case alert
}


struct ButtonHaptic {

    static func generateSoftHaptic() {
        let generator = UIImpactFeedbackGenerator(style: .soft)
        generator.prepare()
        generator.impactOccurred()
    }

    static func generateMediumHaptic() {
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.prepare()
        generator.impactOccurred()
    }

    static func generateHeavyHaptic() {
        let generator = UIImpactFeedbackGenerator(style: .heavy)
        generator.prepare()
        generator.impactOccurred()
    }
}

extension UILabel {

    func setText(_ text: String, spacing: CGFloat = 0.96) {
        let attributedString = NSMutableAttributedString(string: text)
        attributedString.addAttribute(NSAttributedString.Key.kern, value: spacing, range: NSRange(location: 0, length: attributedString.length))
        self.attributedText = attributedString
    }

}
