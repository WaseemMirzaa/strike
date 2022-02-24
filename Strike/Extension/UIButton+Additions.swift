//
//  UIButton+Additions.swift
//  TradeAir
//
//  Created by Adeel on 08/10/2019.
//  Copyright © 2019 Buzzware. All rights reserved.
//

import UIKit

class UIButton_Additions: NSObject {

}
@IBDesignable
class UIButtonGradient:UIButton{
  // the gradient start colour
  @IBInspectable var startColor: UIColor? {
    didSet {
      updateGradient()
    }
  }
  // the gradient end colour
  @IBInspectable var endColor: UIColor? {
    didSet {
      updateGradient()
    }
  }
  // the gradient angle, in degrees anticlockwise from 0 (east/right)
  @IBInspectable var angle: CGFloat = 270 {
    didSet {
      updateGradient()
    }
  }
  // the gradient layer
  private var gradient: CAGradientLayer?
  // initializers
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    installGradient()
  }
  override init(frame: CGRect) {
    super.init(frame: frame)
    installGradient()
  }
  // Create a gradient and install it on the layer
  private func installGradient() {
    // if there's already a gradient installed on the layer, remove it
    if let gradient = self.gradient {
      gradient.removeFromSuperlayer()
    }
    let gradient = createGradient()
    self.layer.addSublayer(gradient)
    self.gradient = gradient
  }
  // Update an existing gradient
  private func updateGradient() {
    if let gradient = self.gradient {
      let startColor = self.startColor ?? UIColor.clear
      let endColor = self.endColor ?? UIColor.clear
      gradient.colors = [startColor.cgColor, endColor.cgColor]
      let (start, end) = gradientPointsForAngle(self.angle)
      gradient.startPoint = start
      gradient.endPoint = end
    }
  }
  // create gradient layer
  private func createGradient() -> CAGradientLayer {
    let gradient = CAGradientLayer()
    gradient.frame = self.bounds
    return gradient
  }
  // create vector pointing in direction of angle
  private func gradientPointsForAngle(_ angle: CGFloat) -> (CGPoint, CGPoint) {
    // get vector start and end points
    let end = pointForAngle(angle)
    //let start = pointForAngle(angle+180.0)
    let start = oppositePoint(end)
    // convert to gradient space
    let p0 = transformToGradientSpace(start)
    let p1 = transformToGradientSpace(end)
    return (p0, p1)
  }
  // get a point corresponding to the angle
  private func pointForAngle(_ angle: CGFloat) -> CGPoint {
    // convert degrees to radians
    let radians = angle * .pi / 180.0
    var x = cos(radians)
    var y = sin(radians)
    // (x,y) is in terms unit circle. Extrapolate to unit square to get full vector length
    if (fabs(x) > fabs(y)) {
      // extrapolate x to unit length
      x = x > 0 ? 1 : -1
      y = x * tan(radians)
    } else {
      // extrapolate y to unit length
      y = y > 0 ? 1 : -1
      x = y / tan(radians)
    }
    return CGPoint(x: x, y: y)
  }
  // transform point in unit space to gradient space
  private func transformToGradientSpace(_ point: CGPoint) -> CGPoint {
    // input point is in signed unit space: (-1,-1) to (1,1)
    // convert to gradient space: (0,0) to (1,1), with flipped Y axis
    return CGPoint(x: (point.x + 1) * 0.5, y: 1.0 - (point.y + 1) * 0.5)
  }
  // return the opposite point in the signed unit square
  private func oppositePoint(_ point: CGPoint) -> CGPoint {
    return CGPoint(x: -point.x, y: -point.y)
  }
  // ensure the gradient gets initialized when the view is created in IB
  override func prepareForInterfaceBuilder() {
    super.prepareForInterfaceBuilder()
    installGradient()
    updateGradient()
  }
}
extension UIButton {
    enum iconPosition {
        case center,left,right
    }
    enum roundingCorner {
        case top,bottom,left,right
    }
    enum arrowDirection {
        case up,down,linear,left,right,check,uncheck,dot
    }
    
    func drawLine(iconPosition position: iconPosition, direction:arrowDirection) {
        switch position {
        case .center:
            let center = self.center
            let fromPoint = CGPoint(x: center.x - 20, y: center.y)
            let toPoint = CGPoint(x: center.x + 20, y: center.y)
            self.drawLine(onLayer: self.layer, fromPoint: fromPoint, toPoint: toPoint, arrowDirection: direction)
        case .left:
            break
        case .right:
            break
            
        }
    }
    
    fileprivate func drawLine(onLayer layer: CALayer, fromPoint start: CGPoint, toPoint end: CGPoint, arrowDirection direction: arrowDirection) {
        let startPoint = start
        let center = self.center
        var lineCenter = CGPoint()
        switch direction {
        case .up:
            if layer.sublayers!.count > 0 {
                for lay in layer.sublayers! {
                    lay.removeFromSuperlayer()
                }
            }
            lineCenter = CGPoint(x: center.x, y: start.y - 8)
        case .down:
            if layer.sublayers == nil {
                lineCenter = CGPoint(x: center.x, y: start.y + 8)
                break }
            for lay in layer.sublayers! {
                lay.removeFromSuperlayer()
            }
            lineCenter = CGPoint(x: center.x, y: start.y + 8)
        case .linear:
            for lay in layer.sublayers! {
                lay.removeFromSuperlayer()
            }
            lineCenter = center
        case .left:
            break
        case .right:
            break
        case .check:
            break
        case .uncheck:
            break
        case .dot:
            break
            
        }
        
        let line = CAShapeLayer()
        let linePath = UIBezierPath()
        linePath.move(to: startPoint)
        linePath.addLine(to: lineCenter)
        linePath.move(to: lineCenter)
        linePath.addLine(to: end)
        line.path = linePath.cgPath
        line.lineWidth = 5
        line.lineCap = CAShapeLayerLineCap.round
        line.lineJoin = CAShapeLayerLineJoin.round
        line.fillColor = UIColor.red.cgColor
        line.opacity = 1.0
        line.strokeColor = UIColor.red.cgColor
        layer.addSublayer(line)
    }
    func drawCorner(roundTo: roundingCorner){
        switch roundTo {
        case .top:
            return self.layer.maskedCorners =  [.layerMinXMinYCorner,.layerMaxXMinYCorner]
        case .bottom:
            return self.layer.maskedCorners =  [.layerMinXMaxYCorner,.layerMaxXMaxYCorner]
        case .left:
            return self.layer.maskedCorners =  [.layerMinXMinYCorner,.layerMinXMaxYCorner]
        case .right:
            return self.layer.maskedCorners =  [.layerMaxXMinYCorner,.layerMaxXMaxYCorner]
        
        }
    }
}
