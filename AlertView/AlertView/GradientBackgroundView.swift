//
//  BackgroundView.swift
//  peer-ios
//
//  Created by Navon Hobby on 2/10/23.
//

import UIKit

class GradientBackgroundView: UIView {

    lazy var gradientLayer = createGradientLayer()
    lazy var grainAnimation = createGrainAnimatonView()

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
        gradientLayer.frame = bounds
    }

    func setupView() {
        layer.addSublayer(gradientLayer)
        addSubview(grainAnimation)
    }

    func createGradientLayer() -> CAGradientLayer {
        let gradientLayer = CAGradientLayer()
        gradientLayer.type = .radial
        gradientLayer.frame = bounds
        gradientLayer.colors = Colors.alertGradientColors
        gradientLayer.locations = [0.0, 0.0948, 0.1841, 0.3475, 0.5329, 0.7343, 1.0]
        gradientLayer.startPoint = CGPoint(x: 1, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        gradientLayer.opacity = 0.9
        let animation = CABasicAnimation(keyPath: "endPoint")
        animation.fromValue = CGPoint(x: 1, y: 0)
        animation.toValue = CGPoint(x: -0.9, y: 1.9)
        animation.duration = 0.5
        animation.isRemovedOnCompletion = false
        animation.fillMode = .both
        animation.repeatCount = 1
        gradientLayer.add(animation, forKey: "gradientAnimation")
        return gradientLayer
    }

    func createGrainAnimatonView() -> UIView {
        let grainAnimationView = PeerGrainAnimation(frame: bounds, type: .small, opacity: 0.9)
        grainAnimationView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return grainAnimationView
    }
}
