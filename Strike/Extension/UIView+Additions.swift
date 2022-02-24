//
//  UIView+Additions.swift
//  TradeAir
//
//  Created by Adeel on 17/09/2019.
//  Copyright © 2019 Buzzware. All rights reserved.
//

import UIKit

class UIView_Additions: UIView {

    override func draw(_ rect: CGRect) {
        self.layer.cornerRadius = rect.height/2
    }
}
@IBDesignable
class UIViewGradient:UIView{
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
extension UIView {
    
//    @IBInspectable
//    var backgroundImage: UIImage {
//        get {
//            return UIImage(named: "dashbg")!
//        }
//        set {
//            backgroundColor = UIColor.init(patternImage: newValue)
//        }
//    }
        @IBInspectable
        var cornerRadius: CGFloat {
            get {
                return layer.cornerRadius
            }
            set {
                layer.cornerRadius = newValue
            }
        }
    
        @IBInspectable
        var borderWidth: CGFloat {
            get {
                return layer.borderWidth
            }
            set {
                layer.borderWidth = newValue
            }
        }
    
        @IBInspectable
        var borderColor: UIColor? {
            get {
                if let color = layer.borderColor {
                    return UIColor(cgColor: color)
                }
                return nil
            }
            set {
                if let color = newValue {
                    layer.borderColor = color.cgColor
                } else {
                    layer.borderColor = nil
                }
            }
        }
    
        @IBInspectable
        var shadowRadius: CGFloat {
            get {
                return layer.shadowRadius
            }
            set {
                layer.shadowRadius = newValue
            }
        }
    
        @IBInspectable
        var shadowOpacity: Float {
            get {
                return layer.shadowOpacity
            }
            set {
                layer.shadowOpacity = newValue
            }
        }
    
        @IBInspectable
        var shadowOffset: CGSize {
            get {
                return layer.shadowOffset
            }
            set {
                layer.shadowOffset = newValue
            }
        }
    
        @IBInspectable
        var shadowColor: UIColor? {
            get {
                if let color = layer.shadowColor {
                    return UIColor(cgColor: color)
                }
                return nil
            }
            set {
                if let color = newValue {
                    layer.shadowColor = color.cgColor
                } else {
                    layer.shadowColor = nil
                }
            }
        }
    @IBInspectable
    var maskToBounds: Bool {
        get {
            return layer.masksToBounds
        }
        set {
            layer.masksToBounds = newValue
        }
    }
}
extension UIView{
    class func loadFromNibNamed(_ nibNamed: String, bundle : Bundle? = nil) -> UIView? {
        return UINib(
            nibName: nibNamed,
            bundle: bundle
            ).instantiate(withOwner: nil, options: nil)[0] as? UIView
    }
    
    //
    func sunriseGradientBackground(_ direction: GradientDirection = .topBottom, startAlpha:CGFloat = 1, endAlpha:CGFloat = 1) {
        removeExistingGradientLayer()
        let gradient        = CAGradientLayer()
        gradient.name       = "gradient"
        gradient.masksToBounds  = true
        gradient.frame      = CGRect(origin: CGPoint.zero, size: CGSize(width: frame.width+500, height: frame.height))
        //        gradient.frame = self.frame
        
        
        //      135 Degree
        //        1st #007061 #009485 #00C4B0
        
        gradient.colors = [UIColor(hex: "#007061").cgColor,
                           UIColor(hex: "#009485").cgColor,
                           UIColor(hex: "#00C4B0").cgColor]
        
        gradient.locations  = [0,1,1]
        switch direction {
        case .topBottom: break
        case .leftRight: gradient.startPoint = CGPoint(x: 0, y: 0.5); gradient.endPoint = CGPoint(x: 1, y: 0.5)
        case .rightLeft: gradient.startPoint = CGPoint(x: 1, y: 0.5); gradient.endPoint = CGPoint(x: 0, y: 0.5)
        }
        layer.insertSublayer(gradient, at: 0)
    }
    
    func removeExistingGradientLayer() {
        if layer.sublayers != nil {
            for l in layer.sublayers! {
                if l is CAGradientLayer && (l as! CAGradientLayer).name == "gradient" {
                    (l as! CAGradientLayer).removeFromSuperlayer()
                }
            }
        }
    }
    
    func setGradient(colors: [CGColor], angle: Float = 0) {
        let gradientLayerView: UIView = UIView(frame: CGRect(x:0, y: 0, width: bounds.width, height: bounds.height))
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = gradientLayerView.bounds
        gradient.colors = colors
        
        let alpha: Float = angle / 360
        //        let startPointX = powf(
        //            sinf(2 * Float.pi * ((alpha + 0.75) / 2)),
        //            2
        //        )
        //        let startPointY = powf(
        //            sinf(2 * Float.pi * ((alpha + 0) / 2)),
        //            2
        //        )
        //        let endPointX = powf(
        //            sinf(2 * Float.pi * ((alpha + 0.25) / 2)),
        //            2
        //        )
        //        let endPointY = powf(
        //            sinf(2 * Float.pi * ((alpha + 0.5) / 2)),
        //            2
        //        )
        
        gradient.endPoint = CGPoint(x: CGFloat(0),y: CGFloat(0))
        gradient.startPoint = CGPoint(x: CGFloat(1), y: CGFloat(1))
        
        gradientLayerView.layer.insertSublayer(gradient, at: 0)
        layer.insertSublayer(gradientLayerView.layer, at: 0)
    }
    
    func makeCircle() {
        layer.cornerRadius      = max(frame.size.height, frame.size.width) / 2
        layer.masksToBounds     = true
    }
    
    class func autoHeight(_ view: UIView, constraint: NSLayoutConstraint) {
        constraint.constant = view.sizeThatFits(CGSize(width: view.frame.size.width, height: CGFloat(MAXFLOAT))).height
    }
    
    class func autoWidth(_ view: UIView, constraint: NSLayoutConstraint) {
        constraint.constant = view.sizeThatFits(CGSize(width: CGFloat(MAXFLOAT), height: view.frame.size.height)).width
    }
    
    // OUTPUT 1
    func dropShadow(scale: Bool = true) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: -1, height: 1)
        self.layer.shadowRadius = 1
        
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
    // OUTPUT 2
    func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = offSet
        self.layer.shadowRadius = radius
        //        var bounds = self.bounds
        //        bounds.size.width = bounds.size.width + 50
        //        self.bounds = bounds
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
    public class func fromNib<T: UIView>(from bundle: Bundle = Bundle.main) -> T {
        return bundle.loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
      }
}
