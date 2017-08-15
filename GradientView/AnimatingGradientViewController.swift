//
//  AnimatingGradientViewController.swift
//  GradientView
//
//  Created by Harry Cao on 20/6/17.
//  Copyright © 2017 HarryCodes. All rights reserved.
//

import UIKit

class AnimatingGradientViewController: UIViewController, CAAnimationDelegate {
  let duration = 2.0
  let gradientLayer = CAGradientLayer()
  
  var currentColorArray = [CGColor]()
  var nextColorArray = [CGColor]()
  
  var colorArrays: [[CGColor]] = [
    [#colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1).cgColor, #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1).cgColor],
    [ #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1).cgColor, #colorLiteral(red: 0.3176470697, green: 0.07450980693, blue: 0.02745098062, alpha: 1).cgColor],
    [ #colorLiteral(red: 0.1294117719, green: 0.2156862766, blue: 0.06666667014, alpha: 1).cgColor,  #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1).cgColor],
    [#colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1).cgColor,  #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1).cgColor],
    [ #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1).cgColor,  #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1).cgColor],
    [ #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1).cgColor,  #colorLiteral(red: 0.3098039329, green: 0.2039215714, blue: 0.03921568766, alpha: 1).cgColor],
    [ #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1).cgColor,  #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1).cgColor],
    [ #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1).cgColor,  #colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1).cgColor],
    [ #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1).cgColor,  #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1).cgColor],
    [ #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1).cgColor,  #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1).cgColor],
    [ #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1).cgColor, #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1).cgColor],
    [ #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1).cgColor,  #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1).cgColor],
  ]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupGradient()
    
    animateGraditent()
  }
  
  func setupGradient() {
    currentColorArray = colorArrays[0]
    gradientLayer.colors = currentColorArray
    
    // diagonal gradient (change t0 pi/2 for horizontal gradient
    // 4 parameter: angle of rotation, 1 if want to rotate around x, 1 if rotate around y, 1 if want to rotate around z
    // rotate clockwise
    gradientLayer.transform = CATransform3DMakeRotation(-CGFloat.pi/2, 0, 0, 1)
    
    gradientLayer.frame = self.view.frame
    
    self.view.layer.insertSublayer(gradientLayer, at: 0)
  }
  
  @objc
  func animateGraditent() {
    nextColorArray = colorArrays.removeLast()
    
    let animation = CABasicAnimation(keyPath: "colors")
    animation.fromValue = currentColorArray
    animation.toValue = nextColorArray
    animation.duration = duration
    animation.fillMode = kCAFillModeForwards
    animation.isRemovedOnCompletion = false
    animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
    animation.delegate = self
    gradientLayer.add(animation, forKey: "colors")
  }
  
  func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
    currentColorArray = nextColorArray
    colorArrays.insert(currentColorArray, at: 0)
    
    animateGraditent()
  }
}
