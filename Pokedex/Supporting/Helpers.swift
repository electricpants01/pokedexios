//
//  Helpers.swift
//  Pokedex
//
//  Created by Cristian Misael Almendro Lazarte on 5/5/21.
//

import Foundation
import UIKit

class Helpers {
   static func createGradientImage(_ targetView: UIView,
                                   _ imageToGradient: UIImageView ,
                                   _ startColor: UIColor,
                                   _ endColor: UIColor,
                                   _ startAlpha: CGFloat,
                                   _ endAlpha: CGFloat,
                                   _ startPoint: CGPoint,
                                   _ endPoint: CGPoint) {
        targetView.layer.sublayers?.forEach { $0.removeFromSuperlayer() }
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        gradientLayer.frame = targetView.bounds
        gradientLayer.colors = [startColor.withAlphaComponent(startAlpha).cgColor, endColor.withAlphaComponent(endAlpha).cgColor, endColor.cgColor]
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
        targetView.layer.addSublayer(gradientLayer)
        targetView.addSubview(imageToGradient)
        targetView.layer.mask = imageToGradient.layer
    }
    static func createGradientText(_ targetView: UIView,
                                   _ labelText: UILabel,
                                   _ startColor: UIColor,
                                   _ endColor: UIColor,
                                   _ startAlpha: CGFloat,
                                   _ endAlpha: CGFloat,
                                   _ startPoint: CGPoint,
                                   _ endPoint: CGPoint) {
         targetView.layer.sublayers?.forEach { $0.removeFromSuperlayer() }
         let gradientLayer: CAGradientLayer = CAGradientLayer()
         gradientLayer.frame = targetView.bounds
         gradientLayer.colors = [startColor.withAlphaComponent(startAlpha).cgColor, endColor.withAlphaComponent(endAlpha).cgColor, endColor.cgColor]
         gradientLayer.startPoint = startPoint
         gradientLayer.endPoint = endPoint
         targetView.layer.addSublayer(gradientLayer)
        let strokeTextAttributes = [
            NSAttributedString.Key.strokeColor :startColor,
          NSAttributedString.Key.foregroundColor : UIColor.clear,
            NSAttributedString.Key.strokeWidth : 1.8,
            NSAttributedString.Key.font : UIFont(name: Constants.FontTypes.displayBold, size: 100) as Any
        ]
          as [NSAttributedString.Key : Any]
        labelText.attributedText = NSMutableAttributedString(string: labelText.text!, attributes: strokeTextAttributes)
         targetView.addSubview(labelText)
         targetView.layer.mask = labelText.layer
     }
    static func getIdFormatted(id: String) -> String {
        let size = id.count
        switch size {
        case 1:
            return "#00\(id)"
        case 2:
            return "#0\(id)"
        default:
            return "#\(id)"
        }
    }
}
