//
//  CAGradientLayerVC.swift
//  GradientView
//
//  Created by Harry Cao on 19/6/17.
//  Copyright © 2017 HarryCodes. All rights reserved.
//

import UIKit

class CAGradientLayerVC: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupGradient()
  }
  
  func setupGradient() {
    let gradientLayer = CAGradientLayer()
    
    gradientLayer.colors = [ UIColor.green.cgColor, UIColor.cyan.cgColor, UIColor.purple.cgColor]
    // greenish at 0, blueish at 70%, purpleish at 100%
    gradientLayer.locations = [0, 0.7, 1]
    // diagonal gradient (change t0 pi/2 for horizontal gradient
    // 4 parameter: angle of rotation, 1 if want to rotate around x, 1 if rotate around y, 1 if want to rotate around z
    // rotate clockwise
    gradientLayer.transform = CATransform3DMakeRotation(-CGFloat.pi/2, 0, 0, 1)
    
    gradientLayer.frame = self.view.frame
    
    
    self.view.layer.insertSublayer(gradientLayer, at: 0)
  }
}
