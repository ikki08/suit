
import Foundation
import UIKit

extension UIView {
    func circleSide() {
        self.setRadius(radius: self.frame.size.height/2)
    }
    
    func setRadius(radius: CGFloat) {
        self.layer.cornerRadius = radius;
        self.layer.masksToBounds = true;
    }
    
    func shadowStyle(with radius: CGFloat) {
        self.setRadius(radius: radius)
        
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        self.layer.shadowOpacity = 0.24
        self.layer.shadowRadius = 4.0
    }
}
