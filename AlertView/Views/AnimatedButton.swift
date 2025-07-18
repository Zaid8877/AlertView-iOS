//
//  AnimatedButton.swift
//  AlertView
//
//  Created by Zaid Tayyab on 09/10/2023.
//

import UIKit

class AnimatedButton: UIButton {

    var indexPath: IndexPath?

    func UIViewTouchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
    }

    func UIViewTouchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
    }

    override open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIView.animate(
            withDuration: 0.08,
            delay: 0,
            animations: {self.transform = CGAffineTransform(scaleX: 0.93, y: 0.93)
            })
        UIViewTouchesBegan(touches, with: event)
    }

    override open func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIView.animate(
            withDuration: 0.3,
            delay: 0.08,
            usingSpringWithDamping: 0.3,
            initialSpringVelocity: 1,
            animations: {self.transform = CGAffineTransform(scaleX: 1, y: 1)}
        )
        UIViewTouchesEnded(touches, with: event)
    }

    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIView.animate(
            withDuration: 0.3,
            delay: 0.08,
            usingSpringWithDamping: 0.3,
            initialSpringVelocity: 1,
            animations: {self.transform = CGAffineTransform(scaleX: 1, y: 1)}
        )
        super.touchesCancelled(touches, with: event)
    }

}
