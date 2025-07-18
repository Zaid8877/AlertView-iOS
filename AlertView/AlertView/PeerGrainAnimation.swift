//
//  PeerGrainAnimation.swift
//  peer-ios
//
//  Created by Navon Hobby on 3/8/23.
//

import UIKit

class PeerGrainAnimation: UIImageView {
    private var grainType: GrainAnimationType?
    private var opacity: Float
    init(frame: CGRect, type: GrainAnimationType = .large, opacity: Float = 1.0) {
        self.opacity = opacity
        super.init(frame: frame)
        grainType = type
        grainAnimation()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func grainAnimation() {
        contentMode = .scaleAspectFill
        let cache = NSCache<NSString, UIImage>()
        let queue = DispatchQueue(label: "com.peer.imageLoadingQueue")
        queue.async {
            let imageArray = (0...5).compactMap { (ind) -> UIImage? in
                let imageName = "\(self.grainType?.imageName ?? "")\(ind).png"
                if let cachedImage = cache.object(forKey: imageName as NSString) {
                    return cachedImage
                } else {
                    if let image = UIImage(named: imageName) {
                        cache.setObject(image, forKey: imageName as NSString)
                        return image
                    }
                    return nil
                }
            }
            DispatchQueue.main.async {
                let animation = UIImage.animatedImage(with: imageArray, duration: 0.3)
                self.layer.opacity = self.opacity
                self.image = animation
            }
        }
    }

}
enum GrainAnimationType {
    case small
    case large
    var imageName: String {
        switch self {
        case .small:
            return "noise"
        case .large:
            return "noiseLarge"
        }
    }
}
