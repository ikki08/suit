//
//  UIImageView+Extension.swift
//  suit
//
//  Created by Rizki Dwi Putra on 13/05/20.
//  Copyright © 2020 Rizki Dwi Putra. All rights reserved.
//

import UIKit
import SDWebImage

extension UIImageView {
    func setImage(urlString: String) {
        let imageCache = NSCache<NSString, UIImage>()
        if let cachedImage = imageCache.object(forKey: urlString as NSString) {
            self.image = cachedImage
        } else {
            self.sd_setImage(with: URL(string: urlString),
                             placeholderImage: UIImage(named: "avatar_placeholder"),
                             completed: { (image, _, _, _) -> Void in
                                guard let heroImage = image else { return }
                                imageCache.setObject(heroImage, forKey: urlString as NSString)
            })
        }
    }
}
